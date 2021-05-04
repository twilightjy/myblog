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
@TableName("tb_user_info")
public class UserInfo {

  /**
   * 用户ID
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 用户昵称
   */
  private String nickname;

  /**
   * 用户头像
   */
  private String avatar;

  /**
   * 用户简介
   */
  private String intro;

  /**
   * 个人网站
   */
  private String webSite;

  /**
   * 是否禁言
   */
  private Integer isDisable;

  /**
   * 创建时间
   */
  private Date createTime;

  /**
   * 更新时间
   */
  private Date updateTime;

}