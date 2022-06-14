package com.example.service;

import com.example.dao.FamilyDao;
import com.example.entity.FamilyNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author LYF
 * @desc
 * @date 2021/3/22
 */

@Service
@Transactional
public class FamilyServieImp implements FamilyService{
    @Autowired
    private FamilyDao familyDao;


    @Override
    public List<FamilyNumber> showById(String id) {
        List<FamilyNumber> familyNumbers = familyDao.showById(id);
        return familyNumbers;
    }

    @Override
    public void add(FamilyNumber familyNumber) {

        familyDao.add(familyNumber);
    }

    @Override
    public void del(String id) {
        familyDao.del(id);
    }
}
