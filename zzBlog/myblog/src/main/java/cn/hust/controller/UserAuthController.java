package cn.hust.controller;


import cn.hust.constant.StatusConst;
import cn.hust.dto.PageDTO;
import cn.hust.dto.UserBackDTO;
import cn.hust.dto.UserInfoDTO;
import cn.hust.service.UserAuthService;
import cn.hust.vo.ConditionVO;
import cn.hust.vo.PasswordVO;
import cn.hust.vo.Result;
import cn.hust.vo.UserVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.validation.Valid;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zz
 * @since 2021-04-12
 */
@Api(tags = "用户账号模块")
@RestController
public class UserAuthController {
    @Autowired
    private UserAuthService userAuthService;

    @ApiOperation(value = "发送邮箱验证码")
    @ApiImplicitParam(name = "username", value = "用户名", required = true, dataType = "String")
    @GetMapping("/users/code")
    public Result sendCode(String username) {
        userAuthService.sendCode(username);
        return new Result<>(true, StatusConst.OK, "发送成功！");
    }

    @ApiOperation(value = "查看后台用户列表")
    @GetMapping("/admin/users")
    public Result<PageDTO<UserBackDTO>> listUsers(ConditionVO condition) {
        return new Result<>(true, StatusConst.OK, "查询成功！", userAuthService.listUserBackDTO(condition));
    }

    @ApiOperation(value = "用户注册")
    @PostMapping("/users")
    public Result saveUser(@Valid @RequestBody UserVO user) {
        userAuthService.saveUser(user);
        return new Result<>(true, StatusConst.OK, "注册成功！");
    }

    @ApiOperation(value = "修改密码")
    @PutMapping("/users/password")
    public Result updatePassword(@Valid @RequestBody UserVO user) {
        userAuthService.updatePassword(user);
        return new Result<>(true, StatusConst.OK, "修改成功！");
    }

    @ApiOperation(value = "修改管理员密码")
    @PutMapping("/admin/users/password")
    public Result updateAdminPassword(@Valid @RequestBody PasswordVO passwordVO) {
        userAuthService.updateAdminPassword(passwordVO);
        return new Result<>(true, StatusConst.OK, "修改成功！");
    }

    @ApiOperation(value = "微博登录")
    @ApiImplicitParam(name = "code", value = "code", required = true, dataType = "String")
    @PostMapping("/users/oauth/weibo")
    public Result<UserInfoDTO> weiBoLogin(String code) {
        return new Result<>(true, StatusConst.OK, "登录成功！", userAuthService.weiBoLogin(code));
    }

    @ApiOperation(value = "qq登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "openId", value = "openId", required = true, dataType = "String"),
            @ApiImplicitParam(name = "accessToken", value = "accessToken", required = true, dataType = "String")
    })
    @PostMapping("/users/oauth/qq")
    public Result<UserInfoDTO> qqLogin(String openId, String accessToken) {
        return new Result<>(true, StatusConst.OK, "登录成功！", userAuthService.qqLogin(openId, accessToken));
    }
}

