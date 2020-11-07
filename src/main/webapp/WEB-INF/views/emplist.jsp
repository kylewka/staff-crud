<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>职员管理系统</title>
<%
	pageContext.setAttribute("Funs_Path", request.getContextPath());
%>
<!-- 引入jquery -->
<script type="text/javascript"
	src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js">
	
</script>
<!-- 引入样式 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
  <style>
        body{
            margin:0; 
            padding:0;
            font-family: Lato,Helvetica,Arial,sans-serif;
                font-size: 14px;
                line-height: 1.72222;
                color: #000;
                background-color: #000;
        }

        .text-black{
        	color: #000;
        }
        .wrap {
                min-width: 100%;
                position: absolute;
                background: #f8f8f8 bottom;
                min-height: 100%;
                overflow: hidden;
            }
        .left{
            margin-left:0px;
                position: absolute;
                box-sizing: border-box;
                width: 200px;
                height: 100%;
                background: #4d5e70;
            }
            .logoDiv{
                padding-top: 20px;
                padding-bottom: 20px;
                height: 70px;
                background-color: #354457;
                font-size: 17px;
                color: #fff;
                vertical-align: bottom;    
            }
            .logoTitle{
                margin-left:15px;
                line-height: 1.7;
            }
            .right{
                box-sizing: border-box;
                float: left;
                box-sizing: border-box;
                padding-left: 200px;
                overflow-y: overlay;
                overflow-x: hidden;
                clear: both;
                color: #717592;
                min-width: 100%;
                min-height: 500px;
            }
    </style>
</head>
<body>
	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<!-- 员工姓名 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_input"></p>
									<span class="help-block"></span>
							</div>
						</div>
						<!-- 员工邮箱 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">员工邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="empEmail_update_input" placeholder="email">		
									<span class="help-block"></span>
							</div>
						</div>
						<!-- 员工性别 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">员工性别</label> 
							<div class="col-sm-4">
							<label
								class="radio-inline"> <input type="radio" name="gender"
								id="gender_update_male" value="M" checked="checked">男
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="gender_update_female" value="F"> 女
							</label>
							</div>
						</div>
						<div class="form-group">
						<label class="col-sm-2 control-label">员工部门</label>
							<div class="col-sm-3" >
							<!-- 通过选择部门id来对应部门 -->
								<select class="form-control" name="dId" id="select_update_dept">
							
								</select>
						    </div>
						</div>
		
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
			</div>
		</div>
	</div>
	</div>

	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<!-- 员工姓名 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10" id="empNamediv">
								<input type="text" name="empName" class="form-control"
									id="empName_add_input" placeholder="Name">
									<span class="help-block"></span>
							</div>
						</div>
						<!-- 员工邮箱 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">员工邮箱</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="empEmail_add_input" placeholder="email">		
									<span class="help-block"></span>
							</div>
						</div>
						<!-- 员工性别 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">员工性别</label> 
							<div class="col-sm-4">
							<label
								class="radio-inline"> <input type="radio" name="gender"
								id="gender_input_male" value="M" checked="checked">男
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="gender_input_female" value="F"> 女
							</label>
							</div>
						</div>
						<div class="form-group">
						<label class="col-sm-2 control-label">员工部门</label>
							<div class="col-sm-3" >
							<!-- 通过选择部门id来对应部门 -->
								<select class="form-control" name="dId" id="select_dept">
							
								</select>
						    </div>
						</div>
		
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
			</div>
		</div>
	</div>
	</div>

	
	<!-- 搭建页面布局 -->
  	  <div class="wrap">
                <!-- 左边内容 -->
                <div id="left" class="left">
                    <div id="logoDiv" class="logoDiv">
                        <p id="logoTitle" class="logoTitle">
                            <img id="logo" alt="funsLogo" src="images/funsicon.jpg"
                                    style="height: 28px; padding-right: 5px;vertical-align: middle;">
                            <span style="font-size:18px;">职员管理系统</span>
                        </p>
                    </div>
                    <ul class="nav nav-pills nav-stacked">
						<li><a class="text-black" href="${Funs_Path}/emplist">职员信息</a></li>
						<li><a class="text-black" href="${Funs_Path}/deptlist">部门信息</a></li>
					</ul>
                </div>
     <!-- 右边内容 -->
     <div id="right" class="tab-content right">
     <nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <ul class="nav navbar-nav navbar-right">
      <li><a><span class="glyphicon glyphicon-user"></span> ${sessionScope.LoginUser}</a></li>
      <li><a href="#" id="exit"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li>
    </ul>
  </div>
