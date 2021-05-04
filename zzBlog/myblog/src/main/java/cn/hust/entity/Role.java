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
@TableName("tb_role")
public class Role {

  /**
   * 角色id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 角色名
   */
  private String roleName;

  /**
   * 角色标签
   */
  private String roleLabel;

  /**
   * 创建时间
   */
  private Date createTime;

  /**
   * 更新时间
   */
  private Date updateTime;

  /**
   * 是否禁用
   */
  private Integer isDisable;

}
