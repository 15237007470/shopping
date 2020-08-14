package com.neu.shop.util;

import java.util.HashMap;
import java.util.Map;

public class HashMapTest {
    public static void main(String[] args) {
        Animal animal = new Animal("dog",4);
        Map<Object,String> map = new HashMap<>();
        map.put(animal,"哈士奇");
        for(Map.Entry entry : map.entrySet()){
            System.out.println(entry);
        }
    }
}
