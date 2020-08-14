package com.neu.shop.util;

import java.util.ArrayList;
import java.util.List;

public class Ts {
    public static void main(String[] args) {
        test("ABBCA");
    }
    public static void test(String str){
        List<String> list = new ArrayList<>();
        List<Integer> list1 = new ArrayList<>();
        for (int i = 0; i < str.length();i++){
            String s = str.substring(i,i+1);
            if (list.contains(s)){
                for (int i1 = 0; i1 < list.size(); i1++) {
                    if (s.equals(list.get(i1))){
                        Integer o = list1.get(i1);
                        list1.set(i1, o + 1);
                    }
                }
            }else {
                list.add(s);
                list1.add(1);
            }

        }
        System.out.println(list);
        System.out.println(list1);

    }
}
