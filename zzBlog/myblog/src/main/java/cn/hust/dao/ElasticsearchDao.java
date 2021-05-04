package cn.hust.dao;

import cn.hust.dto.ArticleSearchDTO;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

/**
 * @author zz
 * @since 2021-04-13
 */
@Repository
public interface ElasticsearchDao extends ElasticsearchRepository<ArticleSearchDTO, Integer> {
}
