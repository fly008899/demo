package com.example.service;

import com.example.dao.ExpDao;
import com.example.dao.UserDao;
import com.example.entity.WorkExperience;
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
public class ExpServiceImp implements ExpService{

    @Autowired
    private ExpDao expDao;

    @Override
    public List<WorkExperience> showById(String id) {
        List<WorkExperience> workExperiences = expDao.showById(id);
        return workExperiences;
    }

    @Override
    public void add(WorkExperience workExperience) {
        expDao.add(workExperience);
    }

    @Override
    public void del(String id) {
        expDao.del(id);
    }
}
