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


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<title>留言区</title>
<script type="text/javascript">
function logout() {
		$.post(
						getContextPath() + "${pageContext.request.contextPath}/user/logout",
						null,
						function() {
							$("#info").html();
							//显示购物车中商品数量
							});
}
$(function(){
	$("#levSend").click(function(){
		$.post("${pageContext.request.contextPath}/user/addlevMessage",
				$("#levForm").serialize(),
				function(result){
				if(result.flag){
					$("#msg").html("留言成功！")
					//重置表单
					$("#levForm")[0].reset();
				}else{
					$("#msg").html("留言失败！")
				}
		});
	});
})
		</script>
</head>
<body>
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

					<div class="panel-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="panel-body">
										<ul class="nav nav-pills">
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/index.jsp"
												>主页</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/takecourse/getTakeCourse" >选课</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/searchCourse.jsp">搜索课程</a></li>
											
											<li role="presentation"><a href="${pageContext.request.contextPath}/course/getAllCourse">学校所有课程</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/news/getNews">选课相关通知</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/ours.jsp" class="btn btn-info">留言区</a></li>
											</ul>
									</div>
								</div>
							</div>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-2">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">个人信息</h3>
											</div>
											<div class="panel-body">
												<a href="${pageContext.request.contextPath}/view/studentData.jsp" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
													<br>学生资料
												</a> <a href="${pageContext.request.contextPath}/course/getScore?userId=${sessionScope['_LOGIN_USER_'].userId }" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
													<br>已修学分
												</a>
												</a> <a href="${pageContext.request.contextPath}/course/getCourse?userId=${sessionScope['_LOGIN_USER_'].userId }" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-th-large"
													aria-hidden="true"></span> <br>个人课表
												</a> 
												 <a href="${pageContext.request.contextPath}/course/getCourseByClass?userId=${sessionScope['_LOGIN_USER_'].userId }" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-star-empty"
													aria-hidden="true"></span> <br>学期课表
												</a> 
												<c:if test="${sessionScope['_LOGIN_USER_']!=null}">
												<a href="${pageContext.request.contextPath}/view/login_user.jsp" class="btn btn-default" type="button" onclick="logout()">

													<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
													<br>退出系统
												</a>
												</c:if>
												
					
					
											</div>

										</div>
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">常用系统</h3>
											</div>
											<div class="panel-body">
												<a href="#" class="btn btn-info active btn-block"
													type="button">42</a> <a href="#"
													class="btn active btn-block btn-default" type="button">16</a>
												<a href="#" class="btn active btn-block btn-default"
													type="button">教务网</a> <a href="#"
													class="btn active btn-block btn-default" type="button">英语强化</a>
											</div>

										</div>
									</div>
									<div class="col-md-7">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">
													<h3>如果你有什么问题请在下面给我们留言，我们会尽快给你回复的！
													</h3>
												</h3>
											</div>
											<div class="panel-body">
												<form class="form-horizontal" role="form" id="levForm">
													<div class="form-group">
														<div class="col-sm-12">
															<input type="hidden" name="s_id" value="${_LOGIN_USER_.userId}"/>
															<input type="text" placeholder="姓名" class="form-control" name="levName" id="levName" />
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<input type="email" placeholder="邮箱" class="form-control" name="levEmail" id="levEmail" />
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<textarea placeholder="内容" class="form-control" name="levCon" id="levCon"></textarea>
														</div>
													</div>
</form>
													<div class="form-group">
														<div class="col-sm-12">

															<button id="levSend" class="btn btn-default">
																留言</button>
																<span id="msg"></span>
														</div>
													</div>
												
											</div>
											<div class="panel-footer">
												<h3>
													<span class="glyphicon glyphicon-send" aria-hidden="true"></span>我们的地址
												</h3>
												<img src="${pageContext.request.contextPath}/images/17.jpg">
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">
													<address>
														<strong>地址</strong><br /> 大连东软信息学院<br />
													</address>
												</h3>
											</div>
											<div class="panel-body">
												<address>
													<strong>Email</strong><br /><a href="mailto:121231223@qq.com">1406877145@qq.com</a>
												</address>
											</div>
											<div class="panel-footer">
												<address>
													<strong>联系方式</strong><br /> 手机：18342246855<br /> <abbr
														title="Phone">电话：</abbr> 0421-8953152
												</address>
											</div>
										</div>
									</div>
								</div>
							</div>
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