package cn.hust.service;


import cn.hust.dto.UniqueViewDTO;
import cn.hust.entity.UniqueView;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author zz
 * @since 2021-04-13
 */
public interface UniqueViewService extends IService<UniqueView> {

    /**
     * 统计每日用户量
     */
    void saveUniqueView();

    /**
     * 获取一周（7天）用户量统计
     * @return 用户量
     */
    List<UniqueViewDTO> listUniqueViews();

}
