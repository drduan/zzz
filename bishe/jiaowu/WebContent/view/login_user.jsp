<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<title>学生用户登录</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#loginFormModal').val();
	});
	function login(redirUrl) {
		var userName = $("#userName").val();
		var userPass = $("#userPass").val();
		$.post(getContextPath() + "/user/login", {
			userName : userName,
			userPass : userPass
		}, function(result) {

			if (result.login == "yes") {
				//alert("true");
				$('#loginFormModal').val('hide');
				if (redirUrl)
					location.href = redirUrl;
				else
					location.href = getContextPath() + "/view/index.jsp";
			} else {
				//alert("false");
				$("#msgTitle").html("登录失败");
				$("#msgBody").html("用户名或密码错误");
				$("#msgModal").modal();

			}
		});
	}
	function closeLogForm(backUrl) {
		location.href = backUrl;
	}
</script>
</head>
<body>


	<br>
	<br>
	<br>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<img src="${pageContext.request.contextPath}/images/1.jpg">
				<h2 class="modal-title text-center">学生在线选课系统</h2>
			</div>
			<br> <br>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-4">
			<img src="${pageContext.request.contextPath}/images/2.jpg" width=450
				height=350 />
		</div>
		
		
		<div class="col-md-4">
		<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="modal-title text-center"">
						登录
					</h3>
				</div>
				<div class="modal-title text-center">
				<div class="panel-body">
         <a href="${pageContext.request.contextPath}/view/login_user.jsp" class="btn btn-info">学 生</a>
             <a href="${pageContext.request.contextPath}/view/login_admin.jsp" >管理员</a>
				</div>
				</div>
				<div class="panel-footer">
					<form class="form-horizontal" role="form" id="loginForm">
				<div class="form-group">
					 
					<label for="userName" class="col-sm-3 control-label">
						用户名
					</label>
					<div class="col-sm-9">
						<input type="text" name="userName" id="userName" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					 
					<label for="userPass" class="col-sm-3 control-label">
						密 &nbsp;码
					</label>
					<div class="col-sm-9">
						<input type="password" name="userPass" id="userPass" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 
							<label>
								<input type="checkbox" /> 记住我
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 
						
						
						<button class="btn btn-default" type="button"
					onclick="login('${redirUrl}')">学生登录</button>
	
						<a href="${pageContext.request.contextPath}/view/reg_user.jsp" class="btn btn-default" type="button" >
							注册</a>
					</div>
				</div>
				
			</form>
				</div>
			</div>
			
		</div>
		
		
			
		
		<%@include file="msgModal.jsp"%>
		<div class="col-md-2"></div>
	</div>
	
	<br>
	
	</div>
	

</body>
</html>