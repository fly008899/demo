package com.example.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.example.entity.Employee;
import com.example.entity.FamilyNumber;
import com.example.entity.WorkExperience;
import com.example.service.EmployeeService;
import com.example.service.ExpService;
import com.example.service.FamilyService;
import com.example.util.UUIDUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * @author LYF
 * @desc
 * @date 2021/3/19
 */

@Controller
@RequestMapping("/user")
public class EmployeeAction {
    @Resource
    private HttpSession session;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private ExpService expService;
    @Autowired
    private FamilyService familyService;

    @RequestMapping("/show")
    public List<Employee> show() {
        List<Employee> employee = employeeService.showAll();
        return employee;
    }

    @RequestMapping("/quit")
    @ResponseBody
    public String quit() {
        session.invalidate();
        return "ok";
    }

    @RequestMapping("/showOne")
    @ResponseBody
    public Employee showOne(String id) {
        Employee employee = employeeService.selectOne(id);
        return employee;
    }

    @RequestMapping("/showAll")
    @ResponseBody
    public Map<String, Object> showAll(String id, Integer page, Integer rows) {
        List<Employee> employee = new ArrayList<>();
        if (id != null) {
            Employee employ = employeeService.selectOne(id);
            employee.add(employ);
            //查询总条数
            Map<String, Object> maps = new HashMap<String, Object>();
            //当前页号
            maps.put("page", 1);
            //总条数
            maps.put("records", 1);
            //总页数
            maps.put("total", 1);
            //每页具体的数据
            maps.put("rows", employee);
            return maps;
        } else {
            //当前页的数据
            employee = employeeService.showAllEmployee(page, rows);
            //查询总条数
            Integer totalCount = employeeService.totalCount();
            Map<String, Object> maps = new HashMap<String, Object>();
            //当前页号
            maps.put("page", page);
            //总条数
            maps.put("records", totalCount);
            //总页数
            Integer pageCount = 0;
            if (totalCount % rows == 0) {
                pageCount = totalCount / rows;
            } else {
                pageCount = totalCount / rows + 1;
            }
            maps.put("total", pageCount);
            //每页具体的数据
            maps.put("rows", employee);
            return maps;

        }
    }

    @RequestMapping("/uploadPic")
    public void uploadPic(MultipartFile picture, String id, HttpServletRequest request) {
        //获取要上传文件夹的路径
        String realPath = request.getSession().getServletContext().getRealPath("/upload/photo");
        //获取文件夹
        File file = new File(realPath);
        //创建文件夹
        if (!file.exists()) {
            file.mkdirs();
        }
        //获取上传文件的名字
        String filename = picture.getOriginalFilename();
        String name = new Date().getTime() + "_" + filename;
        //文件上传
        try {
            picture.transferTo(new File(realPath, name));
        } catch (IOException e) {
            e.printStackTrace();
        }
        Employee employee = new Employee();
        employee.setId(id);
        employee.setPhoto("\\upload\\photo\\" + name);
        //做修改,修改默认的图片路径
        employeeService.update(employee);
    }

    @RequestMapping("/jqgrid")
    @ResponseBody
    public String add(Employee employee, String oper) {
        String uuid = null;
        //执行添加方法
        if (oper.equals("add")) {
            uuid = employeeService.add(employee);
        }
        //执行修改方法
        if (oper.equals("edit")) {
            if (employee.getPhoto() == "") {
                employee.setPhoto(null);
            }
            employeeService.update(employee);
        }
        //执行删除方法
        if (oper.equals("del")) {
            employeeService.del(employee.getId());
        }
        return uuid;
    }

