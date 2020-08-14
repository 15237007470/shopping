package com.neu.shop.controller.excel;

import com.alibaba.excel.EasyExcel;
import com.neu.shop.controller.listener.UserListener;
import com.neu.shop.pojo.User;
import com.neu.shop.service.UserService;
import com.neu.shop.util.TestFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;

/**
 * @author xcy
 * @date 2020/8/9 16:26
 */
@Controller
public class UploadController {
    @Autowired
    UserService userService;
    @RequestMapping("/excel")
    public String excel(){
        return "excel";
    }
    @RequestMapping("/File/UploadServlet")
    public void uploadExcel(){
        String fileName = TestFileUtil.getPath() + "user" + File.separator + "user.xlsx";
        // 这里 需要指定读用哪个class去读，然后读取第一个sheet 文件流会自动关闭
        EasyExcel.read(fileName, User.class, new UserListener(userService)).sheet().doRead();

    }
}
