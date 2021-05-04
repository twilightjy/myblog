package cn.hust.exception;

/**
 * 自定义服务异常类
 */
public class ServeException extends RuntimeException {
    public ServeException(String message) {
        super(message);
    }

}

