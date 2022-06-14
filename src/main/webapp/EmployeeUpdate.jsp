<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="./AlertModle.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<script>
    //展示窗口弹出后函数
    function change(id) {
        //查询员工信息
        $.ajax({
            url: "${path}/user/showOne",
            type: "post",
            dataType: "JSON",
            data: {"id": id},
            success: function (data) {
                document.getElementById("NewPhoto").setAttribute("src", "${pageContext.request.contextPath}" + data.photo);
                $("#id").val(id);
                $("#realname1").val(data.realname);
                $("#sex1").val(data.sex);
                $("#residence_address1").val(data.residence_address);
                $("#education1").val(data.education);
                $("#is_marry1").val(data.is_marry);
                $("#native_place1").val(data.native_place);
                $("#edu_school1").val(data.edu_school);
                $("#major1").val(data.major);
                $("#complete_edu_time1").val(data.complete_edu_time);
                $("#working_years1").val(data.working_years);
                $("#now_address1").val(data.now_address);
                $("#phone1").val(data.phone);
                $("#emergency_phone1").val(data.emergency_phone);
                $("#emergency_person1").val(data.emergency_person);
                $("#entry_time1").val(data.entry_time);
                $("#department1").val(data.department);
                $("#post1").val(data.post);
                $("#id_card1").val(data.id_card);
                $("#remark1").val(data.remark);
            }
        });
        //查询员工工作经历
        $.ajax({
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
                    var del = document.createElement("td");
                    var hide = document.createElement("td");
                    start.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"start_date\" value='" + data[i].start_date + "'/>";
                    company.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"company\" value='" + data[i].company + "'/>";
                    department.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"department\" value='" + data[i].department + "'/>";
                    post.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"post\" value='" + data[i].post + "'/>";
                    certificate.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"certificate\" value='" + data[i].certificate + "'/>";
                    del.innerHTML = "<button  href='javascript:;' onclick='del(this)' ><font size='1'>删除<font></button >";
                    hide.innerHTML = "<input class='B01' hidden='hidden' readonly=\"readonly\" type=\"text\" name=\"id\" value='" + data[i].id + "'/>";
                    var tab = document.getElementById("table2");
                    tab.appendChild(tr);
                    tr.appendChild(start);
                    tr.appendChild(company);
                    tr.appendChild(department);
                    tr.appendChild(post);
                    tr.appendChild(certificate);
                    tr.appendChild(del);
                    tr.appendChild(hide);
                }
            }
        });

        //查询员工家庭成员
        $.ajax({
            url: "${path}/family/showFam",
            type: "post",
            dataType: "JSON",
            data: {"id": id},
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var tr = document.createElement("tr");
                    var td1 = document.createElement("td");
                    var td2 = document.createElement("td");
                    var td3 = document.createElement("td");
                    var td4 = document.createElement("td");
                    var td5 = document.createElement("td");
                    var del = document.createElement("td");
                    var hide = document.createElement("td");
                    td1.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"name\" value='" + data[i].name + "'/>";
                    td2.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"age\" value='" + data[i].age + "'/>";
                    td3.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"relationship\" value='" + data[i].relationship + "'/>";
                    td4.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"profession\" value='" + data[i].profession + "'/>";
                    td5.innerHTML = "<input class=\"form-control\" readonly=\"readonly\" type=\"text\" name=\"phone\" value='" + data[i].phone + "'/>";
                    del.innerHTML = "<button  href='javascript:;' onclick='del(this)' ><font size='1'>删除<font></button >";
                    hide.innerHTML = "<input class='B01' hidden='hidden' readonly=\"readonly\"  ' type=\"text\" name=\"id\" value='" + data[i].id + "'/>";
                    var tab = document.getElementById("table3");
                    tab.appendChild(tr);
                    tr.appendChild(td1);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);
                    tr.appendChild(td5);
                    tr.appendChild(del);
                    tr.appendChild(hide);
                }
            }
        });
    }

    //添加table行
    function add() {
        var tr = document.createElement("tr");
        var td1 = document.createElement("td");
        var td2 = document.createElement("td");
        var td3 = document.createElement("td");
        var td4 = document.createElement("td");
        var td5 = document.createElement("td");
        var td6 = document.createElement("td");
        td1.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"start_date\"/></div>";
        td2.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"company\"/></div>";
        td3.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"department\"/></div>";
        td4.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"post\"/></div>";
        td5.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"certificate\"/></div>";
        td6.innerHTML = "<button class=\"button button-pill\" onclick=\"del(this)\">-</button>";
        var tab = document.getElementById("table2");
        tab.appendChild(tr);
        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        tr.appendChild(td4);
        tr.appendChild(td5);
        tr.appendChild(td6);
    }

    //添加table行
    function add1() {
        var tr = document.createElement("tr");
        var td1 = document.createElement("td");
        var td2 = document.createElement("td");
        var td3 = document.createElement("td");
        var td4 = document.createElement("td");
        var td5 = document.createElement("td");
        var td6 = document.createElement("td");
        td1.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"name\"/></div>";
        td2.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"age\"/></div>";
        td3.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"relationship\"/></div>";
        td4.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"profession\"/></div>";
        td5.innerHTML = "<input class=\"form-control\" type=\"text\" name=\"phone\"/></div>";
        td6.innerHTML = "<button class=\"button button-pill\" onclick=\"del(this)\">-</button>";
        var tab = document.getElementById("table3");
        tab.appendChild(tr);
        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        tr.appendChild(td4);
        tr.appendChild(td5);
        tr.appendChild(td6);
    }

    //移除指定行
    function del(obj) {
        //判断是新数据还是老数据
        if (obj.innerText == "删除") {
            var table_id = $(obj).parent().parent().parent().attr('id');
            var id = $(obj).parent().next().children().val();
            if ("table2" == table_id) {
                $.ajax({ //插入form中数据
                    url: "${path}/exp/del",
                    type: "post",
                    data: {"id": id},
                    success: function () {
                        //可最后关闭模态框
                    }
                });
            } else if ("table3" == table_id) {
                $.ajax({ //插入form中数据
                    url: "${path}/family/del",
                    type: "post",
                    data: {"id": id},
                    success: function () {
                        //可最后关闭模态框
                    }
                });
            }
        }
        var tr = obj.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
    }

    //预览上传照片
    function showPhoto(file) {
        var prevDiv = document.getElementById('NewPhoto');
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                prevDiv.setAttribute("src", evt.target.result);
            };
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<src class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></src>';
        }
    }

    // 添加入库操作
    function update_info() {
        var id = document.getElementById("id").value;
        var picture = document.getElementById("picture").value;
        if (picture != "") {//不为空先传图片
            $.ajaxFileUpload({
                //文件上传
                url: "${path}/user/uploadPic",
                type: "post",
                dataType: "JSON",
                fileElementId: "picture",
                data: {id: id},
                async: false,
                success: function () {
                    //可最后关闭模态框
                }
            });
        }

        //from表内数据取出并异步传送后台更新
        var formDD = document.getElementById("form_data");
        var inputs = formDD.getElementsByTagName("input");//得到input数组
        var select = formDD.getElementsByTagName("select");
        var list = new Array();
        var j = 0;
        for (var i = 0; i < inputs.length; i++) {
            var value = inputs[i].value;
            list[i] = value;
        }
        for (var i = inputs.length; i < inputs.length + select.length; i++) {
            var value1 = select[j].value;
            j++;
            list[i] = value1;
        }
        $.ajax({ //插入form中数据
            url: "${path}/user/edit",
            type: "post",
            data: {"list": list, "id": id},
            traditional: true,
            success: function () {
                //可最后关闭模态框
            }
        });

        //两table内数据取出并异步传送后台更新
        var table_list1 = new Array();
        var table_list2 = new Array();
        var table2 = document.getElementById("table2");
        var table3 = document.getElementById("table3");
        var inputs2 = table2.getElementsByTagName("input");
        var inputs3 = table3.getElementsByTagName("input");
        var paragraphs2 = Array.prototype.slice.call(inputs2, 0);
        var paragraphs3 = Array.prototype.slice.call(inputs3, 0);
        for (var i = 0, j = 0; i < paragraphs2.length; i++) {
            if (paragraphs2[i].hasAttribute("readonly")) {
                continue;
            }
            var value = inputs2[i].value;
            table_list1[j++] = value;
        }
        for (var i = 0, j = 0; i < inputs3.length; i++) {
            if (paragraphs3[i].hasAttribute("readonly")) {
                continue;
            }
            var value = inputs3[i].value;
            table_list2[j++] = value;
        }
        $.ajax({ //插入table中数据
            url: "${path}/user/edit_else",
            type: "post",
            data: {"list1": table_list1, "list2": table_list2, "id": id},
            traditional: true,
            success: function () {
                //可最后关闭模态框
                $('#updateModal').modal('hide');
                //alertWin('更新成功');
            }
        });
    }

    //模态框退出后刷新清空缓存
    $('#updateModal').on('hidden.bs.modal', function () {
        if ("${sessionScope.admin.department}" == "人事部") {
            location.href = "javascript:$('#ChangePart').load('${path}/user/user.jsp')";
        } else {
            location.href = "javascript:$('#ChangePart').load('${path}/user/user1.jsp')";
        }
    });

