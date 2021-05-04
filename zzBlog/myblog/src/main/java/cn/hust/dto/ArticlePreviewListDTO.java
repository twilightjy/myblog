package cn.hust.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**分类或标签下的文章列表
 * @author: zz
 * @date: 2021-04-13
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArticlePreviewListDTO {
    /**
     * 条件对应的文章列表
     */
    private List<ArticlePreviewDTO> articlePreviewDTOList;

    /**
     * 条件名
     */
    private String name;

}
