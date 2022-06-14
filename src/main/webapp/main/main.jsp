<%@page pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>百和员工后台管理系统</title>
    <link rel="icon" href="${path}/bootstrap/img/arrow-up.png" type="image/x-icon">
    <link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/bootstrap/css/style.css">
    <%--引入jqgrid中主题css--%>
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/css/css/hot-sneaks/jquery-ui-1.8.16.custom.css">
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/boot/css/trirand/ui.jqgrid-bootstrap.css">
    <%--引入js文件--%>
    <script src="${path}/bootstrap/js/jquery.min.js"></script>
    <script src="${path}/bootstrap/js/bootstrap.js"></script>
    <script src="${path}/bootstrap/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script src="${path}/bootstrap/jqgrid/boot/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="${path}/bootstrap/js/ajaxfileupload.js"></script>

    <script type="application/javascript">
        function quit(){
            $.ajax({ //插入form中数据
                url: "${path}/user/quit",
                type: "post",
                traditional: true,
                success: function (data) {
                    if(data=="ok"){
                        location.href = "${path}/login/login.jsp";
                    }
                }
            });
        }
    </script>
</head>
<body>


<!--顶部导航-->
<!-- Nav tabs -->
<!--添加标签页的样式-->
<ul class="nav nav-tabs">
    <li><h4>百和员工后台管理系统</h4></li>

    <li style="left:700px;"><h5>当前用户：<span style="color: red">${sessionScope.admin.username}</span></h5></li>
    <li style="left:780px;" class="dropdown" style="left:480px">
        <a class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="true">
            admin
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="#Action" data-toggle="tab">管理信息</a></li>
            <li><a href="#Anotheraction" data-toggle="tab">管理状态</a></li>
        </ul>
    </li>
    <li style="left:300px;"><a style="left:480px" onclick="quit()" data-toggle="tab"><span
            class="glyphicon glyphicon-export">退出</span></a>
    </li>
</ul>
<!--栅格系统-->
<div class="row">
    <div class="col-md-2">
        <hr>
        <div style="width: 150px;margin: auto">
            <!--手风琴的样式 面板-->
            <div class="panel-group" id="accordion">
                <!--默认的面版样式-->
                <div class="panel panel-default">
                    <!--面板头-->
                    <div class="panel-heading" style="background: #a6e1ec">
                        <!--面板标题-->
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                用户管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <!--面板的主体内容-->
                        <div class="panel-body">
                            <c:if test="${sessionScope.admin.department=='人事部'}">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                    <a style="color: #ebcccc"
                                       href="javascript:$('#ChangePart').load('${path}/user/user.jsp')">
                                        员工管理
                                    </a>
                                </button>
                                <br/>
                            </c:if>
                            <c:if test="${sessionScope.admin.department!='人事部'}">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                    <a style="color: #ebcccc"
                                       href="javascript:$('#ChangePart').load('${path}/user/user1.jsp')">
                                        员工信息
                                    </a>
                                </button>
                                <br/>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" style="background: #a6e1ec">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                轮播图管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <!--面板的主体内容-->
                        <div class="panel-body">
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                                <a href="javascript:$('#ChangePart').load('${path}/banner/banner.jsp')">
                                    轮播图信息
                                </a>
                            </button>
                            <br/>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" style="background: #a6e1ec">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                其他
                            </a>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8" id="ChangePart">
        <div>
            <h1>欢迎来到百和员工后台管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <font size="3">
                    <nobr id="showtime"></nobr>
                </font>
            </h1>
        </div>
        <hr>
        <!--轮播图的相关样式-->        <!--滑动对应的幻灯片-->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            </ol>

            <!--幻灯片的图片-->
            <div class="carousel-inner" style="height: 380px">
                <div class="item active" style="height: 380px">
                    <img src="${pageContext.request.contextPath}/bootstrap/img/1.png"
                         style="width: 100%;height: 100%;margin: auto">
                    <div class="carousel-caption">
                        百和软件
                    </div>
                </div>
                <div class="item" style="height: 380px">
                    <img src="${pageContext.request.contextPath}/bootstrap/img/2.png"
                         style="width: 100%;height: 100%;margin: auto">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>

        </div>

    </div>
</div>
<div style="height: 210px"></div>
<div class="panel panel-footer" id="footer" align="center">
    @百和软件 Liuyf@126.com
</div>
</body>
</html>
