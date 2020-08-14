package com.neu.shop.controller.excel;

import com.neu.shop.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.lang.reflect.Field;

/**
 * @author xcy
 * @date 2020/8/14 17:28
 */
@Controller
public class FanShe {
    @Autowired
    UserService userService;
    @Test
    public void test() throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        Class<?> aClass = Class.forName("com.neu.shop.pojo.User");
        Object object = aClass.newInstance();
        Field[] fields = object.getClass().getDeclaredFields();
        for (Field field : fields) {
            String name = field.getName();
            System.out.println(name);
            String type = field.getType().getSimpleName();
            System.out.println(type);

        }
    }
}
