package cn.hust.dao;


import cn.hust.dto.*;
import cn.hust.entity.Article;
import cn.hust.vo.ConditionVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author zz
 * @since 2021-04-13
 */
@Repository
public interface ArticleDao extends BaseMapper<Article> {

    /**
     * 查询首页文章
     *
     * @param current 当前页码
     * @return 首页文章集合
     */
    List<ArticleHomeDTO> listArticles(Long current);

    /**
     * 根据id查询文章
     *
     * @param articleId 文章id
     * @return 文章
     */
    ArticleDTO getArticleById(Integer articleId);

    /**
     * 根据指定条件查询文章
     * 使用动态SQL编写，主要运用if-where标签
     * @param condition 条件 可以是不同组合的条件（只要被ConditionVO涵盖即可)
     * @return 文章集合
     */
    List<ArticlePreviewDTO> listArticlesByCondition(@Param("condition") ConditionVO condition);

    /**
     * 查询后台文章
     *
     * @param condition 条件
     * @return 后台文章集合
     */
    List<ArticleBackDTO> listArticleBacks(@Param("condition") ConditionVO condition);

    /**
     * 查询后台文章总量
     *
     * @param condition 条件
     * @return 文章总量
     */
    Integer countArticleBacks(@Param("condition") ConditionVO condition);

    /**
     * 查询文章排行
     *
     * @param articleIdList
     * @return
     */
    List<Article> listArticleRank(@Param("articleIdList") List<Integer> articleIdList);

    /**
     * 查看文章的推荐文章
     * @param articleId 文章id
     * @return 推荐文章
     */
    List<ArticleRecommendDTO> listArticleRecommends(@Param("articleId") Integer articleId);

}
