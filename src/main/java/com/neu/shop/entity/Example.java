package com.neu.shop.entity;

import java.util.Date;

/**
 * @author xcy
 * @date 2020/8/17 10:22
 */
public class Example {
    private String a = "123";
    private String name;
    private Date time;
    private int c = 1;
    public Example(){

    }

    private Example(String a){
        System.out.println("String:"+a);
    }
    public Example(int b,String d){
        System.out.println("int:"+b+"String:"+d);

    }
    private void test(){
        System.out.println("123");
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    private void test2(String name2){
        System.out.println(name2);    }
    private String test1(String name1,int age){
        return "name:" + name1 + "age:" + age;
    }
    private String test3(String name3){
        this.name = name3;
        System.out.println(name);
        return name3;
    }
    public String toString(){
        return name;
    }

}
