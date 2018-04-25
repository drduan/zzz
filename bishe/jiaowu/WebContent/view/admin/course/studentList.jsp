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

<title>学生管理</title>

<script type="text/javascript">
	function selUserBut(formName, cbName) {
		if ($("#selAllUser").is(":checked"))
			selectAll(formName, cbName);
		else
			unSelectAll(formName, cbName);
	}
	function check() {
		if (!validateCheckbox("userIds", "请至少选中一个商品"))
			return false;
		else
			return confirm("确实要删除选中的所有商品吗？");
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
												---学生管理
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
												href="${pageContext.request.contextPath}/view/index.jsp">去往主页</a></li>
											<li role="presentation"><a
												href="${pageContext.request.contextPath}/admin/teacher/getAdminTeacher">教师用户管理</a></li>
											<li role="presentation"><a
												href="${pageContext.request.contextPath}/admin/user/getAdminStudent" class="btn btn-info">学生用户管理</a></li>

											<li role="presentation"><a
												href="${pageContext.request.contextPath}/admin/course/getAdminCourse"
												>课程管理</a></li>
											<li role="presentation"><a href="#" onclick="logout()">退出系统</a></li>
											</ul>
									</div>
								</div>
							</div>
							
										<div class="container-fluid">
											<div class="col-md-12">
												<div class="container-fluid">
													<div class="col-md-12">
														<form class="form-inline" role="form" id="searchForm"
															method="post"
															action="${pageContext.request.contextPath}/admin/user/getAdminStudent">

															<div class="form-group">
																<label for="userName"> 学生姓名</label> <input
																	class="form-control input-sm" name="userName"
																	id="userName" value="${param.userName}" type="text"
																	placeholder="学生姓名" />
															</div>
															<button class="btn btn-primary btn-sm" type="submit">搜索</button>
														</form>
														<h2 class="sub-header">学生信息列表</h2>

															<c:if test="${!empty user.list }">
																<div class="table-responsive ">
																	<form name="userForm" method="post" action="${pageContext.request.contextPath}/admin/user/delStudent?userId=${g.userId}""
																		onsubmit="return check()">
																		<button class="btn btn-primary" type="submit">批量删除</button>&nbsp;&nbsp;<a
																							href="${pageContext.request.contextPath}/admin/user/handleStudent" type="button" class="btn btn-primary">添加学生用户</a>
																		<table class="table table-striped">
																			<thead>
																				<tr>
																					<th><input type="checkbox" id="selAllUser"
																						onchange="selUserBut('userForm', 'userIds')" />
																						全选</th>
																					<th>#</th>
																					<th>学生姓名</th>
																					<th>学生照片</th>
																					<th>学生专业</th>
																					<th>学生班级</th>
																					<th>学生学历</th>
																					<th>学生电话</th>
																					<th>学生生日</th>
																					<th>入学时间</th>
																					<th>操作</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach items="${user.list}" var="g"
																					varStatus="vs">
																					<tr>
																						<td><input type="checkbox" name="userIds"
																							value="${g.userId }" /></td>
																						<td>${vs.count }</td>
																						<td>${g.userName }</td>
																						<td><img src="${pageContext.request.contextPath}${g.userPic}" width="50" height="50"></td>
																						<td>${g.userProfession }</td>
																						<td>${g.userClass }</td>
																						<td>${g.userRecord }</td>
																						<td>${g.userPhone }</td>
																						<td>${g.userBrithday }</td>
																						<td>${g.userTime }</td>
																						
																						<td><a
																							href="${pageContext.request.contextPath}/admin/user/handleStudent?userId=${g.userId}">修改</a>
																							| <a href="${pageContext.request.contextPath}/admin/user/delStudent?userId=${g.userId}"
																							onclick="return confirm('确定要删除这个商品吗？')">删除</a></td>
																					</tr>
																				</c:forEach>
																			</tbody>
																		</table>
																	</form>
																	<%@include file="../../pageList.jsp"%>
																</div>
															</c:if>
															<c:if test="${empty user.list }">暂无学生信息</c:if>
													</div>
													
												</div>
											</div>
											<div class="col-md-3">
												<br> <br> <br> <br> <br> <br>
												<br> <br> <br> <br> <br> <br>
												<br> <br> <br> <br> <br> <br>
												<br> <br>
											</div>
											
														<div class="container-fluid">
															
														</div>
													</div>
													<div class="col-md-3">
														<br> <br> <br> <br> <br> <br>
														<br> <br> <br> <br> <br> <br>
														<br> <br> <br> <br> <br> <br>
														<br> <br>
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