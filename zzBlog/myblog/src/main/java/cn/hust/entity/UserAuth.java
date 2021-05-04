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
@TableName("tb_user_auth")
public class UserAuth {

  /**
   * id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 用户信息id
   */
  private Integer userInfoId;

  /**
   * 用户名
   */
  private String username;

  /**
   * 密码
   */
  private String password;

  /**
   * 登录类型
   */
  private Integer loginType;

  /**
   * 用户登录ip
   */
  private String ipAddr;

  /**
   * ip来源
   */
  private String ipSource;

  /**
   * 创建时间
   */
  private Date createTime;

  /**
   * 最近登录时间
   */
  private Date lastLoginTime;

}

