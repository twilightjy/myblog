package cn.hust.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.*;

/**
 * <p>
 * 
 * </p>
 *
 * @author zz
 * @since 2021-04-12
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("tb_article")
public class Article {

  /**
   * id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 作者
   */
  private Integer userId;

  /**
   * 文章分类
   */
  private Integer categoryId;

  /**
   * 文章缩略图
   */
  private String articleCover;

  /**
   * 标题
   */
  private String articleTitle;

  /**
   * 内容
   */
  private String articleContent;

  /**
   * 发表时间
   */
  private Date createTime;

  /**
   * 更新时间
   */
  private Date updateTime;

  /**
   * 是否置顶
   */
  private Integer isTop;

  /**
   * 是否为草稿
   */
  private Integer isDraft;

  /**
   * 状态码
   */
  private Integer isDelete;


}