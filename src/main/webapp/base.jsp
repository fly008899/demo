<%@  page pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
    /**
     *获取当前时间
     *format=1精确到天
     *format=2精确到分
     */
    function getCurrentDate(format) {
        var now = new Date();
        var year = now.getFullYear(); //得到年份
        var month = now.getMonth();//得到月份
        var date = now.getDate();//得到日期
        var day = now.getDay();//得到周几
        var hour = now.getHours();//得到小时
        var minu = now.getMinutes();//得到分钟
        var sec = now.getSeconds();//得到秒
        month = month + 1;
        if (month < 10) month = "0" + month;
        if (date < 10) date = "0" + date;
        if (hour < 10) hour = "0" + hour;
        if (minu < 10) minu = "0" + minu;
        if (sec < 10) sec = "0" + sec;
        var time = "";
        //精确到天
        if (format == 1) {
            time = year + "-" + month + "-" + date;
        }
        //精确到分
        else if (format == 2) {
            time = year + "-" + month + "-" + date + " " + hour + ":" + minu + ":" + sec;
        }
        return time;
    };

    //js实现动态展示时间
    function run() {
        var time = new Date();//获取系统当前时间
        var year = time.getFullYear();
        var month = time.getMonth() + 1;
        var date = time.getDate();//系统时间月份中的日
        var day = time.getDay();//系统时间中的星期值
        var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
        var week = weeks[day];//显示为星期几
        var hour = time.getHours();
        var minutes = time.getMinutes();
        var seconds = time.getSeconds();
        console.log(seconds);
        if (month < 10) {
            month = "0" + month;
        }
        if (date < 10) {
            date = "0" + date;
        }
        if (hour < 10) {
            hour = "0" + hour;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        //var newDate = year+"年"+month+"月"+date+"日"+week+hour+":"+minutes+":"+seconds;
        document.getElementById("showtime").innerHTML = year + "年" + month + "月" + date + "日 " + week +" "+ hour + ":" + minutes + ":" + seconds;
        setTimeout('run()', 1000);
    };

    //自动刷新时间
    window.onload = function () {
        run();
    };

    var Cookies = {};

    /**
     * 设置baiCookies
     */
    Cookies.set = function (name, value) {
        var argv = arguments;
        var argc = arguments.length;
        var expires = (argc > 2) ? argv[2] : null;
        var path = (argc > 3) ? argv[3] : '/';
        var domain = (argc > 4) ? argv[4] : null;
        var secure = (argc > 5) ? argv[5] : false;
        document.cookie = name + "=" + escape(value) +
            ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
            ((path == null) ? "" : ("; path=" + path)) +
            ((domain == null) ? "" : ("; domain=" + domain)) +
            ((secure == true) ? "; secure" : "");
    };

    /**
     * 读取Cookies
     */
    Cookies.get = function (name) {
        var arg = name + "=";
        var alen = arg.length;
        var clen = document.cookie.length;
        var i = 0;
        var j = 0;
        while (i < clen) {
            j = i + alen;
            if (document.cookie.substring(i, j) == arg)
                return Cookies.getCookieVal(j);
            i = document.cookie.indexOf(" ", i) + 1;
            if (i == 0)
                break;
        }
        return null;
    };

    /**
     * 清除Cookies
     */
    Cookies.clear = function (name) {
        if (Cookies.get(name)) {
            var expdate = new Date();
            expdate.setTime(expdate.getTime() - (86400 * 1000 * 1));
            Cookies.set(name, "", expdate);
        }
    };
    Cookies.getCookieVal = function (offset) {
        var endstr = document.cookie.indexOf(";", offset);
        if (endstr == -1) {
            endstr = document.cookie.length;
        }
        return unescape(document.cookie.substring(offset, endstr));
    };
    //设置cookie值
    //Cookies.set("username","张三");
    //读取Cookies
    //Cookies.get("username");



</script>