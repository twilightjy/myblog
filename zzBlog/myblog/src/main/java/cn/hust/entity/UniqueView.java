package cn.hust.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.*;

/**
 * <p>
 * 访问量
 * </p>
 *
 * @author zz
 * @since 2021-04-12
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("tb_unique_view")
public class UniqueView {

  /**
   * id 自动创建
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;

  /**
   * 时间
   */
  private Date createTime;

  /**
   * 访问量
   */
  private Integer viewsCount;

}

