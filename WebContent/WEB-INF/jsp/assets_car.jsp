<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://shangwu.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>客户管理-BootCRM</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<link href="<%=basePath%>css/bootstrap-datepicker.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/bootstrap-theme.css" rel="stylesheet">
    <link href="<%=basePath%>css/bootstrap-table.css" rel="stylesheet">
</head>
<body>
   <div id="wrapper">
    <!-- 客户列表查询部分  start-->
	<div >
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">车辆信息</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/assets_carservlet">
					<div class="form-group">
						<label for="assets_carName">资产名称</label> 
						<input type="text" class="form-control" id="assets_carName" 
						                   value="${nameCn}" name="nameCn" />
					</div>
					<div class="form-group">
						<label for="assets_carCode">资产编号</label> 
						<input type="text" class="form-control" id="assets_carCode" 
						                   value="${assetsCode}" name="assetsCode" />
					</div>
					<div class="form-group">
						<label for="assets_carPowerType">发动机类型</label> 
						<select	class="form-control" id="assets_carPowerType" name="powerType">
							<option value="">--全部--</option>
							<c:forEach items="${powerTypes}" var="item">
								<option value="${item.id}"
								       <c:if test="${item.id == powerType}">selected</c:if>>
								    ${item.display }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="assets_carCarModel">品牌型号</label> 
						<input type="text" class="form-control" id="assets_carCarModel" 
						                   value="${carModel}" name="carModel" />
					</div>
					<div class="form-group">
						<label for="autoTrans">自动挡</label> 
						<select	class="form-control" id="assets_carAutoTrans"  name="autoTrans">
							<option value="">--全部--</option>
							<option value="0" <c:if test="${0== autoTrans}">selected</c:if>>手动</option>
							<option value="1" <c:if test="${1== autoTrans}">selected</c:if>>自动</option>
							
						</select>
					</div>
					
					<input type="hidden" name="action" value="list">
					<button type="submit" class="btn btn-primary"> 查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newCustomerDialog" onclick="clearAssets_car()">新增资产</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">车辆信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>资产编号</th>
								<th>资产名称</th>
								<th>车辆品牌</th>
								<th>型号</th>
								<th>发动机编号</th>
								<th>库存记录</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.assetsCode}</td>
									<td>${row.nameCn}</td>
									<td>${row.carBrand}</td>
									<td>${row.carModel}</td>
									<td>${row.engineInfo}</td>
								    <td align="center"><a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#customerrecordDialog" onclick="recordAssets_car('${row.id}')">记录</a></td>
									<td align="center">
									    <a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#customerInputDialog" onclick="inputAssets_car('${row.id}','${row.nameCn}','${row.assetsCode}')">资产入库</a>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editAssets_car('${row.id}')">修改</a>
										
									</td>
								</tr>
							</c:forEach>
                		</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/assets_carservlet" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 客户列表查询部分  end-->
