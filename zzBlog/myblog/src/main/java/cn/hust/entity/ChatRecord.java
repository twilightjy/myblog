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
@TableName("tb_chat_record")
public class ChatRecord {

  /**
   * 主键
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 用户id
   */
  private Integer userId;

  /**
   * 用户昵称
   */
  private String nickname;

  /**
   * 用户头像
   */
  private String avatar;

  /**
   * 聊天内容
   */
  private String content;

  /**
   * 类型
   */
  private Integer type;

  /**
   * 创建时间
   */
  private Date createTime;

  /**
   * 用户登录ip
   */
  private String ipAddr;

  /**
   * ip来源
   */
  private String ipSource;

}
