package com.example.service;

import com.example.util.*;
import com.example.dao.EmployeeDao;
import com.example.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class EmployeeServiceImp implements EmployeeService{
    @Autowired
    private EmployeeDao employeeDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Employee> showAll() {
        List<Employee> list = employeeDao.showAll();
        return list;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Employee> showAllEmployee(Integer page, Integer rows) {
        List<Employee> employees = employeeDao.showAllEmployee(page, rows);
        return employees;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer totalCount() {
        Integer totalcount = employeeDao.totalcount();
        return totalcount;
    }

    @Override
    public String add(Employee employee) {
        employee.setId(UUIDUtil.getUUID());
        //String salt = Md5Utils.getSalt(3);
        //String password=employee.getPassword()+salt;
        //String pass = Md5Utils.getMd5Code(password);
        //employee.setPassword(pass);
        //employee.setSalt(salt);
        employeeDao.add(employee);
        System.out.println(employee.toString());
        return employee.getId();
    }

    @Override
    public void del(String id) {
        employeeDao.del(id);
    }

    @Override
    public void update(Employee employee) {
        employeeDao.update(employee);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Employee selectOne(String id) {
        Employee employee = employeeDao.selectOne(id);
        return employee;
    }
}