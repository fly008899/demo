package com.example.service;


import com.example.entity.FamilyNumber;

import java.util.List;

public interface FamilyService {
    public List<FamilyNumber> showById(String id);

    public void add(FamilyNumber familyNumber);

    public void del(String id);

}
