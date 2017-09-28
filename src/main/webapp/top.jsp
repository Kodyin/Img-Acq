<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="text/html; charset=utf-8" http-equiv="content-type"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Top</title>
    <style>
        body {
            background-color: #3840B7;
            margin: 0;
        }
        .banner {
            position: fixed;
            left: 0;
            display: block;
            overflow: hidden;
            background: url(images/logo.jpg) no-repeat center;
            /*background-size: 100% 100%;*/
            width: 100%;
            height: 121px;
            margin: 0 0 0 0px;
            padding: 0px 0px 0px 0px;
        }

        #nowDateTimeSpan {
            vertical-align: middle;
            font-size: 22px;
            color: white;
            position: absolute;
            top: 45px;
            right: 25%;
        }
    </style>
</head>

<body onload="startTime()">
<div class="banner">
    <span id="nowDateTimeSpan"></span>
</div>
<%--获取时间函数--%>
<script type="text/javascript">
    function startTime() {
        var today = new Date();//定义日期对象
        var yyyy = today.getFullYear();//通过日期对象的getFullYear()方法返回年
        var MM = today.getMonth() + 1;//通过日期对象的getMonth()方法返回年
        var dd = today.getDate();//通过日期对象的getDate()方法返回年
        var hh = today.getHours();//通过日期对象的getHours方法返回小时
        var mm = today.getMinutes();//通过日期对象的getMinutes方法返回分钟
        var ss = today.getSeconds();//通过日期对象的getSeconds方法返回秒
// 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
        MM = checkTime(MM);
        dd = checkTime(dd);
        mm = checkTime(mm);
        ss = checkTime(ss);
        var day; //用于保存星期（getDay()方法得到星期编号）
        if (today.getDay() == 0) day = "星期日 "
        if (today.getDay() == 1) day = "星期一 "
        if (today.getDay() == 2) day = "星期二 "
        if (today.getDay() == 3) day = "星期三 "
        if (today.getDay() == 4) day = "星期四 "
        if (today.getDay() == 5) day = "星期五 "
        if (today.getDay() == 6) day = "星期六 "
        document.getElementById('nowDateTimeSpan').innerHTML = hh + ":" + mm + ":" + ss + "&nbsp;&nbsp;&nbsp;&nbsp;" + yyyy + "-" + MM + "-" + dd + "&nbsp;&nbsp;&nbsp;" + day;
        setTimeout('startTime()', 1000);//每一秒中重新加载startTime()方法
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
</script>
</body>
</html>