</div>
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建资产信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_assets_car_form">
					<div class="form-group">
						<label for="new_assetsCode" class="col-sm-3 control-label">
						    资产编号
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="new_assetsCode" placeholder="资产编号" name="assetsCode" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_nameCn" class="col-sm-3 control-label">
						    资产名称
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="new_nameCn" placeholder="资产名称" name="nameCn" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_categoryp" class="col-sm-3 control-label"> 资产分类</label> 
						<div class="col-sm-4">
							<select	class="form-control" id="new_categoryp" name="categoryp" onchange="bindCategory()" >
								<option value="">--请选择--</option>
								<c:forEach items="${categoryps}" var="item">
									<option value="${item.id}"<c:if test="${item.id == categoryp}">selected</c:if>>
									${item.nameCn}									
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-5">
							<select	class="form-control" id="new_assetsType" name=assetsType>
								
								
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_powerType" class="col-sm-3 control-label">发动机类型</label> 
						<div class="col-sm-9">
							<div class="col-sm-5">
							<select	class="form-control" id="new_powerType" name="powerType">
							<option value="">--请选择--</option>
							<c:forEach items="${powerTypes}" var="item">
								<option value="${item.id}"
								       <c:if test="${item.id == powerType}">selected</c:if>>
								    ${item.display }
								</option>
							</c:forEach>
						</select>
						</div>
						</div>
					</div>
					<div class="form-group">
						<label for="new_carBrand" class="col-sm-3 control-label">
						    车辆品牌
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="new_carBrand" placeholder="车辆品牌" name="carBrand" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_carModel" class="col-sm-3 control-label">
						    车辆型号
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="new_carModel" placeholder="车辆型号" name="carModel" />
						</div>
					</div>
					<div class="form-group">
					<label for="new_carModel" class="col-sm-3 control-label">
						    座位数
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="new_sitCount" placeholder="座位数" name="sitCount" />
						</div>
						
					</div>
					<div class="form-group">
						<label for="new_engineInfo" class="col-sm-3 control-label">
						   发动机编号
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="new_engineInfo" placeholder="发动机编号" name="engineInfo" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_AutoTrans" class="col-sm-3 control-label">自动挡</label> 
						<div class="col-sm-9">
							<select	class="form-control" id="new_AutoTrans"  name="autoTrans">
							  <option value="">--请选择--</option>
							  <option value="0" <c:if test="${0== autoTrans}">selected</c:if>>手动</option>
							  <option value="1" <c:if test="${1== autoTrans}">selected</c:if>>自动</option>
							
						    </select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_comment" class="col-sm-3 control-label">
						   其他说明
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="new_comment" placeholder=" 其他说明" name="comment" />
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createAssets_car()">保存</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_assets_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_assetsCode" class="col-sm-3 control-label">
						    资产编号
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_assetsCode" placeholder="资产编号" name="assetsCode" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_nameCn" class="col-sm-3 control-label">
						    资产名称
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_nameCn" placeholder="资产名称" name="nameCn" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_categoryp" class="col-sm-3 control-label"> 资产分类</label> 
						<div class="col-sm-4">
							<select	class="form-control" id="edit_categoryp" name="categoryp"  onchange="bindECategory()">
								<option value="">--请选择--</option>
								<c:forEach items="${categoryps}" var="item">
									<option value="${item.id}"<c:if test="${item.id == categoryp}">selected</c:if>>
									${item.nameCn}									
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-5">
							<select	class="form-control" id="edit_assetsType" name="assetsType" >
								<option value="">--请选择--</option>
								
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_powerType" class="col-sm-3 control-label">发动机类型</label> 
						<div class="col-sm-9">
							<select	class="form-control" id="edit_powerType" name="powerType">
							  <option value="">--请选择--</option>
							  <c:forEach items="${powerTypes}" var="item">
								<option value="${item.id}"
								       <c:if test="${item.id == powerType}">selected</c:if>>
								    ${item.display }
								</option>
							  </c:forEach>
						   </select>
					   </div>
					</div>
					<div class="form-group">
						<label for="edit_carBrand" class="col-sm-3 control-label">
						    车辆品牌
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_carBrand" placeholder="车辆品牌" name="carBrand" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_carModel" class="col-sm-3 control-label">
						    车辆型号
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_carModel" placeholder="车辆型号" name="carModel" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_carModel" class="col-sm-3 control-label">
						    座位数
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_sitCount" placeholder="座位数" name="sitCount" />
						</div>
						
					</div>
					<div class="form-group">
						<label for="edit_engineInfo" class="col-sm-3 control-label">
						   发动机编号
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_engineInfo" placeholder="发动机编号" name="engineInfo" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_AutoTrans" class="col-sm-3 control-label">自动挡</label> 
						<div class="col-sm-9">
							<select	class="form-control" id="edit_AutoTrans"  name="autoTrans">
							  <option value="">--请选择--</option>
							  <option value="0" <c:if test="${0== autoTrans}">selected</c:if>>手动</option>
							  <option value="1" <c:if test="${1== autoTrans}">selected</c:if>>自动</option>
							
						    </select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_comment" class="col-sm-3 control-label">
						   其他说明
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_comment" placeholder=" 其他说明" name="comment" />
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateAssets_car()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改资产入库模态框 -->
<div class="modal fade" id="customerInputDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="input_assets_form">
					<input type="hidden" id="input_id" name="assetsId"/>
					<input type="hidden" id="input_batchNo" name="batchNo"/>
					<div class="form-group">
						<label for="input_nameCn" class="col-sm-3 control-label">
						    资产名称
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="input_nameCn" placeholder="资产名称" name="nameCn" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_count" class="col-sm-3 control-label">
						    入库数量
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="input_count" placeholder="入库数量" name="count" />
						</div>
					</div>
					<div class="form-group">
						<label for="input_price" class="col-sm-3 control-label">
						    入库单价
						</label>
						<div class="col-sm-9">
						   <div class="input-group">
			                 <span class="input-group-addon">$</span>
			                 <input type="text" class="form-control" id="input_price" placeholder="入库单价" name="price" />
		                   </div>
							
						</div>
					</div>
					<div class="form-group">
						<label for="input_allprice" class="col-sm-3 control-label">
						   合计金额
						</label>
						<div class="col-sm-9">
						   <div class="input-group">
			                 <span class="input-group-addon">$</span>
			                 <input type="text" class="form-control" id="input_allprice" placeholder="入库单价" name="allprice" />
		                   </div>
							
						</div>
					</div>
					<div class="form-group">
						<label for="input_instockTime" class="col-sm-3 control-label">
						    入库时间
						</label>
						<div class="col-sm-9">
						    <input type="text" class="datepicker" placeholder="请选择日期" id="input_instockTime"  name="instockTime" />
						</div>
					</div>
					<div class="form-group">
						<label for="input_handlerEmp" class="col-sm-3 control-label">资产购置人</label> 
						<div class="col-sm-9">
						   <div class="col-sm-5">
							<select	class="form-control" id="input_handlerEmp" name="handlerEmp">
							  <option value="">--请选择--</option>
							     
						    </select>
						  </div>
					    </div>
				   </div>
					
					<div class="form-group">
						<label for="edit_comment" class="col-sm-3 control-label">
						   备注说明
						</label>
						<div class="col-sm-9">
						    <textarea class="form-control" rows="3" id="edit_comment" placeholder="备注说明" name="comment"></textarea>
							
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createAssetInput()">入库</button>
			</div>
		</div>
	</div>
