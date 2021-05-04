package cn.hust.controller;


import cn.hust.annotation.OptLog;
import cn.hust.constant.StatusConst;
import cn.hust.dto.BlogHomeInfoDTO;
import cn.hust.service.BlogInfoService;
import cn.hust.service.impl.WebSocketServiceImpl;
import cn.hust.vo.Result;
import cn.hust.vo.VoiceVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import java.io.IOException;

import static cn.hust.constant.OptTypeConst.UPDATE;


/**
 * <p>
 *  自定义前端控制器
 * </p>
 *
 * @author zz
 * @since 2021-04-12
 */
@RestController
@Api(tags = "博客信息模块")
public class BlogInfoController {

    @Autowired
    private BlogInfoService blogInfoService;
    @Autowired
    private WebSocketServiceImpl webSocketService;

    @ApiOperation(value = "查看博客信息")
    @GetMapping("/")
    public Result<BlogHomeInfoDTO> getBlogHomeInfo() {
        return new Result<>(true, StatusConst.OK, "查询成功", blogInfoService.getBlogInfo());
    }

    @ApiOperation(value = "查看后台信息")
    @GetMapping("/admin")
    public Result<BlogHomeInfoDTO> getBlogBackInfo() {
        return new Result<>(true, StatusConst.OK, "查询成功", blogInfoService.getBlogBackInfo());
    }

    @ApiOperation(value = "查看关于我信息")
    @GetMapping("/about")
    public Result<String> getAbout() {
        return new Result(true, StatusConst.OK, "查询成功", blogInfoService.getAbout());
    }

    @OptLog(optType = UPDATE)
    @ApiOperation(value = "修改关于我信息")
    @PutMapping("/admin/about")
    public Result updateAbout(String aboutContent) {
        blogInfoService.updateAbout(aboutContent);
        return new Result<>(true, StatusConst.OK, "修改成功");
    }

    @OptLog(optType = UPDATE)
    @ApiOperation(value = "修改公告")
    @PutMapping("/admin/notice")
    public Result updateNotice(String notice) {
        blogInfoService.updateNotice(notice);
        return new Result<>(true, StatusConst.OK, "修改成功");
    }

    @ApiOperation(value = "上传语音")
    @ApiImplicitParam(name = "file", value = "语音文件", required = true, dataType = "MultipartFile")
    @PostMapping("/voice")
    public Result<String> saveVoice(VoiceVO voiceVO) throws IOException {
        webSocketService.sendVoice(voiceVO);
        return new Result<>(true, StatusConst.OK, "上传成功");
    }

    @ApiOperation(value = "查看公告")
    @GetMapping("/admin/notice")
    public Result<String> getNotice() {
        return new Result(true, StatusConst.OK, "查看成功", blogInfoService.getNotice());
    }


}
