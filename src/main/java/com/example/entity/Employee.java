package com.example.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * @author LYF
 * @desc
 * @date 2021/3/19
 */
public class Employee {
    @Excel(name = "ID")
    private String id;
    @Excel(name = "账号")
    private String username;
    @Excel(name = "密码")
    private String password;
    @Excel(name = "真实姓名")
    private String realname;
    @Excel(name = "性别")
    private String sex;
    @Excel(name = "籍贯")
    private String residence_address;
    @Excel(name = "学历")
    private String education;
    @Excel(name = "婚否")
    private String is_marry;
    @Excel(name = "户口")
    private String native_place;
    @Excel(name = "毕业学校")
    private String edu_school;
    @Excel(name = "专业")
    private String major;
    @Excel(name = "毕业时间")
    private String complete_edu_time;
    @Excel(name = "工作年限")
    private String working_years;
    @Excel(name = "照片")
    private String photo;
    @Excel(name = "现居地址")
    private String now_address;
    @Excel(name = "手机号")
    private String phone;
    @Excel(name = "紧急电话")
    private String emergency_phone;
    @Excel(name = "紧急联系人")
    private String emergency_person;
    @Excel(name = "入职时间")
    private String entry_time;
    @Excel(name = "部门")
    private String department;
    @Excel(name = "职位")
    private String post;
    @Excel(name = "身份证")
    private String id_card;
    @Excel(name = "备注")
    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getResidence_address() {
        return residence_address;
    }

    public void setResidence_address(String residence_address) {
        this.residence_address = residence_address;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getIs_marry() {
        return is_marry;
    }

    public void setIs_marry(String is_marry) {
        this.is_marry = is_marry;
    }

    public String getNative_place() {
        return native_place;
    }

    public void setNative_place(String native_place) {
        this.native_place = native_place;
    }

    public String getEdu_school() {
        return edu_school;
    }

    public void setEdu_school(String edu_school) {
        this.edu_school = edu_school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getComplete_edu_time() {
        return complete_edu_time;
    }

    public void setComplete_edu_time(String complete_edu_time) {
        this.complete_edu_time = complete_edu_time;
    }

    public String getWorking_years() {
        return working_years;
    }

    public void setWorking_years(String working_years) {
        this.working_years = working_years;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getNow_address() {
        return now_address;
    }

    public void setNow_address(String now_address) {
        this.now_address = now_address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmergency_phone() {
        return emergency_phone;
    }

    public void setEmergency_phone(String emergency_phone) {
        this.emergency_phone = emergency_phone;
    }

    public String getEmergency_person() {
        return emergency_person;
    }

    public void setEmergency_person(String emergency_person) {
        this.emergency_person = emergency_person;
    }

    public String getEntry_time() {
        return entry_time;
    }

    public void setEntry_time(String entry_time) {
        this.entry_time = entry_time;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getId_card() {
        return id_card;
    }

    public void setId_card(String id_card) {
        this.id_card = id_card;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }

}
