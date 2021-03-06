<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>无标题文档</title>
    <script language="javascript">
        function alertWin(str) {
            var msgw, msgh, bordercolor;
            msgw = 200;//提示窗口的宽度
            msgh = 100;//提示窗口的高度
            titleheight = 25;//提示窗口标题高度
            bordercolor = "#F0F8FF";//提示窗口的边框颜色
            titlecolor = "linear-gradient(#F7BE81, #58FAAC)";//提示窗口的标题颜色

            //根据自己需求注意宽度和高度的调整
            var iWidth = document.documentElement.clientWidth;
            var iHeight = document.documentElement.clientHeight;
            //遮罩层
            var bgObj = document.createElement("div");
            bgObj.remove
            bgObj.setAttribute("id", "bgObj");//设置ID
            bgObj.style.cssText = "position:absolute;left:0px;top:0px;width:" + iWidth + "px;height:" + Math.max(document.body.clientHeight, iHeight) + "px;filter:Alpha(Opacity=30);opacity:0.3;background-color:#000000;z-index:101;";
            document.body.appendChild(bgObj);

            //弹出窗口
            var msgObj = document.createElement("div");
            msgObj.setAttribute("id", "msgDiv");//可以用bgObj.id="msgDiv"的方法，是为div指定属性值
            msgObj.setAttribute("align", "center");//为div的align赋值
            msgObj.style.background = "white";//背景颜色为白色
            msgObj.style.border = "1px solid " + bordercolor;//边框属性，颜色在上面已经赋值
            msgObj.style.position = "absolute";//绝对定位
            msgObj.style.left = (iWidth - msgw) / 2;//从左侧开始位置
            msgObj.style.top = (iHeight - msgh) / 2;//从上部开始位置
            msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";//字体属性
            msgObj.style.width = msgw + "px";//提示框的宽(上面定义过)
            msgObj.style.height = msgh + "px";//提示框的高(上面定义过)
            msgObj.style.textAlign = "center";//文本位置属性，居中。
            msgObj.style.lineHeight = "25px";//行间距
            msgObj.style.zIndex = "102";//层的z轴位置
            document.body.appendChild(msgObj);

            //弹出窗口标题
            var title = document.createElement("div");//创建一个标题对象
            title.setAttribute("id", "msgTitle");//为标题对象填加id
            title.style.margin = "0";//浮动
            title.style.padding = "3px";//浮动
            title.style.background = titlecolor;//背景颜色
            title.style.filter = "progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
            title.style.opacity = "0.75";//透明
            title.style.border="1px solid " + bordercolor;//边框
            title.style.height = "25px";//高度
            title.style.font = "12px Verdana, Geneva, Arial, Helvetica, sans-serif";//字体属性
            //title.style.color = "red";//文字颜色
            title.style.cursor = "move";//鼠标样式
            title.innerHTML = "<table border='0' width='100%'><tr><td align='left'>提示</td><td align=\"right\"><a href='#' onclick='closeDiv()'>x</a></td></tr></table>";

            //设置窗口可移动
            var moveX = 0;
            var moveY = 0;
            var moveTop = 0;
            var moveLeft = 0;
            var moveable = false;
            var docMouseMoveEvent = document.onmousemove;
            var docMouseUpEvent = document.onmouseup;
            title.onmousedown = function () {
                var evt = getEvent();
                moveable = true;
                moveX = evt.clientX;
                moveY = evt.clientY;
                moveTop = parseInt(msgObj.style.top);
                moveLeft = parseInt(msgObj.style.left);
                document.onmousemove = function () {
                    if (moveable) {
                        var evt = getEvent();
                        var x = moveLeft + evt.clientX - moveX;
                        var y = moveTop + evt.clientY - moveY;
                        if (x > 0 && (x + msgw < iWidth) && y > 0 && (y + msgh < iHeight)) {
                            msgObj.style.left = x + "px";
                            msgObj.style.top = y + "px";
                        }
                    }
                };
                document.onmouseup = function () {
                    if (moveable) {
                        document.onmousemove = docMouseMoveEvent;
                        document.onmouseup = docMouseUpEvent;
                        moveable = false;
                        moveX = 0;
                        moveY = 0;
                        moveTop = 0;
                        moveLeft = 0;
                    }
                };
            }

            //获得事件Event对象，用于兼容IE和FireFox
            function getEvent() {
                return window.event || arguments.callee.caller.arguments[0];
            }

            msgObj.appendChild(title);//在提示框中增加标题
            var txt = document.createElement("p");
            txt.style.margin = "1em 0";//文本浮动
            txt.setAttribute("id", "msgTxt");//为p属性增加id属性
            txt.innerHTML = str;//把传进来的值赋给p属性
            msgObj.appendChild(txt);//把p属性增加到提示框里
        }

        //添加关闭功能
        function closeDiv() {
            var msgTitelObject = document.getElementById("msgDiv");
            document.body.removeChild(msgTitelObject);
            var bgObj = document.getElementById("bgObj");
            document.body.removeChild(bgObj);

        }

    </script>
</head>
<body>
</body>
</html>