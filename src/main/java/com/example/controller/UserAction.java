package com.example.controller;

import com.example.entity.Employee;
import com.example.dao.UserDao;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.util.*;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * @author LYF
 * @desc
 * @date 2021/3/19
 */

@Controller
@RequestMapping("/admin")
public class UserAction {
    @Resource
    private HttpSession session;
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String username, String password, String Code) throws Exception {
        try {
            Employee employee = userService.login(username, password, Code);
            session.setAttribute("admin",employee);
            return "redirect:/main/main.jsp";
        } catch (Exception e) {
            String message = e.getMessage();
            session.setAttribute("message",message);
            return "redirect:/login/login.jsp";
        }
    }

    @RequestMapping("/getCode")
    public String getImageCode(HttpServletResponse response) throws Exception {
        String code = SecurityCode.getSecurityCode();//通过工具类获取验证码
        session.setAttribute("code", code); //在session中放一份验证码
        BufferedImage image = SecurityImage.createImage(code); //给验证码通过工具类获取图片流
        ServletOutputStream out = null;//输出流为null
        try {
            out = response.getOutputStream();//通过响应获取输出流
            ImageIO.write(image, "png", out);//调用图片流的写方法，通过输出流写出图片
        } catch (Exception e) {
        }
        return null;
    }

}
