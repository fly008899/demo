package com.example;

import com.example.dao.UserDao;
import com.example.entity.Employee;
import com.example.entity.FamilyNumber;
import com.example.entity.WorkExperience;
import com.example.service.EmployeeService;
import com.example.service.ExpService;
import com.example.service.FamilyService;
import com.example.service.UserService;
import com.example.util.Md5Utils;
import com.example.util.UUIDUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @author LYF
 * @desc
 * @date 2021/3/19
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class Test1 {

    @Autowired
    private UserDao userDao;
    @Autowired
    private UserService userService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private ExpService expService;
    @Autowired
    private FamilyService familyService;

    @Test
    public void test(){
        Employee login = userDao.login("admin", "admin");
        System.out.println(login.getUsername());
    }

    @Test
    public void test1(){
        List<FamilyNumber> familyNumbers = familyService.showById("1");
        System.out.println(familyNumbers.size());
    }

    @Test
    public void test2(){

    }
}

