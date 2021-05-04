package cn.hust.service;


import cn.hust.dto.PageDTO;
import cn.hust.dto.UserBackDTO;
import cn.hust.dto.UserInfoDTO;
import cn.hust.entity.UserAuth;
import cn.hust.vo.ConditionVO;
import cn.hust.vo.PasswordVO;
import cn.hust.vo.UserVO;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author zz
 * @since 2021-04-13
 */
public interface UserAuthService extends IService<UserAuth> {
    /**
     * 发送邮箱验证码
     *
     * @param username 邮箱号
     */
    void sendCode(String username);

    /**
     * 用户注册
     *
     * @param user 用户对象
     */
    void saveUser(UserVO user);

    /**
     * qq登录
     *
     * @param openId      qq openId
     * @param accessToken qq token
     * @return 用户登录信息
     */
    UserInfoDTO qqLogin(String openId, String accessToken);

    /**
     * 微博登录
     *
     * @param code 微博code
     * @return 用户登录信息
     */
    UserInfoDTO weiBoLogin(String code);

    /**
     * 修改密码
     *
     * @param user 用户对象
     */
    void updatePassword(UserVO user);

    /**
     * 修改管理员密码
     *
     * @param passwordVO 密码对象
     */
    void updateAdminPassword(PasswordVO passwordVO);

    /**
     * 查询后台用户列表
     *
     * @param condition 条件
     * @return 用户列表
     */
    PageDTO<UserBackDTO> listUserBackDTO(ConditionVO condition);

}
