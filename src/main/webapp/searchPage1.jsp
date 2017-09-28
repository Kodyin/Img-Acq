<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="text/html; charset=utf-8" http-equiv="content-type"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>内容</title>
    <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.css">
    <!--<link rel="stylesheet" href="css/search.css">-->
    <link rel="stylesheet" href="css/bootstrap-table.css">

</head>
<body style="overflow: hidden; background: url(images/查询内容背景.png) no-repeat;width:100%;">
<div style="margin-left: 60px; margin-top: 80px;width: 1000px;">
    <%--表单域--%>
    <div class="form-inline" id="from3">

        <div class="form-group">
            <label for="办理人姓名" class="control-label">办理人姓名</label>
            <input type="text" class="form-control" id="办理人姓名" name="办理人"
                   placeholder="办理人姓名">
        </div>
        <div class="form-group">
            <label for="办理人身份证号" class="control-label">办理人身份证号</label>
            <input type="text" class="form-control" id="办理人身份证号" name="办理人身份证号"
                   placeholder="办理人身份证号">
        </div>
        <div class="form-group">
            <label for="办理人联系方式" class="control-label">办理人联系方式</label>
            <input type="text" class="form-control" id="办理人联系方式" name="办理人联系方式"
                   placeholder="办理人联系方式">
        </div>
        <div class="form-group">
            <label for="材料人姓名" class="control-label">材料人姓名</label>
            <input type="text" class="form-control" id="材料人姓名" name="材料人"
                   placeholder="材料人姓名">
        </div>
        <div class="form-group">
            <label for="材料人身份证号" class="control-label">材料人身份证号</label>
            <input type="text" class="form-control" id="材料人身份证号" name="材料人身份证号"
                   placeholder="材料人身份证号"></div>
        <div class="form-group">
            <label for="材料人联系方式" class="control-label">材料人联系方式</label>
            <input type="text" class="form-control" id="材料人联系方式" name="材料人联系方式"
                   placeholder="材料人联系方式"></div>
        <div class="form-group">
            <label for="业务类型" class="control-label">业务类型</label>
            <select class="form-control" id="业务类型" name="业务类型" style="margin-left: 14px">
                <option></option>
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
            </select>
        </div>
        <div class="form-group">
            <label for="开始时间" class="control-label">开始时间</label>
            <input type="text" class="Wdate" id="开始时间" name="开始时间" placeholder="开始时间"
                   onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'1995-00-00 00:00:00',maxDate:'2999-00-00 00:00:00'})"
                   value="2017-08-07 00:00:00"/>
        </div>
        <div class="form-group">
            <label for="结束时间" class="control-label">结束时间</label>
            <input type="text" class="Wdate" id="结束时间" name="结束时间" placeholder="结束时间"
                   onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'1995-00-00 00:00:00',maxDate:'2999-00-00 00:00:00'})"
                   value="2217-01-01 00:00:00"/>
        </div>
        <button class="btn-primary" type="button" id="submit" onclick="initTable()" style="margin-left: 80px;">
            查询
        </button>
    </div>
    <%--表格域--%>
    <div id="searchTable">
        <table id="searchResult" class="table table-condensed">
            <tbody>

            </tbody>
        </table>
    </div>
</div>
<%--引用JS--%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap-table.js"></script>
<%--bootstraptable中文支持--%>
<script type="text/javascript" src="bootstrap-3.3.7/js/1.js"></script>
<%--bootstraptable导出支持--%>
<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap-table-export.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7/js/tableExport.js"></script>
<%--表格生成函数--%>
<script type="text/javascript">
    function initTable() {
        var personName = $("#办理人姓名").val();
        var personID = $("#办理人身份证号").val();
        var personPhone = $("#办理人联系方式").val();
        var metName = $("#材料人姓名").val();
        var metID = $("#材料人身份证号").val();
        var metPhone = $("#材料人联系方式").val();
        var type = $("#业务类型").val();
        var startTime = $("#开始时间").val();
        var endTime = $("#结束时间").val();
        $('#searchResult').bootstrapTable('destroy');
        $('#searchResult').bootstrapTable({
            dataField: "data",
            cache: false,
            method: 'get',
            contentType: "application/x-www-form-urlencoded",
            // url: "test.json",
            url: '/Task/GetFindList.do',
            dataType: "json",
            height: 450,
            striped: false, //是否显示行间隔色
            pagination: true,//是否分页
            sortOrder: "asc",
            queryParams: function queryParams(params) {   //设置查询参数
                var param = {
                    pageNumber: params.pageNumber,
                    pageSize: params.pageSize,
                    sortOrder: params.sortOrder,
                    办理人: personName,
                    办理人身份证号: personID,
                    办理人联系方式: personPhone,
                    材料人: metName,
                    材料人身份证号: metID,
                    材料人联系方式: metPhone,
                    业务类型: type,
                    startTime: startTime,
                    endTime: endTime
                };
                return param;
            },
            queryParamsType: '',//查询参数组织方式
            sidePagination: 'server',//默认是客户端分页
            pageNumber: 1, //初始化加载第一页，默认第一页
            pageSize: 5,//单页记录数
            pageList: [5],//分页步进值
            //showRefresh:true,//刷新按钮
            showColumns: true,
            clickToSelect: true,//是否启用点击选中行
            buttonsAlign: 'right',//按钮对齐方式
            exportDataType: 'all',
            showExport: true,
            columns: [{
                field: '业务类型',
                title: '业务类型',
                align: 'center'
            }, {
                field: '办理人',
                title: '办理人',
                align: 'center'
            }, {
                field: '办理人身份证号',
                title: '办理人身份证号',
                align: 'center'
            }, {
                field: '办理人联系方式',
                title: '办理人联系方式',
                align: 'center'
            }, {
                field: '材料人',
                title: '材料人',
                align: 'center'
            }, {
                field: '材料人身份证号',
                title: '材料人身份证号',
                align: 'center'
            }, {
                field: '材料人联系方式',
                title: '材料人联系方式',
                align: 'center'
            }, {
                field: '时间',
                title: '时间',
                align: 'center'
            }, {
                field: '头像图',
                title: '头像图',
                align: 'center',
                formatter: function (value, row, index) {
//                    return '<a  href='+value+' >头像图</a>';
                    if (value.length === 33)
                        return '未上传头像';
                    else
                        return '<a href="' + value + '" target="view_window">' +
                            '<img src=' + value + ' style="height:100px;width:100px;" id="pic">' +
                            '</a>';
                }
            }, {
                field: '材料图',
                title: '材料图',
                align: 'center',
                formatter: function (value, row, index) {
                    if (value.length === 33)
                        return '未上传材料';
                    else
                        return '<a  href=' + value + ' target="view_window">点击下载材料图</a>';
                }
            },
                {
                    field: '业务序号',
                    title: '业务序号',
                    align: 'center'
                }, {
                    field: '机器编号',
                    title: '机器编号',
                    align: 'center'
                }, {
                    field: '办理地址',
                    title: '办理地址',
                    align: 'center'
                }],
            locale: 'zh-CN'
        });
    }
</script>
<%--时间选择组件--%>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script>
    var start = {
        elem: '#start',
        format: 'YYYY/MM/DD hh:mm:ss',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16 23:59:59', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#end',
        format: 'YYYY/MM/DD hh:mm:ss',
        min: laydate.now(),
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
</script>
</body>
</html>