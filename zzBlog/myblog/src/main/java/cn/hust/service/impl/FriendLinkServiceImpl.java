package cn.hust.service.impl;

import cn.hust.dao.FriendLinkDao;
import cn.hust.dto.FriendLinkBackDTO;
import cn.hust.dto.FriendLinkDTO;
import cn.hust.dto.PageDTO;
import cn.hust.entity.FriendLink;
import cn.hust.service.FriendLinkService;
import cn.hust.utils.BeanCopyUtil;
import cn.hust.vo.ConditionVO;
import cn.hust.vo.FriendLinkVO;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @author zz
 * @since 2021-04-13
 */
@Service
public class FriendLinkServiceImpl extends ServiceImpl<FriendLinkDao, FriendLink> implements FriendLinkService {
    @Autowired
    private FriendLinkDao friendLinkDao;

    @Override
    public List<FriendLinkDTO> listFriendLinks() {
        // 查询友链列表
        List<FriendLink> friendLinkList = friendLinkDao.selectList(new LambdaQueryWrapper<FriendLink>()
                .select(FriendLink::getId, FriendLink::getLinkName, FriendLink::getLinkAvatar, FriendLink::getLinkAddress, FriendLink::getLinkIntro));
        return BeanCopyUtil.copyList(friendLinkList, FriendLinkDTO.class);
    }

    @Override
    public PageDTO<FriendLinkBackDTO> listFriendLinkDTO(ConditionVO condition) {
        // 分页查询友链列表
        Page<FriendLink> page = new Page<>(condition.getCurrent(), condition.getSize());
        Page<FriendLink> friendLinkPage = friendLinkDao.selectPage(page, new LambdaQueryWrapper<FriendLink>()
                .select(FriendLink::getId, FriendLink::getLinkName, FriendLink::getLinkAvatar, FriendLink::getLinkAddress, FriendLink::getLinkIntro, FriendLink::getCreateTime)
                .like(StringUtils.isNotBlank(condition.getKeywords()), FriendLink::getLinkName, condition.getKeywords()));
        // 将实体类进一步封装为DTO
        List<FriendLinkBackDTO> friendLinkBackDTOList = BeanCopyUtil.copyList(friendLinkPage.getRecords(), FriendLinkBackDTO.class);
        return new PageDTO<>(friendLinkBackDTOList, (int) friendLinkPage.getTotal());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrUpdateFriendLink(FriendLinkVO friendLinkVO) {
        //建造者设置属性
        FriendLink friendLink = FriendLink.builder()
                .id(friendLinkVO.getId())
                .linkName(friendLinkVO.getLinkName())
                .linkAvatar(friendLinkVO.getLinkAvatar())
                .linkAddress(friendLinkVO.getLinkAddress())
                .linkIntro(friendLinkVO.getLinkIntro())
                .createTime(Objects.isNull(friendLinkVO.getId()) ? new Date() : null)
                .build();
        //更新
        this.saveOrUpdate(friendLink);
    }

}
