package cn.hust.service;

import cn.hust.dto.OperationLogDTO;
import cn.hust.dto.PageDTO;
import cn.hust.entity.OperationLog;
import cn.hust.vo.ConditionVO;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author zz
 * @since 2021-04-13
 */
public interface OperationLogService extends IService<OperationLog> {
    /**
     * 查询日志列表
     *
     * @param conditionVO 条件
     * @return 日志列表
     */
    PageDTO<OperationLogDTO> listOperationLogs(ConditionVO conditionVO);
}
