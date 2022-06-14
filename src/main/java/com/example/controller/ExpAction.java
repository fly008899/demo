package com.example.controller;

import com.example.entity.WorkExperience;
import com.example.service.ExpService;
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
@RequestMapping("/exp")
public class ExpAction {
    @Autowired
    private ExpService ExpService;

    @RequestMapping("/showExp")
    @ResponseBody
    public List<WorkExperience> showExp(String id) {
        List<WorkExperience> workExperiences = ExpService.showById(id);
        return workExperiences;
    }

    @RequestMapping("/del")
    @ResponseBody
    public void del(String id) {
        ExpService.del(id);
    }

}
