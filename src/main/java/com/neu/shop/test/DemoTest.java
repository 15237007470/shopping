package com.neu.shop.test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class DemoTest {
    public static void main(String[] args) {
        Demo1 demo1 = new Demo1("里斯");
        Demo1 demo2 = new Demo1("张三");
        System.out.println(demo1);
        System.out.println(demo2);
//        HashSet<String> hashSet = new HashSet<>();

        Set set = new HashSet();
        set.add(demo1);
        set.add(demo2);
        System.out.println(set);
        List list = new ArrayList();
    }


}
