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
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/prettify.min.js"></script>
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/multiselect.min.js"></script>

<title>课程管理</title>

<script type="text/javascript">
	function selCourseBut(formName, cbName) {
		if ($("#selAllCourse").is(":checked"))
			selectAll(formName, cbName);
		else
			unSelectAll(formName, cbName);
	}
	function check() {
		if (!validateCheckbox("courseIds", "请至少选中一个课程"))
			return false;
		else
			return confirm("确实要删除选中的所有课程吗？");
	}
	function logout() {
		$.post(getContextPath() + "/user/logout", null, function() {
			location.href = getContextPath() + "";
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
						<h3 class="panel-title">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<div class="row">

											<div class="col-md-4">
												<img src="${pageContext.request.contextPath}/images/1.jpg">
											</div>
											<div class="col-md-4">
												<h1>学生在线选课系统</h1>
												---课程管理
											</div>
											<div class="col-md-4"></div>
										</div>
									</div>
								</div>
							</div>
						</h3>
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
												href="${pageContext.request.contextPath}/admin/course/getAdminCourse"
												class="btn btn-info">课程管理</a></li>
												<li role="presentation"><a
												href="${pageContext.request.contextPath}/admin/takecourse/getAdminTakeCourse">选课课程管理</a></li>
											<li role="presentation"><a href="#" onclick="logout()">退出系统</a></li>
											<div class="collapse navbar-collapse"
												id="bs-example-navbar-collapse-1">

												<form class="navbar-form navbar-right" role="search">


												</form>

											</div>
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
															<h3 class="panel-title" id="nav7">课程信息列表</h3>
														</div>
														<div class="col-md-9">
															<form class="form-inline" role="form" id="searchForm"
																method="post"
																action="${pageContext.request.contextPath}/admin/course/getAdminCourse">

																<div class="col-md-5">
																<div class="form-group">
																	<label for="userId"> 学生名</label> <select
																		class="form-control input-sm" name="userId"
																		id="userId">
																		<option value="0">---所有学生用户---</option>
																		<c:forEach items="${user }" var="c">
																			<option value="${c.userId }"
																				${param.userId==c.userId?'selected':''}>${fn:escapeXml(c.userName) }</option>
																		</c:forEach>
																	</select>
																</div>
																</div>
																<div class="col-md-7">
																<div class="form-group">
																	<label for="courseName"> 课程名</label> <input
																		class="form-control input-sm" name="courseName"
																		id="courseName" value="${param.courseName}"
																		type="text" placeholder="课程名" />
																</div>
																<button class="btn btn-info btn-sm" type="submit">搜索</button>
																</div>
															</form>
														</div>
														
													</div>
												</div>
												<div class="panel-body">
													<c:if test="${!empty course.list }">
														<div class="table-responsive ">
															<form name="courseForm" method="post"
																action="${pageContext.request.contextPath}/admin/course/delCourseByIds"
																onsubmit="return check()">
																<button class="btn btn-info" type="submit">批量删除</button>
																&nbsp;&nbsp;<a
																	href="${pageContext.request.contextPath}/admin/course/handleCourse"
																	type="button" class="btn btn-info">添加课程</a>
																<table class="table table-striped">
																	<thead>
																		<tr>
																			<th><input type="checkbox" id="selAllCourse"
																				onchange="selCourseBut('courseForm', 'courseIds')" />
																				全选</th>
																			<th>#</th>
																			<th>课程名</th>

																			<th>课程学期</th>
																			<th>课程专业</th>
																			<th>课程学分</th>
																			<th>上课时间</th>
																			<th>周次</th>
																			<th>任课教师</th>
																			<th>上课地点</th>
																			<th>操作</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${course.list}" var="g"
																			varStatus="vs">
																			<tr>
																				<td><input type="checkbox" name="courseIds"
																					value="${g.courseId }" /></td>
																				<td>${vs.count }</td>
																				<td>${g.courseName }</td>
																				<td>${g.courseClass }</td>
																				<td>${g.courseTime }</td>
																				<td>${g.courseWeek }</td>
																				<td>${g.courseTime }</td>
																				<td>${g.courseWeek }</td>
																				<td>${g.courseTeacher }</td>
																				<td>${g.courseWhere }</td>
																				<td><a
																					href="${pageContext.request.contextPath}/admin/course/handleCourse?courseId=${g.courseId}">修改</a>
																					| <a
																					href="${pageContext.request.contextPath}/admin/course/delCourse?courseId=${g.courseId}"
																					onclick="return confirm('确定要删除这个课程吗？')">删除</a></td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</form>
															<%@include file="../../pageList.jsp"%>
														</div>
													</c:if>

													<c:if test="${empty course.list }">课程信息为空</c:if>
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
										<h3 class="panel-title">学生在线选课系统 </h3>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
</body>
</html>