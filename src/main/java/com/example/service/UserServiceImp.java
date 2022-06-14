package com.example.service;

import com.example.dao.UserDao;
import com.example.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;

/**
 * @author LYF
 * @desc
 * @date 2021/3/19
 */
@Service
@Transactional
public class UserServiceImp implements UserService{
    @Autowired
    private HttpSession session;
    @Autowired
    private UserDao userDao;

    @Override
    public Employee login(String username,String password,String Code) {
        Employee employee = userDao.login(username, password);
        Object code = session.getAttribute("code");
        if(!code.equals(Code)) throw new RuntimeException("验证码错误");
        if(employee!=null) session.setAttribute("admin",employee);
        if(employee==null) throw new RuntimeException("用户名或密码错误");
        return employee;
    }
}
