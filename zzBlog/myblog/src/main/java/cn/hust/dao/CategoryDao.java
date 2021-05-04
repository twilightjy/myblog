package cn.hust.dao;


import cn.hust.dto.CategoryDTO;
import cn.hust.entity.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author zz
 * @since 2021-04-13
 */
@Repository
public interface CategoryDao extends BaseMapper<Category> {
    /**
     * 查询分类和对应文章数量
     * @return 分类集合
     */
    List<CategoryDTO> listCategoryDTO();
}