    @RequestMapping("/edit")
    @ResponseBody
    public void update(HttpServletRequest request) {
        Employee employee = new Employee();
        String[] lists = request.getParameterValues("list");
        String[] id = request.getParameterValues("id");
        employee.setId(id[0]);
        employee.setRealname(lists[0]);
        employee.setResidence_address(lists[2]);
        employee.setEducation(lists[3]);
        employee.setNative_place(lists[4]);
        employee.setEdu_school(lists[5]);
        employee.setMajor(lists[6]);
        employee.setComplete_edu_time(lists[7]);
        employee.setWorking_years(lists[8]);
        employee.setNow_address(lists[9]);
        employee.setPhone(lists[10]);
        employee.setEmergency_phone(lists[11]);
        employee.setEmergency_person(lists[12]);
        employee.setEntry_time(lists[13]);
        employee.setDepartment(lists[14]);
        employee.setPost(lists[15]);
        employee.setId_card(lists[16]);
        employee.setRemark(lists[17]);
        employee.setSex(lists[18]);
        employee.setIs_marry(lists[19]);
        employeeService.update(employee);

    }

    @RequestMapping("/edit_else")
    @ResponseBody
    public void updateExpAndFam(HttpServletRequest request) {
        WorkExperience workExperience = new WorkExperience();
        FamilyNumber familyNumber = new FamilyNumber();
        String[] id = request.getParameterValues("id");
        String[] table1 = request.getParameterValues("list1");
        String[] table2 = request.getParameterValues("list2");
        if (table1 != null || table2 != null) {
            if (table1 != null && table2 == null) {
                for (int i = 0, j = 0; i < table1.length / 5; i++) {
                    workExperience.setId(UUIDUtil.getUUID());
                    workExperience.setStart_date(table1[j++]);
                    workExperience.setCompany(table1[j++]);
                    workExperience.setDepartment(table1[j++]);
                    workExperience.setPost(table1[j++]);
                    workExperience.setCertificate(table1[j++]);
                    workExperience.setEmployee_id(id[0]);
                    expService.add(workExperience);
                }
            }
            if (table2 != null && table1 == null) {
                for (int i = 0, j = 0; i < table2.length / 5; i++) {
                    familyNumber.setId(UUIDUtil.getUUID());
                    familyNumber.setName(table2[j++]);
                    familyNumber.setAge(table2[j++]);
                    familyNumber.setRelationship(table2[j++]);
                    familyNumber.setProfession(table2[j++]);
                    familyNumber.setPhone(table2[j++]);
                    familyNumber.setEmployee_id(id[0]);
                    familyService.add(familyNumber);
                }

            }
            if (table1 != null && table2 != null) {
                for (int i = 0, j = 0; i < table1.length / 5; i++) {
                    workExperience.setId(UUIDUtil.getUUID());
                    workExperience.setStart_date(table1[j++]);
                    workExperience.setCompany(table1[j++]);
                    workExperience.setDepartment(table1[j++]);
                    workExperience.setPost(table1[j++]);
                    workExperience.setCertificate(table1[j++]);
                    workExperience.setEmployee_id(id[0]);
                    expService.add(workExperience);
                }
                for (int i = 0, k = 0; i < table2.length / 5; i++) {
                    familyNumber.setId(UUIDUtil.getUUID());
                    familyNumber.setName(table2[k++]);
                    familyNumber.setAge(table2[k++]);
                    familyNumber.setRelationship(table2[k++]);
                    familyNumber.setProfession(table2[k++]);
                    familyNumber.setPhone(table2[k++]);
                    familyNumber.setEmployee_id(id[0]);
                    familyService.add(familyNumber);
                }
            }
        }
    }


    @RequestMapping("/output")
    @ResponseBody
    public HashMap<String, Object> updateStatus(){
        //查询数据库返回集合
        List<Employee> list = employeeService.showAll();
        //easypoi 封装完整，简单导出好用。需要引jar包，支持内嵌集合

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("用户列表","用户表"),Employee.class, list);


        HashMap<String, Object> map = new HashMap<>();
        //导出
        try {
            workbook.write(new FileOutputStream(new File("D://EmployeePoi.xls")));
            workbook.close();
        } catch (IOException e) {
            map.put("success","400");
            map.put("message","导出表失败!");
            e.printStackTrace();
        }

        map.put("success","200");
        map.put("message","导出表单成功!");
        return map;
    }
}
