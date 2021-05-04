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
@TableName("tb_friend_link")
public class FriendLink {

  /**
   * id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 链接名
   */
  private String linkName;

  /**
   * 链接头像
   */
  private String linkAvatar;

  /**
   * 链接地址
   */
  private String linkAddress;

  /**
   * 介绍
   */
  private String linkIntro;

  /**
   * 创建时间
   */
  private Date createTime;


}