</script>
<body>
<div id="show" class="alert alert-warning alert-dismissable" role="alert" style="display: none">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="ture">&times;</span>
    </button>
    <strong id="warning"></strong>
</div>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:700px">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>

                <h4 class="modal-title" id="myModalLabel">
                    员工信息
                    <input type="text" id="id" hidden="hidden"/>
                </h4>
            </div>
            <form id="form_data">
                <div class="form-group">
                    <label class="col-sm-2 control-label" style="margin-top:50px">姓名:</label>
                    <div class="col-md-4" style="margin-top:50px">
                        <input class="form-control" name="realname" type="text" id="realname1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:50px">照片:</label>
                    <div class="col-md-4" style="margin-top:25px">
                        <img width="80px" height="80px" class="img-circle" id="NewPhoto" src=""/>
                        <input type="file" id="picture" name="picture" onchange="showPhoto(this)"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">性别:</label>
                    <div class="col-md-4" style="-webkit-align-content: center">
                        <select name="sex" id="sex1" style="width: 200px;height: 35px">
                            <option value="0">女</option>
                            <option value="1">男</option>
                        </select>
                    </div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">户口地:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="residence_address" type="text" id="residence_address1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">学历:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="education" type="text" id="education1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">婚姻:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <select name="is_marry" id="is_marry1" style="width: 200px;height: 35px">
                            <option value="0">未婚</option>
                            <option value="1">已婚</option>
                        </select>
                    </div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">籍贯:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="native_place" type="text" id="native_place1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">毕业学院:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="edu_school" type="text" id="edu_school1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">所学专业:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="major" type="text" id="major1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">毕业时间:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="complete_edu_time" type="text" id="complete_edu_time1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">工作年限:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="working_years" type="text" id="working_years1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">现住址:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="now_address" type="text" id="now_address1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">联系电话:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="phone" type="text" id="phone1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">应急电话:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="emergency_phone" type="text" id="emergency_phone1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">应急对象:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="emergency_person" type="text" id="emergency_person1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">入职时间:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="entry_time" type="text" id="entry_time1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">所属部门:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="department" type="text" id="department1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">入职岗位:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="post" type="text" id="post1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">身份证号:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="id_card" type="text" id="id_card1"/></div>
                    <label class="col-sm-2 control-label" style="margin-top:10px">备注:</label>
                    <div class="col-md-4" style="margin-top:10px">
                        <input class="form-control" name="remark" type="text" id="remark1"/></div>
                </div>
            </form>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <h4 class="modal-title" align="center">
                    工作经历
                </h4>
                <table class="table" id="table2">
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
                        <th>
                            <button class="icon-plus" onclick="add()">+</button>
                        </th>
                    </tr>
                </table>
            </div>
            <div>
                <h4 class="modal-title" align="center" id="Imge03">
                    家庭成员
                </h4>
                <table class="table" id="table3">
                    <tr class="table_header">
                        <th>
                            <label>
                                姓名
                            </label>
                        </th>
                        <th>
                            <label>
                                年龄
                            </label>

                        </th>
                        <th>
                            <label>
                                关系
                            </label>
                        </th>
                        <th>
                            <label>
                                工作单位/职业
                            </label>
                        </th>
                        <th>
                            <label>
                                联系电话
                            </label>
                        </th>
                        <th>
                            <button class="button button-pill" onclick="add1()">+</button>
                        </th>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="text-align:center">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" onclick="update_info()" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->
</body>
</html>