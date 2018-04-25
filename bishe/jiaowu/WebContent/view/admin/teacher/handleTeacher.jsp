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
<title>选课课程教师管理-操作教师</title>

<script type="text/javascript">
	function selTeacherBut(formName, cbName) {
		if ($("#selAllTeacher").is(":checked"))
			selectAll(formName, cbName);
		else
			unSelectAll(formName, cbName);
	}
	function check() {
		if (!validateCheckbox("teacherIds", "请至少选中一个教师"))
			return false;
		else
			return confirm("确实要删除选中的所有教师吗？");
	}
	function logout() {
		$.post(getContextPath() + "/user/logout", null, function() {
			location.href = getContextPath() + "/admin";
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
	<%@include file="../../setReferUrl.jsp"%>
	<div class="container-fluid">
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
											</div>
											<div class="col-md-4"></div>
										</div>
									</div>
								</div>
							</div>
						</h3>
					</div>
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-3  "></div>
							<div
								class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


								<h2 class="sub-header">${empty teacher.teacherId?"添加":"修改" }选课课程教师</h2>
								<div class="col-sm-6 col-sm-offset-5 col-md-8 col-md-offset-0">

									<form class="form" role="form" method="post"
										action="${pageContext.request.contextPath}/admin/teacher/doHandleTeacher"
										enctype="multipart/form-data">


										<input type="hidden" id="teacherId" name="teacherId"
											value="${empty teacher.teacherId?0:teacher.teacherId}" />
						
										
										<div class="form-group">
											<label for="teacherName"> 教师名 </label> <input
												class="form-control" name="teacherName" id="teacherName"
												value="${teacher.teacherName}" type="text" placeholder="教师名"
												required />
										</div>
										<div class="form-group">
											<label for="teacherWhere"> 任课地点 </label> <input
												class="form-control" name="teacherWhere" id="teacherWhere"
												value="${teacher.teacherWhere}" type="text" placeholder="任课地点"
												required />
										</div>
										
										<button class="btn btn-primary" type="submit">确定</button>
										<button class="btn btn-default" type="reset">重置</button>
<a class="btn btn-default" href="javascript:history.go(-1)">取消</a>
									</form>
								</div>
							</div>
						</div>
					</div>
</body>
</html>