package cn.hust.dao;

import cn.hust.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zz
 * @since 2021-04-13
 */
@Repository
public interface MenuDao extends BaseMapper<Menu> {
    /**
     * 根据用户id查询菜单
     * @param userInfoId 用户信息id
     * @return 菜单列表
     */
    List<Menu> listMenusByUserInfoId(Integer userInfoId);
}
