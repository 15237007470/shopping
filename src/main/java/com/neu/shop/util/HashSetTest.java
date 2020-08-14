package com.neu.shop.util;

import java.util.Set;

public class HashSetTest {
    public static void main(String[] args) {
        Set<String> set = new java.util.HashSet<>();
        System.out.println(set.add("123"));
        System.out.println(set.add("234"));
        System.out.println(set.add("123"));
        for(Object object : set){
            System.out.println(object);
        }
        Set<Person> set1 = new java.util.HashSet<>();
        System.out.println(set1.add(new Person("张三")));
        System.out.println(set1.add(new Person("李四")));
        System.out.println(set1.add(new Person("张三")));
        for(Object object1 : set1){
            System.out.println(object1.toString());
        }
    }
}
