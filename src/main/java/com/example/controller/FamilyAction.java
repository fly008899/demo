package com.example.controller;

import com.example.entity.FamilyNumber;
import com.example.service.FamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author LYF
 * @desc
 * @date 2021/3/22
 */
@Controller
@RequestMapping("/family")
public class FamilyAction {
    @Autowired
    private FamilyService familyService;

    @RequestMapping("/showFam")
    @ResponseBody
    public List<FamilyNumber> showExp(String id) {
        List<FamilyNumber> familyNumbers = familyService.showById(id);
        return familyNumbers;
    }

    @RequestMapping("/del")
    @ResponseBody
    public void del(String id) {
        familyService.del(id);
    }
}
