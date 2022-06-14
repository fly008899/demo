<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script>

    //展示信息
    function show(id) {
        $.ajax({ //查询员工信息
            url: "${path}/user/showOne",
            type: "post",
            dataType: "JSON",
            data: {"id": id},
            success: function (data) {
                document.getElementById("pic").setAttribute("src", "${pageContext.request.contextPath}" + data.photo);
                $("#realname").val(data.realname);
                if (data.sex == "1") {
                    $("#sex").val("男");
                } else $("#sex").val("女");
                $("#residence_address").val(data.residence_address);
                $("#education").val(data.education);
                if (data.is_marry == "1") {
                    $("#is_marry").val("未婚");
                } else $("#is_marry").val("已婚");
                $("#native_place").val(data.native_place);
                $("#edu_school").val(data.edu_school);
                $("#major").val(data.major);
                $("#complete_edu_time").val(data.complete_edu_time);
                $("#working_years").val(data.working_years);
                $("#now_address").val(data.now_address);
                $("#phone").val(data.phone);
                $("#emergency_phone").val(data.emergency_phone);
                $("#emergency_person").val(data.emergency_person);
                $("#entry_time").val(data.entry_time);
                $("#department").val(data.department);
                $("#post").val(data.post);
                $("#id_card").val(data.id_card);
                $("#remark").val(data.remark);
            }
        });

        $.ajax({ //查询员工工作经历
            url: "${path}/exp/showExp",
            type: "post",
            dataType: "JSON",
            data: {"id": id},
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var tr = document.createElement("tr");
                    var start = document.createElement("td");
                    var company = document.createElement("td");
                    var department = document.createElement("td");
                    var post = document.createElement("td");
                    var certificate = document.createElement("td");
                    start.innerHTML = data[i].start_date;
                    company.innerHTML = data[i].company;
                    department.innerHTML = data[i].department;
                    post.innerHTML = data[i].post;
                    certificate.innerHTML = data[i].certificate;
                    var tab = document.getElementById("table");
                    tab.appendChild(tr);
                    tr.appendChild(start);
                    tr.appendChild(company);
                    tr.appendChild(department);
                    tr.appendChild(post);
                    tr.appendChild(certificate);
                }
            }
        });

        $.ajax({ //查询员工家庭成员
            url: "${path}/family/showFam",
            type: "post",
            dataType: "JSON",
            data: {"id": id},
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var tr = document.createElement("tr");
                    var name = document.createElement("td");
                    var age = document.createElement("td");
                    var relationship = document.createElement("td");
                    var profession = document.createElement("td");
                    var phone = document.createElement("td");
                    name.innerHTML = data[i].name;
                    age.innerHTML = data[i].age;
                    relationship.innerHTML = data[i].relationship;
                    profession.innerHTML = data[i].profession;
                    phone.innerHTML = data[i].phone;
                    var tab = document.getElementById("table1");
                    tab.appendChild(tr);
                    tr.appendChild(name);
                    tr.appendChild(age);
                    tr.appendChild(relationship);
                    tr.appendChild(profession);
                    tr.appendChild(phone);
                }
            }
        });

    }

    //模态框退出后刷新清空缓存
    $('#myModal').on('hidden.bs.modal', function () {
        if ("${sessionScope.admin.department}" == "人事部") {
            location.href = "javascript:$('#ChangePart').load('${path}/user/user.jsp')";
        } else {
            location.href = "javascript:$('#ChangePart').load('${path}/user/user1.jsp')";
        }
    });


</script>
<body>
<br>
<div id="show" class="alert alert-warning alert-dismissable" role="alert" style="display: none">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="ture">&times;</span>
    </button>
    <strong id="warning"></strong>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:700px">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    员工信息
                </h4>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" style="margin-top:50px">姓名:</label>
                <div class="col-md-4" style="margin-top:50px">
                    <input class="form-control" type="text" id="realname" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:50px">照片:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <img width="80px" id="pic" class="img-circle" height="80px" src=""/>
                </div>
                <label class="col-sm-2 control-label" style="margin-top:25px">性别:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="sex" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">户口地:</label>
                <div class="col-md-4" style="margin-top:25px" style="margin-top:25px">
                    <input class="form-control" type="text" id="residence_address" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">学历:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="education" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">婚姻:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="is_marry" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">籍贯:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="native_place" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">毕业学院:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="edu_school" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">所学专业:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="major" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">毕业时间:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="complete_edu_time" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">工作年限:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="working_years" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">现住址:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="now_address" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">联系电话:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="phone" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">应急电话:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="emergency_phone" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">应急对象:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="emergency_person" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">入职时间:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="entry_time" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">所属部门:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="department" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">入职岗位:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="post" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">身份证号:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="id_card" readonly="readonly"/></div>
                <label class="col-sm-2 control-label" style="margin-top:25px">备注:</label>
                <div class="col-md-4" style="margin-top:25px">
                    <input class="form-control" type="text" id="remark" readonly="readonly"/></div>
            </div>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <h4 class="modal-title" align="center">
                    工作经历
                </h4>
                <table class="table" id="table">
                    <tr class="table_header">
                        <th>
                            <label>
                                起止年月
                            </label>
                        </th>
                        <th>
                            <label>
                                工作单位
                            </label>

                        </th>
                        <th>
                            <label>
                                部门
                            </label>
                        </th>
                        <th>
                            <label>
                                职务
                            </label>
                        </th>
                        <th>
                            <label>
                                培训/证书
                            </label>
                        </th>
                    </tr>
                </table>
            </div>
            <div>
                <h4 class="modal-title" align="center">
                    家庭成员
                </h4>
                <table class="table" id="table1">
                    <tr class="table_header">
                        <td>
                            <label>
                                姓名
                            </label>
                        </td>
                        <td>
                            <label>
                                年龄
                            </label>

                        </td>
                        <td>
                            <label>
                                关系
                            </label>
                        </td>
                        <td>
                            <label>
                                工作单位/职业
                            </label>
                        </td>
                        <td>
                            <label>
                                联系电话
                            </label>
                        </td>
                    </tr>
                </table>
            </div>

        </div>
        </form>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
</body>
</html>