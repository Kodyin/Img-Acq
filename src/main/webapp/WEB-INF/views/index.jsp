<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>电子档案</title>
    <link rel="stylesheet" href="../../bootstrap-3.3.7/css/bootstrap.min.css">
    <!--<link rel="icon" href="img/house.png" type="image/x-icon" />-->
</head>
<frameset rows="121,*" cols="*" frameborder="no" border="0" framespacing="0" name="indexFrame">
    <frame src="../../top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame"/>
    <frameset cols="256,*" frameborder="no" border="0" framespacing="0">
        <frame src="../../left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame"/>
        <frame src="../../personPic.jsp" name="rightFrame" id="rightFrame" title="rightFrame" frameborder="no"/>
    </frameset>
</frameset>
<script type=text/javascript src=../../js/jquery.js></script>
<script src=../../js/script.js></script>
</html>