<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.edu.neu.core.Constants"%>
<%@page import="cn.edu.neu.core.common.CommonBaseAction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap-theme.min.css">


<!-- Custom styles for this template -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminnav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/style.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/prettify.min.js"></script>
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/multiselect.min.js"></script>

<title>上传学生分数</title>
<script type="text/javascript">
	function selTakeCourseBut(formName, cbName) {
		if ($("#selAllTakeCourse").is(":checked"))
			selectAll(formName, cbName);
		else
			unSelectAll(formName, cbName);
	}
	function check() {
		if (!validateCheckbox("takecourseIds", "请至少选中一个选课课程"))
			return false;
		else
			return confirm("确实要删除选中的所有选课课程吗？");
	}
	function logout() {
		$.post(getContextPath() + "/user/logout", null, function() {
			location.href = getContextPath() + "/view/login_admin.jsp";
		});
	}

	function checkLogin(result) {
		if (result.login) {
			//$("#msgTitle").html(result.login);
			//$("#msgBody").html(result.login);
			//$("#msgModal").modal();
			$("#loginFormModal").val();
			return false;
		}
		return true;
	}
</script>
<style>
h3#nav7 {
	font-size: 22px;
}
</style>
</head>
<body>

	<div class="container-fluid" id="nav">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">

						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="row">

										<div class="col-md-4">
											<img src="${pageContext.request.contextPath}/images/1.jpg">
										</div>
										<div class="col-md-4">
											<h1>学生在线选课系统</h1>
											---课程分数录入
										</div>
										<div class="col-md-4"></div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="panel-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="panel-body">
									<ul class="nav nav-pills">
										<li role="presentation"><a
											href="${pageContext.request.contextPath}/admin/teacher/getAdminTeacher">教师用户管理</a></li>
										<li role="presentation"><a
											href="${pageContext.request.contextPath}/admin/user/getAdminStudent">学生用户管理</a></li>

										<li role="presentation"><a
											href="${pageContext.request.contextPath}/admin/course/getAdminCourse">课程管理</a></li>
										<li role="presentation"><a
											href="${pageContext.request.contextPath}/admin/takecourse/getAdminTakeCourse"
											class="btn">选课课程管理</a></li>
										<li role="presentation"><a
											href="${pageContext.request.contextPath}/admin/takecourse/oadScore"
											class="btn btn-info">课程分数录入</a></li>
										<li role="presentation"><a href="#" onclick="logout()">退出系统</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="container-fluid">
							<div class="col-md-12">
								<div class="container-fluid">
									<div class="col-md-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<div class="container-fluid">
													<div class="col-md-3">
														<h3 class="panel-title" id="nav7">选课课程信息列表</h3>
													</div>
													<div class="col-md-9">
														<form class="form-inline" role="form" id="searchForm"
															method="post"
															action="${pageContext.request.contextPath}/admin/takecourse/getAdminTakeCourse">

															<div class="col-md-7">
																<div class="form-group">
																	<label for="takecourseName"> 选课课程名</label> <input
																		class="form-control input-sm" name="takecourseName"
																		id="takecourseName" value="${param.takecourseName}"
																		type="text" placeholder="选课课程名" />
																</div>
																<button class="btn btn-info btn-sm" type="submit">搜索</button>
															</div>
															<div class="col-md-5"></div>
														</form>
													</div>

												</div>
											</div>
											<div class="panel-body">
												<!--  from -->
												<form action="updateScore" method="post"
													enctype="multipart/form-data">
													<div class="form-group">
														<label for="ksbm">考 试 编 码</label> <input type="text"
															class="form-control" id="ksbm" name="ksbm"
															placeholder="000000001">
													</div>
													<div class="form-group">
														<label for="excel">EXCEL文件</label> <input type="file"
															class="form-control" name="excel" id="excel"
															placeholder="">
													</div>

													<div class="checkbox">
														<label> <input type="checkbox" name="notify">
															邮件通知学生
														</label>
													</div>
													<button type="submit" class="btn btn-default">保存</button>
												</form>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="col-md-3">
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br>
							</div>

							<div class="container-fluid"></div>
						</div>
						<div class="col-md-3">
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br> <br> <br>
						</div>

					</div>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="modal-title text-center">
						<div class="col-md-12">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">学生在线选课系统</h3>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>