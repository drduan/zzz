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
	href="${pageContext.request.contextPath}/css/dashboard.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminnav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/style.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/prettify.min.js"></script>
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/multiselect.min.js"></script>
<title>学生用户管理-操作学生用户</title>

<script type="text/javascript">
	function updatePic() {
		if ($("#updatePicBut").val() == "修改学生照片") {
			$("#userPicDiv")
					.append(
							"<input class=\"form-control\" name=\"userPicFile\" id=\"userPicFile\" type=\"file\"  required/>");
			$("#updatePicBut").val("取消修改学生照片");
		} else {
			$("#userPicDiv").children("#userPicFile").remove();
			$("#updatePicBut").val("修改学生照片");
		}

	}
	function selStudentBut(formName, cbName) {
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

								<h2 class="sub-header">${empty user.userId?"添加":"修改" }学生用户</h2>
								<div class="col-sm-6 col-sm-offset-5 col-md-8 col-md-offset-0">
									<c:if test="${!empty user.userPic }">
										<img src="${pageContext.request.contextPath}${user.userPic}"
											width="242" height="200">
									</c:if>
									<form class="form" role="form" method="post"
										action="${pageContext.request.contextPath}/admin/user/doHandleStudent"
										enctype="multipart/form-data">
										<input type="hidden" id="userId" name="userId" value="${empty user.userId?0:user.userId}"/>
										<div class="form-group">
											<label for="userName"> 学生姓名 </label> <input
												class="form-control" name="userName" id="userName"
												value="${user.userName}" type="text" placeholder="学生姓名"
												required />
										</div>
										<div class="form-group">
											<label for="userPass"> 学生密码 </label> <input
												class="form-control" name="userPass" id="userPass"
												value="${user.userPass}" type="text" placeholder="学生密码"
												required />
										</div>
										<div class="form-group">
											<label for="userProfession"> 学生专业 </label> <input
												class="form-control" name="userProfession"
												id="userProfession" value="${user.userProfession}"
												type="text" placeholder="学生专业" required />
										</div>
										<div class="form-group">
											<label for="userRecord"> 学生学历 </label> <input
												class="form-control" name="userRecord" id="userRecord"
												value="${user.userRecord}" type="text" placeholder="学生学历"
												required />
										</div>
										<div class="form-group">
											<label for="userClass"> 学生班级 </label> <input
												class="form-control" name="userClass" id="userClass"
												value="${user.userClass}" type="text" placeholder="学生班级"
												required />
										</div>
										<div class="form-group">
											<label for="userPhone"> 学生电话</label> <input
												class="form-control" name="userPhone" id="userPhone"
												value="${user.userPhone}" type="text" placeholder="学生电话"
												required />
										</div>
										<div class="form-group">
											<label for="userBrithday"> 学生生日</label> <input
												class="form-control" name="userBrithday" id="userBrithday"
												value="${user.userBrithday}" type="text" placeholder="学生生日"
												required />
										</div>
										<div class="form-group">
											<label for="userTime"> 入学日期</label> <input
												class="form-control" name="userTime" id="userTime"
												value="${user.userTime}" type="text" placeholder="入学日期"
												required />
										</div>
										<div class="form-group" id="userPicDiv">
											<label for="userPic"> 学生照片（图片规格：242*200）</label>
											<c:if test="${empty user.userId }">
												<input class="form-control" name="userPicFile"
													id="userPicFile" type="file" required />
											</c:if>
											<c:if test="${!empty user.userId }">
												<input class="form-control btn-info" type="button"
													id="updatePicBut" value="修改学生照片" onclick="updatePic()" />
											</c:if>
											<input type="hidden" name="userPic" value="${user.userPic}" />

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