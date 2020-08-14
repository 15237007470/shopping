package com.neu.shop.util;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import static org.junit.jupiter.api.Assertions.*;

class SpringbootdemoTest {
    @Autowired
    StringRedisTemplate stringRedisTemplate; //操作key-value都是字符串，最常用
    @Test
    void test01() {

        stringRedisTemplate.opsForValue().append("msg","coder");
        //列表操作
        stringRedisTemplate.opsForList().leftPush("mylist","1");
        stringRedisTemplate.opsForList().leftPush("mylist","2");
    }
}