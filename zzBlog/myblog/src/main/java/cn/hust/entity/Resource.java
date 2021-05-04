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
@TableName("tb_resource")
public class Resource {
  /**
   * 权限id
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 权限名
   */
  private String resourceName;

  /**
   * 权限路径
   */
  private String url;

  /**
   * 请求方式
   */
  private String requestMethod;

  /**
   * 父权限id
   */
  private Integer parentId;

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

  /**
   * 是否匿名访问
   */
  private Integer isAnonymous;

}