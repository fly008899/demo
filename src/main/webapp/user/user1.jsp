<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script type="application/javascript">
        $(function () {
            $("#userlist").jqGrid({
                url: "${path}/user/showAll",
                editurl: "${path}/user/jqgrid",
                postData: {id:"${sessionScope.admin.id}"},
                styleUI: "Bootstrap",
                datatype: "json",
                height: "auto",
                //colNames: ["账号", "密码", "姓名", "性别", "户口所在地" , "学历" , "婚否" , "籍贯" , "毕业学校" , "专业" , "毕业时间", "工作年限", "照片", "现居地址", "手机", "紧急电话", "紧急联系人", "入职时间", "部门", "职位", "身份证号"],
                colNames: ["用户姓名", "用户账号", "登录密码", "操作"],
                autowidth: true,
                pager: "#userpager", //生成分页的工具栏
                rowNum: 6,      //后台每页显示的条数
                rowList: [4, 6, 8, 10], //展示的记录条数
                viewrecords: true,  //展示总条数
                colModel: [
                    {name: "realname", editable: true, width: 90, align: "left"},
                    {name: "username", editable: true, width: 90, align: "left"},
                    {name: "password", editable: true, width: 90, align: "left"},
                    {
                        name: "status", width: 90, align: "left",
                        formatter: function (cellvalue, option, row) {
                            if(row.username=="${sessionScope.admin.username}"){
                                return "<button class='btn btn-primary' data-toggle='modal' data-target='#myModal' onclick='show(\"" + row.id + "\",\"" + cellvalue + "\")'>员工信息</button>"+
                                    "&nbsp;<button class='btn btn-success'  data-toggle='modal' data-target='#updateModal' onclick='change(\"" + row.id + "\",\"" + cellvalue + "\")'>修改信息</button>";
                            }else return "<button class='btn btn-primary'  data-toggle='modal' data-target='#myModal' onclick='show(\"" + row.id + "\",\"" + cellvalue + "\")'>员工信息</button>"
                        },
                    }]
            });
            <!--增删改样式-->
            $("#userlist").jqGrid('navGrid', '#userpager', {
                    add: false, addtext: "添加账户",
                    del: false, deltext: "删除",
                    edit: false, edittext: "编辑"
                },
                <!--添加操作-->
                {closeAfterAdd: true, closeAfterEdit: true},
                {closeAfterAdd: true, closeAfterEdit: true},
                <!--删除操作-->
                {}
            );
        });



    </script>
</head>
<body>
<jsp:include page="../EmployeeInfo.jsp"></jsp:include>
<jsp:include page="../EmployeeUpdate.jsp"></jsp:include>
<!--初始化面板-->
<br>
<div class="panel panel-danger">

    <div class="panel panel-heading">
        <h2>员工管理</h2>
    </div>

</div>
<div id="show" class="alert alert-warning alert-dismissable" role="alert" style="display: none">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="ture">&times;</span>
    </button>
    <strong id="warning"></strong>
</div>

<!--初始化表单-->
<table id="userlist"></table>

<!--定义分页工具栏-->
<div id="userpager"></div>
</div>
</body>
</html>