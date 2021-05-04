package cn.hust.service.impl;

import cn.hust.dao.ResourceDao;
import cn.hust.dao.RoleResourceDao;
import cn.hust.dto.ResourceDTO;
import cn.hust.dto.labelOptionDTO;
import cn.hust.entity.Resource;
import cn.hust.handler.FilterInvocationSecurityMetadataSourceImpl;
import cn.hust.service.ResourceService;
import cn.hust.utils.BeanCopyUtil;
import cn.hust.vo.ResourceVO;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.stream.Collectors;

import static cn.hust.constant.CommonConst.FALSE;

/**
 * @author zz
 * @since 2021-04-13
 */
@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceDao, Resource> implements ResourceService {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private RoleResourceDao roleResourceDao;
    @Autowired
    private FilterInvocationSecurityMetadataSourceImpl filterInvocationSecurityMetadataSource;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importSwagger() {
        // 删除所有资源
        this.remove(null);
        roleResourceDao.delete(null);
        List<Resource> resourceList = new ArrayList<>();
        //getForObject() 发送一个HTTP GET请求，返回的请求体将映射为一个对象,如果是微服务Feign封装后更便捷，本项目没有用微服务架构
        Map<String, Object> data = restTemplate.getForObject("http://localhost:8080/v2/api-docs", Map.class);
        // 获取所有模块
        List<Map<String, String>> tagList = (List<Map<String, String>>) data.get("tags");
        tagList.forEach(item -> {
            Resource resource = Resource.builder()
                    .resourceName(item.get("name"))
                    .createTime(new Date())
                    .updateTime(new Date())
                    .isDisable(FALSE)
                    .isAnonymous(FALSE)
                    .build();
            resourceList.add(resource);
        });
        this.saveBatch(resourceList);
        Map<String, Integer> permissionMap = resourceList.stream()
                .collect(Collectors.toMap(Resource::getResourceName, Resource::getId));
        resourceList.clear();
        // 获取所有接口
        Map<String, Map<String, Map<String, Object>>> path = (Map<String, Map<String, Map<String, Object>>>) data.get("paths");
        path.forEach((url, value) -> value.forEach((requestMethod, info) -> {
            String permissionName = info.get("summary").toString();
            List<String> tag = (List<String>) info.get("tags");
            Integer parentId = permissionMap.get(tag.get(0));
            Resource resource = Resource.builder()
                    .resourceName(permissionName)
                    .url(url.replaceAll("\\{[^}]*\\}", "*"))
                    .parentId(parentId)
                    .requestMethod(requestMethod.toUpperCase())
                    .isDisable(0)
                    .isAnonymous(0)
                    .createTime(new Date())
                    .updateTime(new Date())
                    .build();
            resourceList.add(resource);
        }));
        this.saveBatch(resourceList);
    }

    @Override
    public void saveOrUpdateResource(ResourceVO resourceVO) {
        // 更新资源信息
        Resource resource = BeanCopyUtil.copyObject(resourceVO, Resource.class);
        resource.setCreateTime(Objects.isNull(resource.getId()) ? new Date() : null);
        // 重新加载角色资源信息
        filterInvocationSecurityMetadataSource.clearDataSource();
        this.saveOrUpdate(resource);
    }

    @Override
    public List<ResourceDTO> listResources() {
        // 查询资源列表
        List<Resource> resourceList = this.list(null);
        // 获取所有模块
        List<Resource> parentList = listResourceModule(resourceList);
        // 根据父id分组获取模块下的资源
        Map<Integer, List<Resource>> childrenMap = listResourceChildren(resourceList);
        // 绑定模块下的所有接口
        return parentList.stream().map(item -> {
            ResourceDTO resourceDTO = BeanCopyUtil.copyObject(item, ResourceDTO.class);
            List<ResourceDTO> childrenList = BeanCopyUtil.copyList(childrenMap.get(item.getId()), ResourceDTO.class);
            resourceDTO.setChildren(childrenList);
            return resourceDTO;
        }).collect(Collectors.toList());
    }

    @Override
    public List<labelOptionDTO> listResourceOption() {
        // 查询资源列表
        List<Resource> resourceList = this.list(new LambdaQueryWrapper<Resource>()
                .select(Resource::getId, Resource::getResourceName, Resource::getParentId)
                .eq(Resource::getIsAnonymous, FALSE)
                .eq(Resource::getIsDisable, FALSE));
        // 获取所有模块
        List<Resource> parentList = listResourceModule(resourceList);
        // 根据父id分组获取模块下的资源
        Map<Integer, List<Resource>> childrenMap = listResourceChildren(resourceList);
        // 组装父子数据
        return parentList.stream().map(item -> {
            List<labelOptionDTO> list = new ArrayList<>();
            List<Resource> children = childrenMap.get(item.getId());
            if (Objects.nonNull(children)) {
                list = children.stream()
                        .map(resource -> labelOptionDTO.builder()
                                .id(resource.getId())
                                .label(resource.getResourceName())
                                .build())
                        .collect(Collectors.toList());
            }
            return labelOptionDTO.builder()
                    .id(item.getId())
                    .label(item.getResourceName())
                    .children(list)
                    .build();
        }).collect(Collectors.toList());
    }

    /**
     * 获取模块下的所有资源
     *
     * @param resourceList 资源列表
     * @return 模块资源
     */
    private Map<Integer, List<Resource>> listResourceChildren(List<Resource> resourceList) {
        return resourceList.stream()
                .filter(item -> Objects.nonNull(item.getParentId()))
                .collect(Collectors.groupingBy(Resource::getParentId));
    }

    /**
     * 获取所有资源模块
     *
     * @param resourceList 资源列表
     * @return 资源模块列表
     */
    private List<Resource> listResourceModule(List<Resource> resourceList) {
        return resourceList.stream()
                .filter(item -> Objects.isNull(item.getParentId()))
                .collect(Collectors.toList());
    }

}
