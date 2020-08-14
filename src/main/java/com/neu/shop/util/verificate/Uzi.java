package com.neu.shop.util.verificate;

import com.neu.shop.util.DuiXiang2;

import java.util.*;

public class Uzi {
    public static void main(String[] args) {
        HashMap<Object,String> hashMap = new HashMap<>();
        DuiXiang2 girl1 = new DuiXiang2(21,"谷悠然");
        DuiXiang2 girl2 = new DuiXiang2(21,"谷悠然");
        System.out.println(girl1.toString());
        System.out.println(girl2);
        hashMap.put(girl1,"漂亮");
        hashMap.put(girl2,"漂亮");
        for (Map.Entry<Object,String > entry : hashMap.entrySet()){
            System.out.println(entry.getKey()+entry.getValue());
        }

        DuiXiang2 girl3 = new DuiXiang2(21,"谷悠然");
        System.out.println(hashMap.get(girl1));
        System.out.println(hashMap.get(girl3));
        Set set = new HashSet();
        HashSet hashSet = new HashSet();
        set.add(girl1);
        for (Object object : set) {
            System.out.println(object);
        }


    }
}
