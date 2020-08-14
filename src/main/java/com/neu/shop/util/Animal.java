package com.neu.shop.util;

public class Animal {
    String name;
    int age;
    public Animal(String name, int age){
        this.name = name;
        this.age = age;
    }
    @Override
    public String toString(){
        return "动物："+name+"\n"+"年龄："+age+"\n"+"品种";
    }
}
