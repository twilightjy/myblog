package cn.hust.controller;

import cn.hust.annotation.OptLog;
import cn.hust.constant.StatusConst;
import cn.hust.dto.*;
import cn.hust.enums.FilePathEnum;
import cn.hust.service.ArticleService;
import cn.hust.utils.OSSUtil;
import cn.hust.vo.ArticleVO;
import cn.hust.vo.ConditionVO;
import cn.hust.vo.DeleteVO;
import cn.hust.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.validation.Valid;
import java.util.List;
import static cn.hust.constant.OptTypeConst.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *采用Swagger2进行接口规范管理。访问localhost:8080/swagger-ui.html
 * @author zz
 * @since 2021-04-12
 */
@RestController
@Api(tags = "文章模块")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @ApiOperation(value = "查看文章归档")
    @ApiImplicitParam(name = "current", value = "当前页码", required = true, dataType = "Long")
    @GetMapping("/articles/archives")
    public Result<PageDTO<ArchiveDTO>> listArchives(Long current) {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.listArchives(current));
    }

    @ApiOperation(value = "查看首页文章")
    @ApiImplicitParam(name = "current", value = "当前页码", required = true, dataType = "Long")
    @GetMapping("/articles")
    public Result<List<ArticleHomeDTO>> listArticles(Long current) {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.listArticles(current));
    }

    @ApiOperation(value = "查看后台文章")
    @GetMapping("/admin/articles")
    public Result<PageDTO<ArticleBackDTO>> listArticleBackDTO(ConditionVO conditionVO) {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.listArticleBackDTO(conditionVO));
    }

    @ApiOperation(value = "查看文章选项")
    @GetMapping("/admin/articles/options")
    public Result<ArticleOptionDTO> listArticleOptionDTO() {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.listArticleOptionDTO());
    }

    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "添加或修改文章")
    @PostMapping("/admin/articles")
    public Result saveArticle(@Valid @RequestBody ArticleVO articleVO) {//RequestBody接收到JSON封装为VO，valid作数据校验
        articleService.saveOrUpdateArticle(articleVO);
        return new Result<>(true, StatusConst.OK, "操作成功");//由于不需要data所以不指定Result的泛型
    }

    @OptLog(optType = UPDATE)
    @ApiOperation(value = "修改文章置顶")
    @PutMapping("/admin/articles/top/{articleId}")
    public Result updateArticleTop(@PathVariable("articleId") Integer articleId, Integer isTop) {
        articleService.updateArticleTop(articleId, isTop);
        return new Result<>(true, StatusConst.OK, "修改成功");
    }

    @ApiOperation(value = "上传文章图片")
    @ApiImplicitParam(name = "file", value = "文章图片", required = true, dataType = "MultipartFile")//MultipartFile类型
    @PostMapping("/admin/articles/images")
    public Result<String> saveArticleImages(MultipartFile file) {
        return new Result<>(true, StatusConst.OK, "上传成功", OSSUtil.upload(file, FilePathEnum.ARTICLE.getPath()));
    }

    @OptLog(optType = UPDATE)
    @ApiOperation(value = "恢复或删除文章")
    @PutMapping("/admin/articles")
    public Result updateArticleDelete(DeleteVO deleteVO) {//伪删除，只是修改文章状态使之不可见，并没有真正删除,所以是UPDATE!
        articleService.updateArticleDelete(deleteVO);
        return new Result<>(true, StatusConst.OK, "操作成功");
    }

    @OptLog(optType = REMOVE)
    @ApiOperation(value = "物理删除文章")
    @DeleteMapping("/admin/articles")
    public Result deleteArticles(@RequestBody List<Integer> articleIdList) {//真的删除了！REMOVE!
        articleService.deleteArticles(articleIdList);
        return new Result<>(true, StatusConst.OK, "操作成功！");
    }

    @ApiOperation(value = "根据id查看后台文章")
    @ApiImplicitParam(name = "articleId", value = "文章id", required = true, dataType = "Integer")
    @GetMapping("/admin/articles/{articleId}")
    public Result<ArticleVO> getArticleBackById(@PathVariable("articleId") Integer articleId) {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.getArticleBackById(articleId));
    }

    @ApiOperation(value = "根据id查看文章")
    @ApiImplicitParam(name = "articleId", value = "文章id", required = true, dataType = "Integer")
    @GetMapping("/articles/{articleId}")
    public Result<ArticleDTO> getArticleById(@PathVariable("articleId") Integer articleId) {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.getArticleById(articleId));
    }

    @ApiOperation(value = "查看最新文章")
    @GetMapping("/articles/newest")
    public Result<List<ArticleRecommendDTO>> listNewestArticles() {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.listNewestArticles());
    }

    @ApiOperation(value = "搜索文章")
    @GetMapping("/articles/search")
    public Result<List<ArticleSearchDTO>> listArticlesBySearch(ConditionVO condition) {
        return new Result<>(true, StatusConst.OK, "查询成功", articleService.listArticlesBySearch(condition));
    }

    @ApiOperation(value = "点赞文章")
    @ApiImplicitParam(name = "articleId", value = "文章id", required = true, dataType = "Integer")
    @PostMapping("/articles/like")
    public Result saveArticleLike(Integer articleId) {
        articleService.saveArticleLike(articleId);
        return new Result<>(true, StatusConst.OK, "点赞成功");
    }


}

