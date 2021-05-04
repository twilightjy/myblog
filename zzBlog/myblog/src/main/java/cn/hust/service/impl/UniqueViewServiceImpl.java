package cn.hust.service.impl;

import cn.hust.dao.UniqueViewDao;
import cn.hust.dto.UniqueViewDTO;
import cn.hust.entity.UniqueView;
import cn.hust.service.UniqueViewService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import cn.hust.utils.DateUtil;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @author zz
 * @since 2021-04-13
 */
@Service
public class UniqueViewServiceImpl extends ServiceImpl<UniqueViewDao, UniqueView> implements UniqueViewService {
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private UniqueViewDao uniqueViewDao;

    @Scheduled(cron = " 0 0 0 * * ?")
    @Override
    public void saveUniqueView() {
        // 获取每天用户量 根据ip
        Long count = redisTemplate.boundSetOps("ip_set").size();
        // 获取昨天日期插入数据,因为是在每天0点执行的，所以计算的是昨天一天的 Builder模式
        UniqueView uniqueView = UniqueView.builder()
                .createTime(DateUtil.getSomeDay(new Date(), -1))
                .viewsCount(Objects.nonNull(count) ? count.intValue() : 0).build();
        //直接插入
        uniqueViewDao.insert(uniqueView);
    }

    @Override
    public List<UniqueViewDTO> listUniqueViews() {
        String startTime = DateUtil.getMinTime(DateUtil.getSomeDay(new Date(), -7));//获取七天前的日期
        String endTime = DateUtil.getMaxTime(new Date());//今天
        return uniqueViewDao.listUniqueViews(startTime, endTime);
    }

}
