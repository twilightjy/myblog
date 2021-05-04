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
@TableName("tb_message")
public class Message {

  /**
   * 主键id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 用户ip
   */
  private String ipAddress;

  /**
   * 用户地址
   */
  private String ipSource;

  /**
   * 昵称
   */
  private String nickname;

  /**
   * 头像
   */
  private String avatar;

  /**
   * 留言内容
   */
  private String messageContent;

  /**
   * 弹幕速度
   */
  private Integer time;

  /**
   * 留言时间
   */
  private Date createTime;

}
