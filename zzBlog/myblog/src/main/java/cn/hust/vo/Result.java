package cn.hust.vo;

import cn.hust.constant.StatusConst;
import lombok.Data;

import java.io.Serializable;
/**
 * 接口返回类VO
 * @author zz
 */
@Data
public class Result<T> implements Serializable {
    //返回给前端的数据格式被Result类涵盖
    private boolean flag;//标志位
    private Integer code;//状态码
    private String message;//文字提示信息
    private T data;//泛型T，根据具体情况封装成dto和vo

    //完整的Result
    public Result(boolean flag, Integer code, String message, Object data) {
        this.flag = flag;
        this.code = code;
        this.message = message;
        this.data = (T) data;
    }

    //前端不需要data的细节则不用设置，返回data为null
    public Result(boolean flag, Integer code, String message) {
        this.flag = flag;
        this.code = code;
        this.message = message;
    }

    public Result() {
        this.flag = true;
        this.code = StatusConst.OK;
        this.message = "操作成功!";
    }


}