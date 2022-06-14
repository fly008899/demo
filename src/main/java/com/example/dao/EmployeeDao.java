package com.example.dao;


import com.example.entity.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component("employeeDao")
public interface EmployeeDao {
    public List<Employee> showAll();

    public List<Employee> showAllEmployee(@Param("page") Integer page, @Param("rows") Integer rows);

    public void add(Employee employee);

    public void del(String id);

    public void update(Employee employee);

    public Employee selectOne(String id);

    public Integer totalcount();
}
