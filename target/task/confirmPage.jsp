<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="text/html; charset=utf-8" http-equiv="content-type"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>内容</title>
    <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">
    <!--<link rel="stylesheet" href="css/search.css">-->

</head>
<body style="overflow: hidden; background: url(images/确认内容背景.png) no-repeat;width:100%;">
<div style="margin-top: 130px;margin-left: 240px;">
    <input class="btn btn-lg" type="button" value="点击录入办理人信息" style="color: white;background-color:#3779DA;">
    <input class="btn btn-lg" type="button" value="点击录入材料人信息"
           style="color: white;background-color:#3779DA; margin-left: 250px">
</div>
<br/>
<form class="form-horizontal" style="margin-left: 90px">
    <div class="row" style="margin-top: 40px">
        <div class="col-md-4">
            <div class="form-group">
                <label for="办理人姓名" class="col-sm-offset-0 col-sm-5 control-label">办理人姓名</label>
                <div class="col-sm-7 ">
                    <input type="text" class="form-control" id="办理人姓名" name="办理人"
                           placeholder="办理人姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="办理人身份证号" class="col-sm-offset-0  col-sm-5 control-label">办理人身份证号</label>
                <div class="col-sm-7 ">
                    <input type="text" class="form-control" id="办理人身份证号" name="办理人身份证号"
                           placeholder="办理人身份证号">
                </div>
            </div>
            <div class="form-group">
                <label for="办理人联系方式" class="col-sm-offset-0  col-sm-5 control-label">办理人联系方式</label>
                <div class="col-sm-7 ">
                    <input type="text" class="form-control" id="办理人联系方式" name="办理人联系方式"
                           placeholder="办理人联系方式">
                </div>
            </div>
        </div>
        <div class="col-md-4" style="margin-left: 70px">
            <div class="form-group">
                <label for="材料人姓名" class="col-sm-5 control-label">材料人姓名</label>
                <div class="col-sm-7 ">
                    <input type="text" class="form-control" id="材料人姓名" name="材料人姓名"
                           placeholder="材料人姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="材料人身份证号" class="col-sm-5  control-label">材料人身份证号</label>
                <div class="col-sm-7 ">
                    <input type="text" class="form-control" id="材料人身份证号" name="材料人身份证号"
                           placeholder="材料人身份证号">
                </div>
            </div>
            <div class="form-group">
                <label for="材料人联系方式" class="col-sm-offset-0  col-sm-5 control-label">材料人联系方式</label>
                <div class="col-sm-7 ">
                    <input type="text" class="form-control" id="材料人联系方式" name="材料人联系方式"
                           placeholder="材料人联系方式">
                </div>
            </div>
        </div>
    </div>
    <br/>
    <br/>
    <div class="form-group" style="margin-left: 80px">
        <label for="业务类型" class="col-sm-3 control-label">业务类型</label>

        <div class=" col-sm-3">
            <select class="form-control" id="业务类型" name="业务类型" onchange="chg()">
                <option>市内户口迁移</option>
                <option>市外户口迁移</option>
                <option>变更更正业务</option>
                <option>身份证：首次办理</option>
                <option>身份证：期满换证</option>
                <option>身份证：丢失补领</option>
                <option>身份证：其他原因换锁</option>
                <option>境外人员登记</option>
                <option>居住证擦写</option>
                <option>户口档案查询</option>
                <option>各类证明</option>
                <option value = -1>[自定义业务类型]</option>
            </select>
            <br>
            <div class="form-group">
                <div class="col-sm-12">
                    <input type="text" id="select_else" class="form-control" name="select_else" style="display:none" placeholder="请输入业务类型">
                </div>
            </div>

        </div>

    </div>
    <br/>
    <br/>
    <button type="button" onclick="uploadRecord()" class="btn btn-lg btn-primary col-sm-2"
            style="color: white; margin-left: 350px">确认上传
    </button>
    <input hidden type="text" id="confirmPersonFileName" name="confirmPersonFileName" value="${param.id1}">
    <input hidden type="text" id="confirmMatFileName" name="confirmMatFileName" value="${param.id2}">
</form>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>

