package cn.hust.service;

import cn.hust.dto.PageDTO;
import cn.hust.dto.RoleDTO;
import cn.hust.dto.UserRoleDTO;
import cn.hust.entity.Role;
import cn.hust.vo.ConditionVO;
import cn.hust.vo.RoleVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


/**
 * @author zz
 * @since 2021-04-13
 */
public interface RoleService extends IService<Role> {
    /**
     * 获取用户角色选项
     *
     * @return 角色
     */
    List<UserRoleDTO> listUserRoles();

    /**
     * 查询角色列表
     *
     * @param conditionVO 条件
     * @return 角色列表
     */
    PageDTO<RoleDTO> listRoles(ConditionVO conditionVO);

    /**
     * 保存或更新角色
     *
     * @param roleVO 角色
     */
    void saveOrUpdateRole(RoleVO roleVO);

    /**
     * 删除角色
     * @param roleIdList 角色id列表
     */
    void deleteRoles(List<Integer> roleIdList);


}
