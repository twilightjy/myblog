package cn.hust.annotation;

import java.lang.annotation.*;

/**
 * 操作日志注解
 *
 * @author zz
 * @date: 2021-04-13
 */
@Target(ElementType.METHOD)  //该操作日志注解作用于方法
@Retention(RetentionPolicy.RUNTIME) // 这种类型的Annotations将被JVM保留,所以他们能在运行时被JVM或其他使用反射机制的代码所读取和使用.
@Documented //这个注解应该被 javadoc工具记录. 默认情况下,javadoc是不包括注解的.
public @interface OptLog {

    /**
     * @return 操作类型
     */
    String optType() default ""; //具体的optType从OptTypeConst中获取

}
