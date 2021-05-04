package cn.hust.constant;

/**
 * 返回码静态常量 对应于Result中的code 在返回数据给前端的时候调用
 *
 * @author zz
 */
public class StatusConst {

    /**
     * 成功
     */
    public static final int OK = 20000;

    /**
     * 失败
     */
    public static final int ERROR = 20001;

    /**
     * 系统异常
     */
    public static final int SYSTEM_ERROR = 50000;

    /**
     * 未登录
     */
    public static final int NOT_LOGIN = 40001;

    /**
     * 没有操作权限
     */
    public static final int AUTHORIZED = 40003;

}
