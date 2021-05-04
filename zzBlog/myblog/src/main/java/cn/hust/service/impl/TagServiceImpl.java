package cn.hust.service.impl;

import cn.hust.dao.ArticleTagDao;
import cn.hust.dao.TagDao;
import cn.hust.dto.PageDTO;
import cn.hust.dto.TagDTO;
import cn.hust.entity.ArticleTag;
import cn.hust.entity.Tag;
import cn.hust.exception.ServeException;
import cn.hust.service.TagService;
import cn.hust.utils.BeanCopyUtil;
import cn.hust.vo.ConditionVO;
import cn.hust.vo.TagVO;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @author zz
 * @since 2021-04-13
 */
@Service
public class TagServiceImpl extends ServiceImpl<TagDao, Tag> implements TagService {
    @Autowired
    private TagDao tagDao;
    @Autowired
    private ArticleTagDao articleTagDao;

    @Override
    public PageDTO<TagDTO> listTags() {
        // 查询标签列表
        List<Tag> tagList = tagDao.selectList(new LambdaQueryWrapper<Tag>().select(Tag::getId, Tag::getTagName));
        // 转换DTO
        List<TagDTO> tagDTOList = BeanCopyUtil.copyList(tagList, TagDTO.class);
        // 查询标签数量
        Integer count = tagDao.selectCount(null);
        return new PageDTO<>(tagDTOList, count);
    }

    @Override
    public PageDTO<Tag> listTagBackDTO(ConditionVO condition) {
        // 分页查询标签列表
        Page<Tag> page = new Page<>(condition.getCurrent(), condition.getSize());
        //条件查询 模糊查询 根据时间降序排列（最新的在最前面）
        Page<Tag> tagPage = tagDao.selectPage(page, new LambdaQueryWrapper<Tag>()
                .select(Tag::getId, Tag::getTagName, Tag::getCreateTime)
                .like(StringUtils.isNotBlank(condition.getKeywords()), Tag::getTagName, condition.getKeywords())
                .orderByDesc(Tag::getCreateTime));
        //封装为DTO返回
        return new PageDTO<>(tagPage.getRecords(), (int) tagPage.getTotal());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteTag(List<Integer> tagIdList) {
        //查询标签下是否有文章
        Integer count = articleTagDao.selectCount(new LambdaQueryWrapper<ArticleTag>()
                .in(ArticleTag::getTagId, tagIdList));
        //count不为0说明有文章，业务要求防止误删文章，则抛出异常
        if (count > 0) {
            throw new ServeException("删除失败，该标签下存在文章");
        }
        tagDao.deleteBatchIds(tagIdList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrUpdateTag(TagVO tagVO) {
        //查询是否已存在同名标签,不重复创建
        Integer count = tagDao.selectCount(new LambdaQueryWrapper<Tag>()
                .eq(Tag::getTagName, tagVO.getTagName()));
        if (count > 0) {
            throw new ServeException("标签名已存在");
        }
        //不存在已创建的重名标签则build新的tag
        Tag tag = Tag.builder()
                .id(tagVO.getId())
                .tagName(tagVO.getTagName())
                .createTime(Objects.isNull(tagVO.getId()) ? new Date() : null)
                .build();
        this.saveOrUpdate(tag);
    }

}
