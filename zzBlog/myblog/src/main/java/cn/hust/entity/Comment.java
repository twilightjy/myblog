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
@TableName("tb_comment")
public class Comment {

  /**
   * id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 评论用户Id
   */
  private Integer userId;

  /**
   * 回复用户id
   */
  private Integer replyId;

  /**
   * 评论文章id
   */
  private Integer articleId;

  /**
   * 评论内容
   */
  private String commentContent;

  /**
   * 评论时间
   */
  private Date createTime;

  /**
   * 父评论id
   */
  private Integer parentId;

  /**
   * 状态码
   */
  private Integer isDelete;

}

