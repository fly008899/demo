<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>new document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <script type="text/javascript">
        window.onload = function(){
            var tr=document.getElementsByTagName("tr");
            for(var i= 0;i<tr.length;i++){
                bgcChange(tr[i]);
            }

        }
        // 鼠标移动改变背景,可以通过给每行绑定鼠标移上事件和鼠标移除事件来改变所在行背景色。
        function bgcChange(obj){
            obj.onmouseover=function(){
                obj.style.backgroundColor="#f2f2f2";
            }
            obj.onmouseout=function(){
                obj.style.backgroundColor="#fff";
            }
        }

        // 编写一个函数，供添加按钮调用，动态在表格的最后一行添加子节点；
        var num=2;
        function add(){
            num++;
            var tr=document.createElement("tr");
            var xh=document.createElement("td");
            var xm=document.createElement("td");
            xh.innerHTML="00"+num;
            xm.innerHTML="第"+num+"学生";
            var del=document.createElement("td");
            del.innerHTML="<a href='javascript:;' onclick='del(this)' >删除</a>";
            var tab=document.getElementById("table");
            tab.appendChild(tr);
            tr.appendChild(xh);
            tr.appendChild(xm);
            tr.appendChild(del);
            var tr = document.getElementsByTagName("tr");
            for(var i= 0;i<tr.length;i++){
                bgcChange(tr[i]);
            }
        }
        // 创建删除函数
        function del(obj){
            var tr=obj.parentNode.parentNode;
            tr.parentNode.removeChild(tr);
        }


    </script>
</head>
<body>
<table border="1" width="50%" id="table">
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    <tr>
        <td>001</td>
        <td>李小明</td>
        <td><a href="javascript:;" onclick="del(this);">删除</a></td>在删除按钮上添加点击事件
    </tr>
    <tr>
        <td>002</td>
        <td>张小芳</td>
        <td><a href="javascript:;" onclick="del(this);">删除</a></td>在删除按钮上添加点击事件
    </tr>
</table>
<input type="button" value="添加一行" onclick="add()" />
在添加按钮上添加点击事件
</body>
</html>
