package com.neu.shop.test;

import com.neu.shop.service.CateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestOneController {

    @Autowired
    CateService cateService;
    @RequestMapping("/test")
    public void test(){
        System.out.println("cateService:"+cateService);
    }
}