<!--验证及传输数据-->
<script type="text/javascript">

    var myReg = /^[\u4e00-\u9fa5]+$/;//中文
    var empReg = /\S/;//空
    var IDReg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;//身份证
    var phoReg = /^1\d{10}$/;//手机号
    var addReg = /^(?=.*?[\u4E00-\u9FA5])[\dA-Za-z\u4E00-\u9FA5]+/;//地址
    function check() {

        if ($("#办理人姓名").val() === "" || !empReg.test($("#办理人姓名").val())) {
//            alert("办理人姓名不能为空");
            return true;
        }
        else
            if (!myReg.test($("#办理人姓名").val())) {
            alert("办理人姓名应输入中文");
            return false;
        }
        //身份证
        else if ($("#办理人身份证号").val() === "" || !empReg.test($("#办理人身份证号").val())) {
//            alert("办理人身份证号不能为空");
            return true;
        }
        else if (!IDReg.test($("#办理人身份证号").val())) {
            alert("办理人身份证号不合法");
            return false;
        }

        //手机号
        else if ($("#办理人联系方式").val() === "" || !empReg.test($("#办理人联系方式").val())) {
 //           alert("办理人联系方式不能为空");
            return true;
        }
        else if (!phoReg.test($("#办理人联系方式").val())) {
            alert("办理人联系方式不合法");
            return false;
        }

        if ($("#材料人姓名").val() === "" || !empReg.test($("#材料人姓名").val())) {
   //         alert("材料人姓名不能为空");
            return true;
        }
        else if (!myReg.test($("#材料人姓名").val())) {
            alert("材料人姓名应输入中文");
            return false;
        }

        //身份证
        else if ($("#材料人身份证号").val() === "" || !empReg.test($("#材料人身份证号").val())) {
//            alert("材料人身份证号不能为空");
            return true;
        }
        else if (!IDReg.test($("#材料人身份证号").val())) {
            alert("材料人身份证号不合法");
            return false;
        }

        //手机号
        else if ($("#材料人联系方式").val() === "" || !empReg.test($("#材料人联系方式").val())) {
    //        alert("材料人联系方式不能为空");
            return true;
        }
        else if (!phoReg.test($("#材料人联系方式").val())) {
            alert("材料人联系方式不合法");
            return false;
        }

        else return true;
    }

    function chg() {
        if (document.getElementById("业务类型").value === "-1")
            document.getElementById("select_else").style.display = "";
        else
            document.getElementById("select_else").style.display = "none";
    }

    function uploadRecord() {

            var personName = $("#办理人姓名").val();
            var personID = $("#办理人身份证号").val();
            var personPhone = $("#办理人联系方式").val();
            var metName = $("#材料人姓名").val();
            var metID = $("#材料人身份证号").val();
            var metPhone = $("#材料人联系方式").val();

            if (document.getElementById("select_else").style.display === "")
                var type = $("#select_else").val();
            else
                var type = $("#业务类型").val();

            var headFilename = $("#confirmPersonFileName").val();
            var matFilename = $("#confirmMatFileName").val();
            //执行上传文件操作的函数
             if (check()){
            $.ajax({
                //处理文件上传操作的服务器端地址
                url: '/Task/submitRecord.do',
                method: 'POST',
                enctype: "multipart/form-data",
                secureuri: false,                       //是否启用安全提交,默认为false
                dataType: 'text',
                data: {
                    "办理人": personName, "办理人身份证号": personID, "办理人联系方式": personPhone,
                    "材料人": metName, "材料人身份证号": metID, "材料人联系方式": metPhone,
                    "业务类型": type, "headFilename": headFilename, "matFilename": matFilename
                },
                success: function (result) {
                    alert(result);
                    parent.location.reload();
                },
                error: function (result) {
                    alert(result)
                }
            });
        }
    }

</script>

<script type="text/javascript">
    $(document).ready(function () {
//使用正则表达式获取url中的参数
        function getUrlParam(name) {
//构造一个含有目标参数的正则表达式对象
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
//匹配目标参数
            var r = window.location.search.substr(1).match(reg);
//返回参数值
            if (r != null) return unescape(r[2]);
            return null;
        }

        var urlData = getUrlParam('data');
// 将数据填充到input框里面
        $('#getAllData').val(urlData);
    });
</script>

</body>
</html>