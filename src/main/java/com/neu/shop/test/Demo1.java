package com.neu.shop.test;

public class Demo1 {
    private String name;
    public Demo1(String name){
        this.name = name;
    }

    @Override
    public int hashCode() {
        return 1;
    }

    @Override
    public boolean equals(Object obj) {
//        if (!super.equals(obj)){
//            return false;
//        }
//        Field[] fields = obj.getClass().getFields();
//        for (Field field : fields) {
//            try {
//                if (!field.get(obj).equals(field.get(this))){
//                    return false;
//                }
//            } catch (IllegalAccessException e) {
//                e.printStackTrace();
//            }
//        }
        return true;
    }
}
