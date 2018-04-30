<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="reqPath" value="${pageContext.request.servletPath}" />

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


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<title>管理员</title>
<script type="text/javascript">
function logout() {
		$
				.post(
						getContextPath() + "${pageContext.request.contextPath}/user/logout",
						null,
						function() {
							$("#info")
									.html(
											
													);
							//显示购物车中商品数量
							
						});
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
					<h3 class="modal-title text-center"">欢迎你！管理员用户</h3>
				</div>
				<div class="panel-body">您有以下特殊权限</div>
				<div class="panel-footer">


					<a
						href="${pageContext.request.contextPath}/admin/teacher/getAdminTeacher"
						class="btn btn-default" type="button">教师信息管理</a> <a
						href="${pageContext.request.contextPath}/admin/user/getAdminStudent"
						class="btn btn-default" type="button">学生用户管理</a>
					<a href="${pageContext.request.contextPath}/admin/user/queryLevMessage"
						class="btn btn-default" type="button">查看留言</a><br>
					<hr>
					<a
						href="${pageContext.request.contextPath}/admin/course/getAdminCourse"
						class="btn btn-default" type="button">课程信息管理</a> <a
						href="${pageContext.request.contextPath}/admin/takecourse/getAdminTakeCourse"
						class="btn btn-default" type="button">选课信息管理</a> 
						<a
						href="${pageContext.request.contextPath}/admin/takecourse/updateScoreView"
						class="btn btn-default" type="button">分数上传功能</a><br>
					<hr>
					<a href="${pageContext.request.contextPath}/view/index.jsp"
						class="btn btn-default" type="button">返回到主页 </a> <a
						href="${pageContext.request.contextPath}/view/login_user.jsp"
						class="btn btn-default" type="button">返回登陆界面</a><br>
					<hr>
				</div>
			</div>

		</div>


		<br> <br>

	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>