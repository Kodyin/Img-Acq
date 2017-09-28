<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>内容</title>
    <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
</head>
<body onload="CmCaptureOcx.Initial();AddDeviceBack();"
      style="overflow: hidden; background: url(images/材料录入背景.png) no-repeat;width:100%;">
<%--摄像头域--%>
<div>
    <div style="width: 700px;height: 400px;margin-left: 220px;margin-top: 130px;">
        <OBJECT id="CmCaptureOcx" style="MARGIN-LEFT:5px; WIDTH: 70%; HEIGHT:100%"
                classid="clsid:3CA842C5-9B56-4329-A7CA-35CA77C7128D">
        </OBJECT>
        <OBJECT id="UniscanThumbnailAssistant" style="MARGIN-LEFT:5px; WIDTH: 25%; HEIGHT:100%"
                classid="clsid:584A82DF-04A0-4490-9D8F-5D7CF4B21599">
        </OBJECT>
    </div>
</div>
<%--按钮--%>
<%--SetFileTypeForMat();SetResolutionForMat();--%>
<div>
    <input type="image" src="images/拍照按钮.png" onClick="SeriesCapture();" name="SeriesCapture1" style="margin-top: 15px; margin-left: 395px">
    <a onclick="UploadSeriesCapture()" href="confirmPage.jsp" target="rightFrame" id="toConfirm" style="margin-left: 240px;">
        <img src="images/下一步按钮.png" id="next2" style="border-bottom-width: 10px;margin-bottom: 35px;">
    </a>
</div>
<%--隐藏表单--%>
<select hidden name="DeviceName" id = "DeviceName" onchange= "ChangeDevice()">
    <option value="0"></option>
    <option value="1" selected="selected"></option>
</select>
<select hidden name="Resolution" id="Resolution" onchange="SetResolutionForMat()">
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
<select hidden name="FileType" id = "FileType" onchange="SetFileTypeForMat()">
    <option value="0">bmp</option>
    <option value="1" selected="selected">jpg</option>
    <option value="2">tif</option>
    <option value="3">png</option>
</select>

<!--引用JS-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>

<!--OcxJs-->
<script type="text/javascript" src="js/OcxJs.js"></script>
<%--开启摄像头--%>
<SCRIPT>
    setTimeout("StartVideoBack()", 5);
    window.onbeforeunload = Close; //关闭前的事件
</SCRIPT>
<%--上传连拍数据--%>
<SCRIPT>
    function UploadSeriesCapture() {
        var pdfFileName = "d:\\test\\testpdf.pdf";
        CmCaptureOcx.Convert2PDF(pdfFileName, 0);
        var myDate = new Date();
        var currentDate = myDate.getFullYear()+(myDate.getMonth()+1)+myDate.getDate()+"_"+myDate.getHours()+myDate.getMinutes()+myDate.getSeconds()+myDate.getMilliseconds();
        var Url = "http://127.0.0.1:8080/Task/UploadPdf.do?matFilename="+currentDate;
        CmCaptureOcx.UpdataFile(Url,"D:\\test\\testpdf.pdf",1);
        var username = "${param.id1}";
        document.getElementById("toConfirm").href='confirmPage.jsp?id1='+username+'&id2='+currentDate;
    }
</SCRIPT>
<SCRIPT type="text/javascript" for="CmCaptureOcx" event="GetImageFileName(fileName);">
    CmCaptureOcx.AddPDFImageFile(fileName);
</SCRIPT>
<SCRIPT type="text/javascript" for="CmCaptureOcx" event="GetRButtonDownPoint(x,y);">
    alert(x);
</SCRIPT>

</body>
</html>