package com.neu.shop.util;


public class DuiXiang2 {
    public int age;
    public String name;

    public DuiXiang2(int age, String name) {
        super();
        this.age = age;
        this.name = name;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + age;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        DuiXiang2 other = (DuiXiang2) obj;
        if (age != other.age)
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }
    @Override
    public String toString() {
        return "DuiXiang2 [age=" + age + ", name=" + name + "]";
    }


}
