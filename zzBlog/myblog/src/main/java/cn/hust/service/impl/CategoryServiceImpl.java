package cn.hust.service.impl;


import cn.hust.dao.ArticleDao;
import cn.hust.dao.CategoryDao;
import cn.hust.dto.CategoryDTO;
import cn.hust.dto.PageDTO;
import cn.hust.entity.Article;
import cn.hust.entity.Category;
import cn.hust.exception.ServeException;
import cn.hust.service.CategoryService;
import cn.hust.vo.CategoryVO;
import cn.hust.vo.ConditionVO;
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
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, Category> implements CategoryService {
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private ArticleDao articleDao;

    @Override
    public PageDTO<CategoryDTO> listCategories() {
        return new PageDTO<>(categoryDao.listCategoryDTO(), categoryDao.selectCount(null));
    }

    @Override
    public PageDTO<Category> listCategoryBackDTO(ConditionVO condition) {
        // 分页查询分类列表 like模糊查询
        Page<Category> page = new Page<>(condition.getCurrent(), condition.getSize());
        LambdaQueryWrapper<Category> categoryLambdaQueryWrapper = new LambdaQueryWrapper<Category>()
                .select(Category::getId, Category::getCategoryName, Category::getCreateTime)
                .like(StringUtils.isNotBlank(condition.getKeywords()), Category::getCategoryName, condition.getKeywords())
                .orderByDesc(Category::getId);
        Page<Category> categoryPage = categoryDao.selectPage(page, categoryLambdaQueryWrapper);
        //封装为PageDTO
        return new PageDTO<>(categoryPage.getRecords(), (int) categoryPage.getTotal());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteCategory(List<Integer> categoryIdList) {
        // 查询分类id下是否有文章 in查询
        Integer count = articleDao.selectCount(new LambdaQueryWrapper<Article>()
                .in(Article::getCategoryId, categoryIdList));
        //count不为0则不能删除分类，防止误删文章
        if (count > 0) {
            throw new ServeException("删除失败，该分类下存在文章");
        }
        //批量删除
        categoryDao.deleteBatchIds(categoryIdList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrUpdateCategory(CategoryVO categoryVO) {
        // 首先查询该分类名。判断分类名是否重复
        Integer count = categoryDao.selectCount(new LambdaQueryWrapper<Category>()
                .eq(Category::getCategoryName, categoryVO.getCategoryName()));
        //count为1则重复
        if (count > 0) {
            throw new ServeException("分类名已存在");
        }
        //若不重复则根据传来的CategoryVO中的数据build新的Category
        Category category = Category.builder()
                .id(categoryVO.getId())
                .categoryName(categoryVO.getCategoryName())
                .createTime(Objects.isNull(categoryVO.getId()) ? new Date() : null)
                .build();
        //存入mysql
        this.saveOrUpdate(category);
    }
}
