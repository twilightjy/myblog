package cn.hust.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("tb_role_menu")
public class RoleMenu {

  /**
   * 主键id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 角色id
   */
  private Integer roleId;

  /**
   * 菜单id
   */
  private Integer menuId;

}
