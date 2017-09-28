<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>left</title>

    <!--<link rel="stylesheet" href="css/left.css" type="text/css">-->
    <!--<link rel="stylesheet" type="text/css" href="css/default.css" id="skin-switcher">-->
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">


</head>
<body style="overflow: hidden; background: url(images/边栏背景.png) no-repeat;width:100%;">
<!--鼠标事件-->
<section id="page">
    <!-- SIDEBAR -->
    <div id="sidebar" class="">
        <div class="">
            <ul style="
    padding-left: 0;
    width: 236px;
    margin-bottom: 0;
    margin-top: 40px;
    margin-left: 6px;
">
                <li style="list-style-type:none;height: 42px">
                    <a href="personPic.jsp" target="rightFrame">
                        <img id="btn1" name="btn1" src="images/边栏按钮1响应.png" onclick="mouse1Click()">
                    </a>
                </li>
                <li style="list-style-type:none;height: 42px">
                    <a href="searchPage1.jsp" target="rightFrame" class="">
                        <img id="btn2" name="btn2" src="images/边栏按钮2未响应.png" onclick="mouse2Click()" onmouseover="mouse2Over()" onmouseout="mouse2Out()">
                    </a>
                </li>
            </ul>
            <!-- /SIDEBAR MENU -->
        </div>
    </div>
    <!-- /SIDEBAR -->
</section>

<script src="js/jquery.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jQuery-Cookie/jquery.cookie.min.js"></script>
<script src="js/script.js"></script>
<script type="text/javascript">
    var btn1 = document.getElementById('btn1');
    var btn2 = document.getElementById('btn2');
    function mouse2Over() {
        document.btn2.src = "images/边栏按钮2响应.png";
    }
    function mouse1Over() {
        btn1.src = "images/边栏按钮1响应.png";
    }
    function mouse1Out() {
        document.btn1.src = "images/边栏按钮1未响应.png"
    }
    function mouse2Out() {
        document.btn2.src = "images/边栏按钮2未响应.png";
    }
    function mouse1Click() {
        document.btn1.src = "images/边栏按钮1响应.png";
        document.btn2.src = "images/边栏按钮2未响应.png";
        document.btn1.onmouseout = null;
        document.btn2.onmouseout = "mouse2Out()";
        document.btn2.onmouseover = "mouse2Over()";
    }
    function mouse2Click() {
        document.btn2.src = "images/边栏按钮2响应.png";
        document.btn1.src = "images/边栏按钮1未响应.png";
        document.btn2.onmouseout = null;
        document.btn1.onmouseout = "mouse1Out()";
        document.btn1.onmouseover = "mouse1Over()";
    }
    function mouseUp() {
        btn2.src = "images/边栏按钮2响应.png";
    }
</script>
<script>
    $(function () {
        App.setPage("left");  //Set current page
        App.init(); //Initialise plugins and elements
    });
</script>
</body>
</html>