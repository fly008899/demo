package com.example.dao;

import com.example.entity.FamilyNumber;
import com.example.entity.WorkExperience;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component("familyDao")
public interface FamilyDao {
    public List<FamilyNumber> showById(String id);

    public void add(FamilyNumber familyNumber);

    public void del(String id);

}
