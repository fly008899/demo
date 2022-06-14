package com.aliyun.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class HelloAliyunController {

    @RequestMapping("/frist")
    @ResponseBody
    public String frist(){
        System.out.println("第一个程序");
        return"hahaha";//springboot中天生不支持jsp，先用ResponseBody返回jason串
    }

}
