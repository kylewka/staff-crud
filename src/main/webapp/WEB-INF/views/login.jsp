<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登陆</title>
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
</head>
<body style="background: url(images/background.jpg);">
		
		<!-- 登陆框 -->
		<div class="modal fade"   id="login_model" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document" style="margin-top:15%; margin-right:10%; width: 500px;" >
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">Sign In</h4>
				</div>
				<div class="modal-body">
					<form id="userform" class="form-horizontal">
						<div class="form-group">
							<label for="usernamelabel" class="col-xs-offset-1 col-sm-2 control-label">username  </label>
							<div class="col-sm-offset-1 col-sm-7">
								<input type="text" name="username" class="form-control"
									id="inputUsername" placeholder="username">
									<span class="help-block"></span>
							</div>
							
						</div>
						<div class="form-group">
							<label for="passwordlabel" class="col-xs-offset-1 col-sm-2 control-label">Password  </label>
							<div class="col-sm-offset-1 col-sm-7">
								<input type="password" name="password" class="form-control"
									id="inputPassword" placeholder="Password">
									<span class="help-block"></span>
							</div>
						</div>
					<div class="form-group">
						<label for="codelabel" class="col-xs-offset-1 col-sm-2 control-label">验证码</label>
						<div class="col-sm-offset-1  col-sm-7">
						<input class="form-control" type="tel" id="inputCode" placeholder="请输入图形验证码" /> 
						<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4  col-sm-7">
						<span><canvas id="canvas" width="120" height="45"></canvas> <a href="#"
							id="changeImg">看不清，换一张</a></span>
						</div>
					</div>
					<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button type="button" class="btn btn-primary" id="login_btn">登录</button>
							</div>
							<div class="col-xs-offset-2 col-sm-2">
								<button type="button" class="btn btn-default" id="reg_model_btn">注册</button>
							</div>
						</div>
				</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		</div>
		
		<!-- 注册框 -->
		<div class="modal fade"   id="reg_model" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document" style="margin-top:15%; margin-right:10%; width: 500px;" >
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">Sign up</h4>
				</div>
				<div class="modal-body">
					<form id="regform" class="form-horizontal">
						<div class="form-group">
							<label for="usernamelabel" class="col-xs-offset-1 col-sm-2 control-label">username  </label>
							<div class="col-sm-offset-1 col-sm-7">
								<input type="text" name="username" id="regUsername" class="form-control" placeholder="username">
								<span class="help-block"></span>
							</div>
							
						</div>
						<div class="form-group">
							<label for="passwordlabel" class="col-xs-offset-1 col-sm-2 control-label">Password  </label>
							<div class="col-sm-offset-1 col-sm-7">
								<input type="password" name="password" id="regPassword" class="form-control" placeholder="Password">
								<span class="help-block"></span>
							</div>
						</div>
					<div class="form-group">
						<label for="codelabel" class="col-sm-4 control-label">Password Again</label>
						<div class="col-sm-7">
						<input type="password"  class="form-control"
									id="regPasswordAgain" placeholder="Password Again">
									<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button type="button" class="btn btn-primary" id="reg_user_btn">注册</button>
							</div>
							<div class="col-xs-offset-2 col-sm-2">
								<button type="button" class="btn btn-default" id="reg_login_btn">返回</button>
							</div>
						</div>
				</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		</div>
		

	<script type="text/javascript">
		//设置全局变量获取验证码
		contxt=""; 
		
		$("#login_model").modal({
			backdrop: 'static', 
			//点击背景空白处不被关闭； 
			keyboard: false
			//触发键盘esc事件时不关闭。
		});
		
		
		$(function(){
			$("#login_model").modal('show');	
		});
		
		//点击注册关闭登陆模态框
		$("#reg_model_btn").click(function(){
				
			$("#login_model").modal('hide');
			$("#reg_model").modal({
				backdrop: 'static', 
				//点击背景空白处不被关闭； 
				keyboard: false
				//触发键盘esc事件时不关闭。
			});
			$("#reg_model").modal('show');
			//清空表单样式
			$("#regform").find("*").removeClass("has-success has-error");
			$("#regform").find(".help-block").text("");
			$("#regform")[0].reset();
		});
		
		
		//点击返回关闭注册模态框
		$("#reg_login_btn").click(function(){
			$("#reg_model").modal('hide');
			$("#login_model").modal('show');
			$("#userform").find("*").removeClass("has-success has-error");
			$("#userform").find(".help-block").text("");
			$("#userform")[0].reset();
		});
		
		
		
		/**生成一个随机数**/
		  function randomNum(min,max){
			code=Math.floor( Math.random()*(max-min)+min);
		    return code;
		  }
		  /**生成一个随机色**/
		  function randomColor(min,max){
		    var r = randomNum(min,max);
		    var g = randomNum(min,max);
		    var b = randomNum(min,max);
		    return "rgb("+r+","+g+","+b+")";
		  }
		  drawPic();
		  //点击(看不清)刷新
		  $("#changeImg").click(function(e){
			  refreshCode(e);
		  });
		  //刷新验证码
		  function refreshCode(e){
			  e.preventDefault();
			  drawPic();
		  }
		  
		  /**绘制验证码图片**/
		  function drawPic(){
		    var canvas=document.getElementById("canvas");
		    var width=canvas.width;
		    var height=canvas.height;
		    var ctx = canvas.getContext('2d');
		    ctx.textBaseline = 'bottom';
		 
		    /**绘制背景色**/
		    ctx.fillStyle = randomColor(180,240); //颜色若太深可能导致看不清
		    ctx.fillRect(0,0,width,height);
		    /**绘制文字**/
		    var str = 'ABCEFGHJKLMNPQRSTWXY123456789';
		    contxt=""; 
		    for(var i=0; i<4; i++){
		      var txt = str[randomNum(0,str.length)];
		      contxt+=txt; 
		      ctx.fillStyle = randomColor(50,160);  //随机生成字体颜色
		      ctx.font = randomNum(30,40)+'px SimHei'; //随机生成字体大小
		      var x = 10+i*25;
		      var y = randomNum(25,45);
		      var deg = randomNum(-45, 45);
		      //修改坐标原点和旋转角度
		      ctx.translate(x,y);
		      ctx.rotate(deg*Math.PI/180);
		      ctx.fillText(txt, 0,0);
		      //恢复坐标原点和旋转角度
		      ctx.rotate(-deg*Math.PI/180);
		      ctx.translate(-x,-y);
		    }
		    /**绘制干扰线**/
		    for(var i=0; i<8; i++){
		      ctx.strokeStyle = randomColor(40,180);
		      ctx.beginPath();
		      ctx.moveTo( randomNum(0,width), randomNum(0,height) );
		      ctx.lineTo( randomNum(0,width), randomNum(0,height) );
		      ctx.stroke();
		    }
		    /**绘制干扰点**/
		    for(var i=0; i<100; i++){
		      ctx.fillStyle = randomColor(0,255);
		      ctx.beginPath();
		      ctx.arc(randomNum(0,width),randomNum(0,height), 1, 0, 2*Math.PI);
		      ctx.fill();
		    }
		  }
		
	
		
		//登陆按钮
		$("#login_btn").click(function(e) {
			$("#userform").find("*").removeClass("has-success has-error");
			$("#userform").find(".help-block").text("");
			if($("#inputCode").val().toLowerCase()==contxt.toLowerCase()){
			$.ajax({
				url : "${Funs_Path}/handle_login",
				type : "POST",
				data : $("#userform").serialize(),
				success : function(result) {
					console.log(result);
					if (result.code == 200) {
						if(result.extendMap.error==0){
							show_validate_msg("#inputPassword","error","密码错误");
						}else{
							show_validate_msg("#inputUsername","error","用户名不存在");
						}
					} else {
						window.location.href = "${Funs_Path}/emplist";
					}
				}
			});
			}else{
				show_validate_msg("#inputCode","error","验证码错误");
				//刷新验证码
				refreshCode(e);
			}
		});
		
		//确认注册按钮
		$("#reg_user_btn").click(function(){
			if($("#regPassword").val()==$("#regPasswordAgain").val()){
				$.ajax({
					url : "${Funs_Path}/handle_reg",
					type : "POST",
					data : $("#regform").serialize(),
					success : function(result) {
						console.log(result);
						if (result.code == 200) {
							if(result.extendMap.error==0){
								show_validate_msg("#regPassword","error","密码格式错误");
							}else if(result.extendMap.error==1){
								show_validate_msg("#regUsername","error","用户名格式错误");
							}else{
								show_validate_msg("#regUsername","error","用户名已存在");
							}
						} else {
							$("#reg_model").modal('hide');
							$("#login_model").modal('show');
						}
					}
				});
			}else{
				show_validate_msg("#regPasswordAgain","error","两次密码不一致");
			}
		});
		
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
		

	</script>
</body>
</html>