package cn.hust.utils;

import java.util.ArrayList;
import java.util.List;

/**
 *复制对象或集合属性 工具类
 */
public class BeanCopyUtil {

    /**
     * 根据现有对象的属性创建目标对象，并赋值
     * 泛型方法 返回T类型 之前必须声明 <T>
     * @param source
     * @param target
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> T copyObject(Object source, Class<T> target) {
        T temp = null;
        try {
            temp = target.newInstance();//根据Class对象，反射创建T类型temp对象
            if (null != source) {
                org.springframework.beans.BeanUtils.copyProperties(source, temp);//借助于BeanUtils工具类
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return temp;
    }

    /**
     * 拷贝集合
     *
     * @param source
     * @param target
     * @param <T>
     * @param <S>
     * @return
     */
    public static <T, S> List<T> copyList(List<S> source, Class<T> target) {
        List<T> list = new ArrayList<>();
        if (null != source && source.size() > 0) {
            for (Object obj : source) {
                list.add(BeanCopyUtil.copyObject(obj, target));
            }
        }
        return list;
    }


}
