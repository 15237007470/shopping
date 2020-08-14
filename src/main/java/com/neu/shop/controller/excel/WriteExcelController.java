package com.neu.shop.controller.excel;

import com.alibaba.excel.EasyExcel;
import com.neu.shop.pojo.User;
import com.neu.shop.service.UserService;
import com.neu.shop.util.TestFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author xcy
 * @date 2020/8/14 14:36
 */
@Controller
public class WriteExcelController {
    @Autowired
    UserService userService;

    @RequestMapping("extest")
    /*@Test*/
    public void listFill() {
        // 模板注意 用{} 来表示你要用的变量 如果本来就有"{","}" 特殊字符 用"\{","\}"代替
        // 填充list 的时候还要注意 模板中{.} 多了个点 表示list
        String templateFileName =
                TestFileUtil.getPath() + "demo/write.xlsx";

        // 方案1 一下子全部放到内存里面 并填充
        String fileName = "D:/excel/test.xlsx";
        // 这里 会填充到第一个sheet， 然后文件流会自动关闭
        EasyExcel.write(fileName).withTemplate(templateFileName).sheet().doFill(data());

        // 方案2 分多次 填充 会使用文件缓存（省内存）
        /*fileName = TestFileUtil.getPath() + "listFill" + System.currentTimeMillis() + ".xlsx";
        ExcelWriter excelWriter = EasyExcel.write(fileName).withTemplate(templateFileName).build();
        WriteSheet writeSheet = EasyExcel.writerSheet().build();
        excelWriter.fill(data(), writeSheet);
        excelWriter.fill(data(), writeSheet);
        // 千万别忘记关闭流
        excelWriter.finish();*/
    }

    /*private List<FillData> data(){
        List<FillData> list = new ArrayList<FillData>();
        for (int i = 0; i < 10; i++) {
            FillData fillData = new FillData();
            list.add(fillData);
            fillData.setName("张三");
            fillData.setNumber(5.2);
        }
        return list;
    }*/
    private List<User> data(){
        return userService.selectAll();
    }

}
