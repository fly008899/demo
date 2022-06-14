package com.example.service;
import com.example.entity.Employee;

public interface UserService {
    public Employee login(String username, String password, String Code);
}
