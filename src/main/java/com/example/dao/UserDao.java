package com.example.dao;

import com.example.entity.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("userDao")
public interface UserDao {
    public Employee login(@Param("username")String username, @Param("password")String password);
}
