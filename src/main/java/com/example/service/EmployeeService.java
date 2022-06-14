package com.example.service;

import com.example.entity.Employee;
import java.util.List;

public interface EmployeeService {
    public List<Employee> showAll();
    public List<Employee> showAllEmployee(Integer page, Integer rows);
    public Integer  totalCount();
    public String add(Employee employee);
    public void del(String id);
    public void update(Employee employee);
    public Employee selectOne(String id);
}
