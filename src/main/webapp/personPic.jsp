<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>内容</title>
    <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
    <!--<link rel="stylesheet" href="css/search.css">-->

</head>
<body onload=" CmCaptureOcx.Initial();AddDeviceFront()"
      style="overflow: hidden; background: url(images/头像录入背景.png) no-repeat;width:100%;">
<%--摄像头域--%>
<div>
    <div style="width: 700px;height: 400px;margin-left: 220px;margin-top: 130px;">
        <OBJECT id="CmCaptureOcx" style="MARGIN-LEFT:5px; WIDTH: 65%; HEIGHT:100%"
                classid="clsid:3CA842C5-9B56-4329-A7CA-35CA77C7128D">
        </OBJECT>
        <OBJECT id="UniscanThumbnailAssistant" style="MARGIN-LEFT:5px; WIDTH: 30%; HEIGHT:100%"
                classid="clsid:584A82DF-04A0-4490-9D8F-5D7CF4B21599">
        </OBJECT>
    </div>

</div>
<%--按钮--%>
<div>
    <input type="image" src="images/拍照按钮.png" onClick="CaptureHead();UpdataHeadFile()" name="Capture" style="margin-top: 15px; margin-left: 395px">
    <a onclick="transmission1()" href="matPic.jsp" target="rightFrame" id="toMatPic" style="margin-left: 240px;">
        <img src="images/下一步按钮.png" id="next1" style="border-bottom-width: 10px;margin-bottom: 35px;">
    </a>
</div>

<select hidden name="DeviceName" id = "DeviceName" onchange = "ChangeDevice()">
    <option value="0" selected="selected"></option>
    <option value="1"></option>
</select>
<select hidden name="Resolution" id="Resolution">
    <option value="0">开启视频后获取分辨率</option>
    <option value="1"></option>
    <option value="2"></option>
    <option value="3"></option>
    <option value="4"></option>
    <option value="5"></option>
    <option value="6"></option>
    <option value="7"></option>
    <option value="8"></option>
    <option value="9"></option>
</select>
<%--引用JS--%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<%--Ocx--%>
<script type="text/javascript" src="js/OcxJsForFront.js"></script>
<%--开启摄像头--%>
<SCRIPT>
    setTimeout("StartVideoFront()", 5);
    window.onbeforeunload = Close; //关闭前的事件
</SCRIPT>
<SCRIPT type="text/javascript" for="CmCaptureOcx" event="GetImageFileName(fileName);">
    CmCaptureOcx.AddPDFImageFile(fileName);
</SCRIPT>
<SCRIPT type="text/javascript" for="CmCaptureOcx" event="GetRButtonDownPoint(x,y);">
    alert(x);
</SCRIPT>
<%--上传头像图--%>
<script type="text/javascript">
    function UpdataHeadFile()
    {
        //var Url = document.getElementById("URL").value;
        var myDate = new Date();
        var headDate="Img"+ myDate.getFullYear()+(myDate.getMonth()+1)+myDate.getDate()+"_"+myDate.getHours()+myDate.getMinutes()+myDate.getSeconds()+myDate.getMilliseconds();
        var Url = "http://127.0.0.1:8080/Task/UploadImage.do?headFilename="+headDate;
        CmCaptureOcx.UpdataFile(Url,strFile,1);
        document.getElementById("toMatPic").href='matPic.jsp?id1='+headDate;
//    CmCaptureOcx.UpdataFile(Url,"D:\\test\\testpdf.pdf",1);   上传合成的pdf
    }
</script>

<!--<script type="text/javascript" src="js/search.js"></script>-->
</body>
</html>