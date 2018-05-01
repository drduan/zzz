<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>搜索课程</title>
<script type="text/javascript">
	function logout() {
		$.post(getContextPath()
				+ "${pageContext.request.contextPath}/user/logout", null,
				function() {
					$("#info").html(

					);
					//显示购物车中商品数量

				});
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
												href="${pageContext.request.contextPath}/view/index.jsp">主页</a></li>
											<li role="presentation"><a
												href="${pageContext.request.contextPath}/takecourse/getTakeCourse">选课</a></li>
											<li role="presentation"><a
												href="${pageContext.request.contextPath}/view/searchCourse.jsp"
												class="btn btn-info">搜索课程</a></li>

											<li role="presentation"><a
												href="${pageContext.request.contextPath}/course/getAllCourse">学校所有课程</a></li>
											<li role="presentation"><a
												href="${pageContext.request.contextPath}/news/getNews">选课相关通知</a></li>
											<li role="presentation"><a
												href="${pageContext.request.contextPath}/view/ours.jsp">留言区</a></li>
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
												<a
													href="${pageContext.request.contextPath}/view/studentData.jsp"
													class="btn btn-default" type="button"> <span
													class="glyphicon glyphicon-search" aria-hidden="true"></span>
													<br>学生资料
												</a> <a
													href="${pageContext.request.contextPath}/course/getScore?userId=${sessionScope['_LOGIN_USER_'].userId }"
													class="btn btn-default" type="button"> <span
													class="glyphicon glyphicon-star" aria-hidden="true"></span>
													<br>已修学分
												</a> </a> <a
													href="${pageContext.request.contextPath}/course/getCourse?userId=${sessionScope['_LOGIN_USER_'].userId }"
													class="btn btn-default" type="button"> <span
													class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
													<br>个人课表
												</a> <a
													href="${pageContext.request.contextPath}/course/getCourseByClass?userId=${sessionScope['_LOGIN_USER_'].userId }"
													class="btn btn-default" type="button"> <span
													class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
													<br>学期课表
												</a>
												<c:if test="${sessionScope['_LOGIN_USER_']!=null}">
													<a
														href="${pageContext.request.contextPath}/view/login_user.jsp"
														class="btn btn-default" type="button" onclick="logout()">

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
													<form class="form-inline" role="search" method="post"
														action="${pageContext.request.contextPath}/course/searchCourse">
														<div class="form-group">
															<label for="exampleInputName2">课程名</label> <input
																class="form-control " type="text" name="keyword"
																value="${fn:escapeXml(param.keyword)}" />
														</div>
														<button type="submit" class="btn btn-default">查询</button>
														<ul class="nav navbar-right">
															<li class="dropdown"><a class="dropdown-toggle"
																href="#" data-toggle="dropdown">排序</a>
																<ul class="dropdown-menu">
																	<c:if test="${param.keyword!=null}">
																		<li><a
																			href="${pageContext.request.contextPath}/course/searchCourse?keyword=${fn:escapeXml(param.keyword)}&sort=1">按课程学分从低到高</a></li>
																		<li><a
																			href="${pageContext.request.contextPath}/course/searchCourse?keyword=${fn:escapeXml(param.keyword)}&sort=2">按课程学分从高到低</a></li>


																	</c:if>
																	<c:if test="${param.keyword==null}">
																		<li><a
																			href="${pageContext.request.contextPath}/course/searchCourse?keyword=${fn:escapeXml(param.keyword)}&sort=1">按课程学分从低到高</a></li>
																		<li><a
																			href="${pageContext.request.contextPath}/course/searchCourse?keyword=${fn:escapeXml(param.keyword)}&sort=2">按课程学分从高到低</a></li>


																	</c:if>
																</ul>
															<li class="col-md-2"></li>
														</ul>
													</form>

												</h3>
											</div>
											<div class="panel panel-info">
												<div class="panel-heading">
													<div class="modal-title text-center">
														<h3 class="panel-title">结果如下</h3>
													</div>
												</div>
												<div class="panel-body">

													<c:if test="${!empty searchCourse }">
														<table class="table table-bordered">

															<thead>
																<c:if test="${!empty searchCourse.list }">
																	<tr class="info">
																		<th>课程名&nbsp;</th>
																		<th>课程学期&nbsp;</th>
																		<th>课程专业&nbsp;</th>
																		<th>课程学分&nbsp;</th>
																		<th>课程时间&nbsp;</th>
																		<th>课程周次&nbsp;</th>
																		<th>课程教师&nbsp;</th>
																		<th>课程地点&nbsp;</th>
																	</tr>
																</c:if>
															</thead>

															<tbody>
																<c:forEach items="${searchCourse.list}" var="g"
																	varStatus="vs">
																	<tr>
																		<td>${g.courseName}</td>
																		<td>${g.courseClass}</td>
																		<td>${g.courseRecord}</td>
																		<td>${g.courseScore}</td>
																		<td>${g.courseTime}</td>
																		<td>${g.courseWeek}</td>
																		<td>${g.courseTeacher}</td>
																		<td>${g.courseWhere}</td>
																	</tr>
																</c:forEach>

															</tbody>
														</table>
													</c:if>
													<br> <br>
													<div style="align-content: center">
														<c:if test="${empty searchCourse.list }">搜索课程为空</c:if>
													</div>
													<br> <br>


												</div>

											</div>


										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">选课通知</h3>
											</div>
											<div class="panel-body">
												<img src="${pageContext.request.contextPath}/images/4.png"
													width=20 height=20>2015-2016学期选修结束<br> <img
													src="${pageContext.request.contextPath}/images/5.png"
													width=20 height=20>十月一之后，学校将开启选修课程<br> <img
													src="${pageContext.request.contextPath}/images/6.png"
													width=20 height=20>体育选，正选结束，补选时间待定<br> <img
													src="${pageContext.request.contextPath}/images7.png"
													width=20 height=20>大一新生第一次之后，重新密码<br> <img
													src="${pageContext.request.contextPath}/images/8.png"
													width=20 height=20>十月一之后，学校将开选修课程<br> >>>更多

											</div>

										</div>
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">校历</h3>
											</div>
											<div class="panel-body">
												<img src="${pageContext.request.contextPath}/images/13.png">

											</div>

										</div>
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">学校通知</h3>
											</div>
											<div class="panel-body">
												<marquee direction="up" onmouseleave="start()"
													onmouseenter="stop()" scrolldelay="280">

													<font size="+1" color="#88" size="0.5"></font> <a href="#">2015年程序设计竞赛实验班报名通知</a><br>
													<a href="#">关于中秋国庆假期调停课的通知</a><br> <a>关于2015-2016学年第一学期重修报名...</a><br>
													<a href="#">关于统计2015届毕业生各专业（方向）核...</a> <br> <a
														href="#">关于做好2015-2016学年第一学期考试...</a><br> <a href="#">关于组织课程开放学习及辅修专业学习...</a><br>
												</marquee>


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
									<h3 class="panel-title">学生在线选课系统</h3>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>