var nFileCount = 0;
var bAdjustMode = 0;
var bCropArea = 0;
var bSeriesCapture = 0;
var bReadBarCode = 0;
var bSetDenoise = 0;
var Width = 0;
var Height = 0;
var strFile;
var index = 0;
var strCardFile;
var cardIndex = 0;
function Capture() {
    var myDate = new Date();
    strFile = "d:\\test\\Img" + myDate.getFullYear()+(myDate.getMonth()+1)+myDate.getDate()+"_"+myDate.getHours()+myDate.getMinutes()+myDate.getSeconds()+myDate.getMilliseconds() + ".jpg";
    CmCaptureOcx.CaptureImage(strFile);
    UniscanThumbnailAssistant.SetThumbnailImage(strFile);
}
function Adjust() {
    if (bAdjustMode == 0) {
        CmCaptureOcx.AutoCrop(1);
        bAdjustMode = 1;
    }
    else {
        CmCaptureOcx.AutoCrop(0);
        bAdjustMode = 0;
    }
}
function SetCropArea() {
    if (bCropArea == 0) {
        bCropArea = 1;
        CmCaptureOcx.CusCrop(bCropArea);
    }
    else {
        bCropArea = 0;
        CmCaptureOcx.CusCrop(bCropArea);
    }
}
function UpdataFile()
{
    //var Url = document.getElementById("URL").value;
    var Url = "http://127.0.0.1:8080/Task/UploadImage.do?filename="+strFile;
    alert(strFile);
    CmCaptureOcx.UpdataFile(Url,strFile,0);
//    CmCaptureOcx.UpdataFile(Url,"D:\\test\\testpdf.pdf",1);   上传合成的pdf
}
function Preview() {
    CmCaptureOcx.PreviewFile(strFile);
}

function SetResolutionForMat() {
    //var obj = document.getElementById("Resolution");
    //var index = obj.selectedIndex;
    CmCaptureOcx.SetResolution(5);
}

function StartVideoRecord() {
    var path = "d:\\test\\1.wmv";
    CmCaptureOcx.StartVideo(path, 1);
    //var abc = CmCaptureOcx.RotateVideo(1);
    //alert(abc);
}

function SeriesCapture() {
    var path = "d:\\test\\matPic\\";
    CmCaptureOcx.SeriesCapture(1, path);
    //var ka = CmCaptureOcx.DragVideo(0);
}

function ReadBarCode() {
    if (bReadBarCode == 0) {
        bReadBarCode = 1;
        CmCaptureOcx.ReadBarCode(bReadBarCode);
    }
    else {
        bReadBarCode = 0;
        CmCaptureOcx.ReadBarCode(bReadBarCode);
    }
}

function DeleteFile() {
    var temp = CmCaptureOcx.DeleteFile("D:\\test\\123.txt");
    alert(temp);
}

function GetDevSN() {
    var strSN = CmCaptureOcx.GetDevSN(0);
}

function SetDenoise() {
    if (bSetDenoise == 0) {
        bSetDenoise = 1;
        CmCaptureOcx.SetDenoise(bSetDenoise);
    }
    else {
        bSetDenoise = 0;
        CmCaptureOcx.SetDenoise(bSetDenoise);
    }
}

function SetFileTypeForMat() {
    var obj = document.getElementById("FileType");
    var index = obj.selectedIndex;
    CmCaptureOcx.SetFileType(1);
}

function SetImageColorMode() {
    var obj = document.getElementById("ColourMode");
    var index = obj.selectedIndex;
    CmCaptureOcx.SetImageColorMode(index);
}

function StartVideoBack() {
    CmCaptureOcx.Initial();
    CmCaptureOcx.StartRun(2);

    //CmCaptureOcx.StartRunEx(index,2592,1944,0);
    AddResolution2Comb(Reso);
    SetResolution();
    SetFileType();
}

function AddResolution2Comb(f) {
    var i = 0;
    var total = CmCaptureOcx.GetResolutionCount();
    for (i; i < total; i++) {
        var resolution = CmCaptureOcx.GetResolution(i);
        f.Resolution.options[i].text = resolution;
    }
}

function ChangeDevice() {
    var obj = document.getElementById("DeviceName");
    index = obj.selectedIndex;
    CmCaptureOcx.StartRun(index);
    AddResolution2Comb(Reso);
    SetResolution();
}

function SetPicMark() {
    //CmCaptureOcx.SetMarkPic("C:\\1.jpg");

}

function AddDeviceBack() {
    var i = 0;
    var total = CmCaptureOcx.GetDevCount();
    for (i = 0; i < total; i++) {
        var DevEle = CmCaptureOcx.GetDevFriendName(i);
        Reso.DeviceName.options[i].text = DevEle;
    }
}

function Test() {
    strCardFile = "d:\\test\\cardImage" + cardIndex;
    strCardFile += ".jpg";
    CmCaptureOcx.CaptureImage(strCardFile);
    if (cardIndex == 0) {
        cardIndex = 1;
    }
    else {
        CmCaptureOcx.CombineTwoImage("d:\\test\\cardImage.jpg", "d:\\test\\cardImage0.jpg", "d:\\test\\cardImage1.jpg", 1);
        cardIndex = 0;
    }

}

function ConvertToPDF() {
    var pdfFileName = "d:\\test\\testpdf.pdf"
    CmCaptureOcx.Convert2PDF(pdfFileName, 0);
}

function Close() {
    //alert('离开页面');
    CmCaptureOcx.Destory();
}

function isIE() { //ie?
    if (!!window.ActiveXObject || "ActiveXObject" in window)
        return true;
    else
        return false;
}
