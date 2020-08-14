package com.neu.shop.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neu.shop.pojo.Msg;
import com.neu.shop.pojo.User;
import com.neu.shop.pojo.UserExample;
import com.neu.shop.service.UserService;
import com.neu.shop.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    RedisUtil redisUtil;
    @Autowired
    private UserService userService;

    @RequestMapping("/showjson")
    @ResponseBody
    public Msg getAllGoods(@RequestParam(value = "page",defaultValue = "1") Integer pn, HttpServletResponse response, Model model) {
        //一页显示几个数据
        PageHelper.startPage(pn, 10);

        /*List<User> userList = userService.selectByExample(new UserExample());*/
        List<User> userList;
        String obj = (String) redisUtil.get("userList");
        if(obj == null){
            userList = userService.selectByExample(new UserExample());
            if(userList != null && userList.size() > 0){
                redisUtil.set("userList", JSONObject.toJSONString(userList));
            }
        }
        else {
            userList = JSON.parseArray(obj,User.class);
        }

        //显示几个页号
        PageInfo page = new PageInfo(userList,5);

       /* model.addAttribute("pageInfo", page);*/

        return Msg.success("查询成功!").add("pageInfo", page);
    }

    @RequestMapping("/show")
    public String userManage() {
        return "userManage";
    }

    @RequestMapping(value = "/delete/{userid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteUser(@PathVariable("userid")Integer userid) {
//        goodsService.deleteGoodsById(goodsid);
        userService.deleteUserById(userid);
        return Msg.success("删除成功!");
    }
}
