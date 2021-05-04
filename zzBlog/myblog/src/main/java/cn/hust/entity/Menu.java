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
@TableName("tb_menu")
public class Menu {

  /**
   * id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 菜单名
   */
  private String name;

  /**
   * 路径
   */
  private String path;

  /**
   * 组件
   */
  private String component;

  /**
   * icon
   */
  private String icon;

  /**
   * 创建时间
   */
  private Date createTime;

  /**
   * 更新时间
   */
  private Date updateTime;

  /**
   * 排序
   */
  private Integer orderNum;

  /**
   * 父id
   */
  private Integer parentId;

  /**
   * 是否禁用
   */
  private Integer isDisable;

  /**
   * 是否隐藏
   */
  private Integer isHidden;

}