</nav>
      <div class="container">
		<!-- 新增和删除按钮 -->
		<div class="row">
			<div class="col-md-10 col-md-offset-10">
				<button id="add_modal_btn" type="button" class="btn btn-info"
					data-toggle="modal">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					新增
				</button>
				<button id="delete_all_btn" type="button" class="btn btn-danger">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					删除
				</button>
			</div>
		</div>
		<br>
		<!-- 列表 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>编号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>邮箱</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- 中通过js的ajax解析json获取到员工数据,传入到tbody中 -->
					<tbody></tbody>
				</table>
			</div>
		</div>
		<!-- 页面按钮 -->
		<div class="row">
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6 col-md-offset-8" " id="page_nav_area"></div>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
		//全局变量,记录总记录数,和table列表的当前页
		var totalRecord,currentPage;
		//页面加载完成以后直接发送一个ajax请求,要到分页数据
		$(function() {
			//去首页
			to_page(1)
		});

		//
		function to_page(pn) {
			$.ajax({
				url : "${Funs_Path}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_emps_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析并显示分页条
					build_page_nav(result);
					//4.清空check选框选中状态
					$("#check_all").prop("checked",false);
				}
			});
		}

		//1.解析并显示员工数据
		function build_emps_table(result) {
			//构建完成之前清空表格
			$("#emps_table tbody").empty();
			var emps = result.extendMap.empInfo.list;
			$.each(emps, function(index, item) {
				var checkBoxTd=  $("<td></td>").append("<input type='checkbox' class='check_item'/>");
				//给每个checkbox添加所在行的id
				checkBoxTd.attr("check_id",item.empId);
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(
						item.gender == "M" ? "男" : "女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>")
						.append(item.department.deptName);
				/*
				<button type="button" class="btn btn-info btn-sm">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				修改
				</button>
				 */
				var editBtn = $("<button></button>").addClass(
						"btn btn-info btn-sm edit_btn").append(
						$("<span</span>")
								.addClass("glyphicon glyphicon-pencil"))
						.append("修改");
				editBtn.attr("edit_id",item.empId);
				/*
				<button type="button" class="btn btn-danger btn-sm">
				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
				删除
				</button>
				 */
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger btn-sm delete_btn")
						.append(
								$("<span</span>").addClass(
										"glyphicon glyphicon-trash")).append(
								"删除");
				//删除按钮中添加该行的id和name
				delBtn.attr("delete_id",item.empId).attr("delete_neme",item.empName);
				//将两个按钮放到同一个单元格中
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(
						delBtn);
				//append方法执行完成之后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(
						genderTd).append(emailTd).append(deptNameTd).append(
						btnTd).appendTo("#emps_table tbody");

			});
		}
		//2.解析并显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			//page_info_area
			$("#page_info_area").append(
					"当前第" + result.extendMap.empInfo.pageNum + "页,共"
							+ result.extendMap.empInfo.pages + "页,总"
							+ result.extendMap.empInfo.total + "条记录");
			totalRecord = result.extendMap.empInfo.total;
			currentPage = result.extendMap.empInfo.pageNum;
		}

		//3.解析并显示分页条
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			//给分页条添加样式
			var ul = $("<ul></ul>").addClass("pagination");
			//首页
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
			//上一页	
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extendMap.empInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extendMap.empInfo.pageNum - 1);
				});
			}
			//下一页
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			//末页
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
			if (result.extendMap.empInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extendMap.empInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.extendMap.empInfo.pages);
				});
			}

			//向分页条中添加首页和上一页
			ul.append(firstPageLi).append(prePageLi);
			//所有导航页号,getNavigatepageNums获得当前所有导航页号如pn=1为(1,2,3,4,5)
			//result.extendMap.empInfo.navigatepageNums;
			$.each(result.extendMap.empInfo.navigatepageNums, function(index,
					item) {
				var numPageLi = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				if (result.extendMap.empInfo.pageNum == item) {
					numPageLi.addClass("active");
				} else {
					numPageLi.click(function() {
						to_page(item);
					});
				}
				ul.append(numPageLi);
			});
			//向分页条中添加下一页和尾页
			ul.append(nextPageLi).append(lastPageLi);
			var page_nav = $("<nav></nav>").append(ul);
			page_nav.appendTo("#page_nav_area");
		}
		
		
		
		//点击新增按钮弹出新增功能的模态框
		$("#add_modal_btn").click(function() {
			//清空表单样式
			$("#myModal form").find("*").removeClass("has-success has-error");
			$("#myModal form").find(".help-block").text("");
			//清楚表单数据(表单重置)
			$("#myModal form")[0].reset();
			//发送Ajax请求,查出部门信息,显示在下拉列表中
			getDepts("#myModal select");
			$('#myModal').modal({
				backdrop : 'static'
			});
		});
		
		
		function getDepts(ele) {
			$(ele).empty();
			//发送Ajax请求,查出部门信息,显示在下拉列表中
			$.ajax({
				url : "${Funs_Path}/depts",
				type : "GET",
				success:function(result){
					$.each(result.extendMap.depts, function(index, item) {
						var deptOption=$("<option></option>").append(item.deptName).attr("value",item.deptId).appendTo(ele);
					});
				}
			});
		}
		
		
		//保存时需要的调用的校验方法
		function validate_add_form(){
			//1.先获取要校验核对的信息,使用正则表达式
			//要校验的员工姓名
			var empName = $("#empName_add_input").val();
			//帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
			var regName = /(^[a-zA-Z0-9_]{4,15}$)|(^[\u4e00-\u9fa5]{2,5}$)/;
			//判断输入的用户名是否符合规则
			if(!regName.test(empName)){
				show_validate_msg("#empName_add_input","error","用户名为5-16个英文和数字,或2-5个中文字符");
				return false;
			}else{
				show_validate_msg("#empName_add_input","success","");
			}
			
			//校验邮箱信息
			var email=$("#empEmail_add_input").val();
			var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//alert("邮箱格式错误")
				show_validate_msg("#empEmail_add_input","error","邮箱格式错误");
				return false;
			}else{
				show_validate_msg("#empEmail_add_input","success","");
			}
			return true;
		}
		
		//编写校验判断的方法
		function show_validate_msg(ele,status,msg){
			//校验前清除之前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			//判断校验状态
			if(status=="success"){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else{
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//点击保存员工的方法
		//点击模态框中的保存按钮,将表单的数据提交给服务器
		$("#emp_save_btn").click(function() {
			//1.先对要提交的数据交给服务器进行校验
			if(!validate_add_form()){
				return false;
			}else{
			//发送ajax请求保存员工   
			 $.ajax({
				url : "${Funs_Path}/emp",
				type : "POST",
				data : $("#myModal form").serialize(),
				success:function(result){
					$('#myModal').modal('hide');
					alert("保存成功");	
					//以总记录数为跳转页,跳转到最后一页
					to_page(totalRecord);
				} 
			});  
			}	
		});
		
		
		//点击修改按钮弹出模态框(显示当前数据的信息)
		$("#emps_table").on("click",".edit_btn",function(){
			//清空表单样式
			$("#updateModal form").find("*").removeClass("has-success has-error");
			$("#updateModal form").find(".help-block").text("");
			//清楚表单数据(表单重置)
			$("#updateModal form")[0].reset();			
			//发送Ajax请求,查出部门信息,显示在下拉列表中
			getDepts("#updateModal select");
			getEmp($(this).attr("edit_id"));
			//把修改按钮中的员工id传递到模态框的更新按钮中
			$("#emp_update_btn").attr("edit_id",$(this).attr("edit_id"));
			$("#updateModal").modal({
				backdrop : 'static'
			});
		});
		
		
		//显示当前员工信息在修改模态框中
		function getEmp(id){
			$.ajax({
				url : "${Funs_Path}/emp/"+id,
				type : "GET",
				success:function(result){
					$("#empName_update_input").text(result.extendMap.emp.empName);
					$("#empEmail_update_input").val(result.extendMap.emp.email);
					$("#updateModal input[name=gender]").val([result.extendMap.emp.gender]);
					$("#updateModal select").val([result.extendMap.emp.dId]);
				}
			});
		}
		
		
		//点击更新进行数据更新
		$("#emp_update_btn").click(function(){
			//更新前进行格式校验
			//校验邮箱信息
			var email=$("#empEmail_update_input").val();
			var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//alert("邮箱格式错误")
				show_validate_msg("#empEmail_update_input","error","邮箱格式错误");
				return false;
			}else{
				show_validate_msg("#empEmail_update_input","success"," ");
			}
			
			
			//发送ajax请求保存更改的员工信息
			$.ajax({
				url : "${Funs_Path}/emp/"+$(this).attr("edit_id"),
				type : "PUT",
				data : $("#updateModal form").serialize(),
				success:function(result){
					alert("修改成功");
					$('#updateModal').modal('hide');
					//回到当前页
					to_page(currentPage);
				}
			});
			
		});
		
		//点击删除按钮,删除单个数据
		$("#emps_table").on("click",".delete_btn",function(){
			//1.弹出是否确认删除对话框
			var deleteId = $(this).attr("delete_id")
			var deleteName = $(this).attr("delete_neme");
			//alert(deleteName);
			if(confirm("确定删除["+deleteName+"]员工吗？")){
				$.ajax({
					url : "${Funs_Path}/emp/"+deleteId,
					type : "DELETE",
					success:function(result){
						//回到当前页
						to_page(currentPage);
					}
				});
			}else{
				return false;
			}	
		});		
		
		
		//全选/全不选
		$("#check_all").click(function(){
			//attr获取checked是undefined
			//dom原生的属性,attr获取自定义属性值
			//prop修改和读取dom原生属性值
			//$(this).prop("checked");选中为true,未选中为false
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		
		//当所有check_item被选中时,check_all也被选中
		//document表示当前文档
		$(document).on("click",".check_item",function(){
			//判断当前选择中的元素是否为10个(所有check_item个数)
			//$(".check_item:checked").length);表示check_item选中的个数
			//$(".check_item").length);表示check_item所有个数,两个值相等就代表全部选中
			//全选返回true,未全选返回false
			var checkFlag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",checkFlag);

		});
		
		//点击顶部删除按钮,批量删除
		$("#delete_all_btn").click(function(){ 
			var checkedNum = $(".check_item:checked").length; 
			if(checkedNum==0){ 
			   alert("请至少选择一项!"); 
			   return false; 
			   } 
			if(confirm("确定删除所选项目?")){ 
			    $.each($(".check_item:checked"), function(){
					var deleteId=$(this).parent().attr("check_id");	
					 $.ajax({
							url : "${Funs_Path}/emp/"+deleteId,
							type : "DELETE",
							success:function(result){

							}
					});
				}); 
				to_page(currentPage);
			}
		});
		
		$("#exit").click(function(){
			if(confirm("确定退出当前用户")){
				window.location.href = "${Funs_Path}/login";
			}
		});
		
	</script>
</body>
</html>