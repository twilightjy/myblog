package cn.hust.service;


import cn.hust.dto.FriendLinkBackDTO;
import cn.hust.dto.FriendLinkDTO;
import cn.hust.dto.PageDTO;
import cn.hust.entity.FriendLink;
import cn.hust.vo.ConditionVO;
import cn.hust.vo.FriendLinkVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author zz
 * @since 2021-04-13
 */
public interface FriendLinkService extends IService<FriendLink> {
    /**
     * 查看友链列表
     *
     * @return 友链列表
     */
    List<FriendLinkDTO> listFriendLinks();

    /**
     * 查看后台友链列表
     *
     * @param condition 条件
     * @return 友链列表
     */
    PageDTO<FriendLinkBackDTO> listFriendLinkDTO(ConditionVO condition);

    /**
     * 保存或更新友链
     * @param friendLinkVO 友链
     */
    void saveOrUpdateFriendLink(FriendLinkVO friendLinkVO);

}