</div>
<!-- 入库记录模态框 -->
<div class="modal fade" id="customerrecordDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">资产流转信息</h4>
			</div>
			<div class="modal-body">
				<div class="col-lg-12">
							 <table id="bootstrap-table"></table>
				
				</div>
					
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>



    <script type="text/javascript" src="<%=basePath%>js/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-table-zh-CN.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
$(function () {
    $(".datepicker").datepicker({
        language: "zh-CN",
        autoclose: true,//选中之后自动隐藏日期选择框
        clearBtn: true,//清除按钮
        todayBtn: true,//今日按钮
        format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
    });
});
//清空新建客户窗口中的数据
	function clearAssets_car() {
	    $("#new_assetsCode").val("");
	    $("#new_nameCn").val("")
	    $("#new_categoryp").val("")
	    $("#new_powerType").val("");
	    $("#new_carBrand").val("")
	    $("#new_carModel").val("");
	    $("#new_sitCount").val("");
	    $("#new_engineInfo").val("");
	    $("#new_AutoTrans").val("");
	    $("#new_comment").val("");
	}
	// 创建客户
	function createAssets_car() {
		
	if($("#new_assetsCode").val()=="")
	{
		alert("资产编号不能为空");
		return;
	}
	if($("#new_nameCn").val()=="")
	{
		alert("资产名称不能为空");
		return;
	}
	if($("#new_categoryp").val()=="")
	{
		alert("资产类型不能为空");
		return;
	}
	
	if($("#new_powerType").val()=="")
	{
		alert("发动机类型不能为空");
		return;
	}
	if($("#new_carBrand").val()=="")
	{
		alert("车辆品牌不能为空");
		return;
	}
	if($("#new_carModel").val()=="")
	{
		alert("车辆型号不能为空");
		return;
	}
	if($("#new_sitCount").val()=="")
	{
		alert("车辆座位不能为空");
		return;
	}
	var ival=parseInt($("#new_sitCount").val());
	if(isNaN(ival))
	{
		alert("车辆座位必须是数字");
		return;
	}
	if($("#new_engineInfo").val()=="")
	{
		alert("车辆座位不能为空");
		return;
	}
	
	if($("#new_AutoTrans").val()=="")
	{
		alert("自动挡不能为空");
		return;
	}
	$.post("<%=basePath%>assets_carservlet?action=create",
	$("#new_assets_car_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("资产创建成功！");
	            window.location.reload();
	        }else{
	            alert("资产创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的资产信息
	function editAssets_car(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>assets_carservlet?action=getAssets_carById",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id);
	            $("#edit_assetsCode").val(data.assetsCode);
	            $("#edit_nameCn").val(data.nameCn);
	            $("#edit_assetsType").val(data.assetsType)
	            $("#edit_powerType").val(data.powerType)
	            $("#edit_carBrand").val(data.carBrand)
	            $("#edit_carModel").val(data.carModel);
	            $("#edit_sitCount").val(data.sitCount);
	            $("#edit_engineInfo").val(data.engineInfo);
	            $("#edit_AutoTrans").val(data.autoTrans);
	            $("#edit_comment").val(data.comment);
	            
	        }
	    });
	}
	// 执行修改客户操作
	function updateAssets_car() {
		if($("#edit_assetsCode").val()=="")
		{
			alert("资产编号不能为空");
			return;
		}
		if($("#edit_nameCn").val()=="")
		{
			alert("资产名称不能为空");
			return;
		}
		
		if($("#edit_powerType").val()=="")
		{
			alert("发动机类型不能为空");
			return;
		}
		if($("#edit_carBrand").val()=="")
		{
			alert("车辆品牌不能为空");
			return;
		}
		if($("#edit_carModel").val()=="")
		{
			alert("车辆型号不能为空");
			return;
		}
		if($("#edit_sitCount").val()=="")
		{
			alert("车辆座位不能为空");
			return;
		}
		if($("#edit_sitCount").val()=="")
		{
			alert("车辆座位不能为空");
			return;
		}
		var ival=parseInt($("#edit_sitCount").val());
		if(isNaN(ival))
		{
			alert("车辆座位必须是数字");
			return;
		}
		if($("#edit_engineInfo").val()=="")
		{
			alert("发动机编号不能为空");
			return;
		}
		if($("#edit_AutoTrans").val()=="")
		{
			alert("自动挡不能为空");
			return;
		}
		$.post("<%=basePath%>assets_carservlet?action=update",$("#edit_assets_form").serialize(),function(data){
			if(data =="OK"){
				alert("资产信息更新成功！");
				window.location.reload();
			}else{
				alert("资产信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 通过id获取修改的资产信息
	function bindCategory() {
		//绑定之前清空第一个以外的option
       
        var id=$("#new_categoryp").find("option:selected").val();
	
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>categoryservlet?action=all",
	        data:{"id":id},
	        success:function(data) {
	        	
	        	$("#new_assetsType").children().remove();
	        
	            $("<option>--请选择--</option>").appendTo("#new_assetsType");
	            $.each(data,function(i){
	               $("<option value="+data[i].id+">"+data[i].nameCn+"</option>").appendTo("#new_assetsType");
	            });
	            
	        }
	    });
	}
	// 通过id获取修改的资产信息
	function bindECategory() {
		//绑定之前清空第一个以外的option
       
        var id=$("#edit_categoryp").find("option:selected").val();
	
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>categoryservlet?action=all",
	        data:{"id":id},
	        success:function(data) {
	        	
	        	$("#edit_assetsType").children().remove();
	        
	            $("<option>--请选择--</option>").appendTo("#edit_assetsType");
	            $.each(data,function(i){
	               $("<option value="+data[i].id+">"+data[i].nameCn+"</option>").appendTo("#edit_assetsType");
	            });
	            
	        }
	    });
	}
	function inputAssets_car(id,nameCn,assetsCode)
	{
		
		$("#input_id").val(id);
		$("#input_nameCn").val(nameCn);
		$("#input_batchNo").val(assetsCode);
		 $.ajax({
		        type:"get",
		        url:"<%=basePath%>employeeservlet?action=all",
		        success:function(data) {
		        	
		        	$("#input_handlerEmp").children().remove();
		        
		            $("<option>--请选择--</option>").appendTo("#input_handlerEmp");
		            $.each(data,function(i){
		               $("<option value="+data[i].id+">"+data[i].namecn+"</option>").appendTo("#input_handlerEmp");
		            });
		            
		        }
		    });
	}
	// 入库
	function createAssetInput() {
		
	
	if($("#input_nameCn").val()=="")
	{
		alert("资产名称不能为空");
		return;
	}
	if($("#input_count").val()=="")
	{
		alert("资产数量不能为空");
		return;
	}
	var ival=parseInt($("#input_count").val());
	if(isNaN(ival))
	{
		alert("资产数量必须是数字");
		return;
	}
	if($("#input_price").val()=="")
	{
		alert("价格不能为空");
		return;
	}
	var reg=/^[0-9,.]*$/ //^[-\+]?d+(\.\d+)?$/;
	var ival=$("#input_price").val();
	if(!reg.test(ival))
	{
		alert("价格必须是数字");
		
		return;
	}
	if($("#input_instockTime").val()=="")
	{
		alert("入库日期不能为空");
		return;
	}
	
	if($("#input_handlerEmp").val()=="")
	{
		alert("资产购置人不能为空");
		return;
	}
	
	$.post("<%=basePath%>assetstransServlet?action=input&transType=2",
	$("#input_assets_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("入库成功！");
	            window.location.reload();
	        }else{
	            alert("入库失败！");
	            window.location.reload();
	        }
	    });
	}
	function recordAssets_car(id)
	{
		
		$("#bootstrap-table").bootstrapTable('destroy');
		$("#bootstrap-table").bootstrapTable({
            url:'assetstransServlet?action=record&assetsId='+id,  //设置向服务器发出的请求
            contentType : "application/x-www-form-urlencoded",
            method : 'POST', //请求方式（*）
            dataType:'json', //数据是json格式
            pagination:true,//分页
            paginationPreText:'上一页',
            paginationNextText:'下一页',
            striped:true,//条纹
            height:280,  //设置表格高度
            sidePagination:'server',//server:服务器端分页|client：前端分页
        	pageSize:5,//单页记录数
        	pageList:[ 5, 10, 20, 30 ],//可选择单页记录数
            toolbar:"#toolbar",
            responseHandler:responseHandler,//接受后台传过来的值进行绑定处理的函数
            columns:[
                {
                    title:"流转类型",
                    field:"transType",
                    align:'center',
                    valign:"middle"
                },{
                    title:"数量",
                    field:"count",
                    align:'center',
                    valign:"middle"
                }
                ,{
                    title:"单价",
                    field:"price",
                    align:'center',
                    valign:"middle"
                }
                ,{
                    title:"处理人",
                    field:"handlerEmp",
                    align:'center',
                    valign:"middle"
                }
                ,{
                    title:"接收人",
                    field:"targetEmp",
                    align:'center',
                    valign:"middle"
                },{
                	title:"备注",
                    field:"comment",
                    align:'center',
                    valign:"middle"
                }
                ,{
                    title:"入库日期",
                    field:"instockTime",
                    align:'center',
                    valign:"middle"
                },{
                	title:"创建日期",
                    field:"createTime",
                    align:'center',
                    valign:"middle"
                }
            ]
        });
    

    }
	
	//返回数据的处理
    function responseHandler(res){
        return{
            'total' : res.total,
            "rows" : res.data,
            "offset" : res.offset,
            "limit" : res.limit
        }
    }
</script>	
</body>
</html>