package com.example.service;


import com.example.entity.WorkExperience;

import java.util.List;

public interface ExpService {
    public List<WorkExperience> showById(String id);

    public void add(WorkExperience workExperience);

    public void del(String id);
}
