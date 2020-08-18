package com.neu.shop.controller.excel;

import com.neu.shop.entity.Example;
import org.junit.Test;

import java.lang.reflect.*;

/**
 * @author xcy
 * @date 2020/8/17 10:25
 */
public class FanSheExample {
    @Test
    public void test() throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        //通过获取实体类
        Class<?> aClass = Class.forName("com.neu.shop.entity.Example");
        Object object = aClass.newInstance();
        //getDeclareFields获得某个类的所有声明的字段，即包括public、private和proteced，但是不包括父类的申明字段
        Field[] fields = object.getClass().getDeclaredFields();
        for (Field field : fields) {
            String name = field.getName();
            System.out.println(name);
            String simpleName = field.getType().getSimpleName();
            System.out.println(simpleName);
        }
    }
    //通过反射获取构造函数
    @Test
    public void test1() throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        Class<?> aClass = Class.forName("com.neu.shop.entity.Example");
        Constructor[] constructor;
        constructor = aClass.getDeclaredConstructors();
        for (int i = 0; i < constructor.length; i++) {
            System.out.println(Modifier.toString(constructor[i].getModifiers())+"参数：");
            //获取参数类型（int,String,date...）
            Class[] parameterTypes = constructor[i].getParameterTypes();
            for (int i1 = 0; i1 < parameterTypes.length; i1++) {
                System.out.println(parameterTypes[i1].getName()+"");
            }
        }
        System.out.println("------------------------");
        try {
            Constructor<?> declaredConstructor = aClass.getDeclaredConstructor();
            System.out.println(Modifier.toString(declaredConstructor.getModifiers()));
            System.out.println("_________________________");
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        Class[] p = {int.class,String.class};
        try {
            Constructor<?> declaredConstructor = aClass.getDeclaredConstructor(p);
            System.out.println(Modifier.toString(declaredConstructor.getModifiers())+"参数：");
            Class<?>[] parameterTypes = declaredConstructor.getParameterTypes();
            for (int i = 0; i < parameterTypes.length; i++) {
                System.out.println(parameterTypes[i].getName());
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        Class[] d = {int.class,String.class};
        try {
            Constructor<?> declaredConstructor = aClass.getDeclaredConstructor(d);
            declaredConstructor.newInstance(11,"what");
        } catch (NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
        Class[] r = {String.class};
        try {
            Constructor<?> declaredConstructor = aClass.getDeclaredConstructor(r);
            declaredConstructor.setAccessible(true);
            declaredConstructor.newInstance("辣鸡");
        } catch (NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println("################################");
        Class[] g = {String.class};
        Example example = new Example();
        try {
            Method method = aClass.getDeclaredMethod("test2", g);
            method.setAccessible(true);
            Object[] args = {"欢迎来到英雄联盟"};
            method.invoke(example,args);
        } catch (NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void test2() throws ClassNotFoundException, IllegalAccessException, InstantiationException{
        Class<?> aClass = Class.forName("com.neu.shop.entity.Example");
        Constructor<?>[] declaredConstructors = aClass.getDeclaredConstructors();
        for (int i = 0; i < declaredConstructors.length; i++) {
            System.out.println(Modifier.toString(declaredConstructors[i].getModifiers()));
            Class<?>[] parameterTypes = declaredConstructors[i].getParameterTypes();
            for (int i1 = 0; i1 < parameterTypes.length; i1++) {
                System.out.println(parameterTypes[i1].getName());
            }
        }
        System.out.println("___________________________");
        Field[] declaredFields = aClass.getDeclaredFields();
        for (int i = 0; i < declaredFields.length; i++) {
            System.out.println(declaredFields[i].getName());
            System.out.println(declaredFields[i].getType().getSimpleName());
        }
        System.out.println("---------------------------");
        Class[] a  = {int.class,String.class};

        try {
            Constructor<?> declaredConstructor = aClass.getDeclaredConstructor(a);
            declaredConstructor.newInstance(1,"what");
        } catch (NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
        Class[] b = {String.class};
        Example example = new Example();
        try {
            Method declaredMethod = aClass.getDeclaredMethod("test2", b);
            declaredMethod.setAccessible(true);
            Object[] ards = {"见到你很高兴"};
            declaredMethod.invoke(example,ards);
        } catch (NoSuchMethodException | InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println("_____________________________");
        Field[] fields = aClass.getDeclaredFields();
        for (Field field : fields) {
            System.out.println(field);
            String name = field.getName();
            System.out.println(name);
            String type = field.getType().getSimpleName();
            System.out.println(type);
        }

    }
    @Test
    public void test4() throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException, NoSuchFieldException {
        Class<?> aClass = Class.forName("com.neu.shop.entity.Example");
        Object object = aClass.newInstance();
        Method test3 = aClass.getDeclaredMethod("test3", String.class);
        test3.setAccessible(true);
        test3.invoke(object,"我的大刀早已饥渴难耐");
        Field name = aClass.getDeclaredField("name");
        name.setAccessible(true);
        name.set(object,"大刀");
        System.out.println(object.toString());

    }
}
