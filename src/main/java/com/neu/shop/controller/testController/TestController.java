package com.neu.shop.controller.testController;

import com.alibaba.excel.EasyExcel;
import com.neu.shop.entity.Address;
import com.neu.shop.pojo.Goods;
import com.neu.shop.service.GoodsService;
import com.neu.shop.util.RedisUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {
    @Autowired
    GoodsService goodsService;

    @Autowired
    private RedisUtil redisUtil;
    @RequestMapping("/set")
    public String set(){
        Address address = new Address(1,"北京");
        redisUtil.set("xu",address);
        return "save";
    }
    @RequestMapping("/get")
    public String get(){
        Address address1 = (Address) redisUtil.get("xu");
        System.out.println(address1.toString());
        return address1.toString();
    }

    @RequestMapping("goods")
    public List<Goods> getList(){

        List<Goods> goods = goodsService.selectAll();
        String fileName = "E:/writeexcel/goods.xlsx";

        // 这里 需要指定写用哪个class去写，然后写到第一个sheet，名字为模板 然后文件流会自动关闭
        // 如果这里想使用03 则 传入excelType参数即可
        EasyExcel.write(fileName, Goods.class).sheet("模板").doWrite(goods);
        return goods;
    }

    @Test
    public void simpleWrite() {
        // 写法1
        String fileName = "E:/writeexcel/goods.xlsx";

        // 这里 需要指定写用哪个class去写，然后写到第一个sheet，名字为模板 然后文件流会自动关闭
        // 如果这里想使用03 则 传入excelType参数即可
        EasyExcel.write(fileName, Goods.class).sheet("模板").doWrite(data());

    }
    private List<Goods> data() {
        List<Goods> goods = goodsService.selectAll();
        return goods;
    }


}


