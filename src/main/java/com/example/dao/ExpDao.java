package com.example.dao;


import com.example.entity.Employee;
import com.example.entity.WorkExperience;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component("expDao")
public interface ExpDao {
    public List<WorkExperience> showById(String id);

    public void add(WorkExperience workExperience);

    public void del(String id);
}
