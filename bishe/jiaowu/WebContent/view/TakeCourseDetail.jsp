<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/carousel.css"
	rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/js/functions.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<title>选课</title>
<script type="text/javascript">
		/*全局变量*/
		
		$(document).ready(
				function() {
					
					
					$("[name='whereButton']").click(function() {
						$(this).siblings().removeClass("btn-info");
						$(this).addClass("btn-info");
						var where = $(this).html();
						$("#where").val(where);
					});
					$("[name='teacherButton']").click(function() {
						$(this).siblings().removeClass("btn-info");
						$(this).addClass("btn-info");
						var teacher = $(this).html();
						$("#teacher").val(teacher);
					});
					
				});

			
		//将商品加入到购物车
		function add() {
			var num = $("#num").val();
			var btn = $(".btn-info");
			var where, teacher;
			for (var i = 0; i < btn.length; i++) {
				if ($(btn[i]).attr("name") == "whereButton")
					where = $(btn[i]).html();
				else if ($(btn[i]).attr("name") == "teacherButton")
					color = $(btn[i]).html();
			}
			addCart(num, where, teacher);
			$("#cartBadge").html(cart.getGoodsList().length);
		}
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
												---选课
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
											<li role="presentation"><a href="${pageContext.request.contextPath}/takecourse/getTakeCourse" class="btn btn-info">选课</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/searchCourse.jsp">搜索课程</a></li>
											
											<li role="presentation"><a href="${pageContext.request.contextPath}/course/getAllCourse">学校所有课程</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/news/getNews">选课相关通知</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/ours.jsp">留言板</a></li>
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
												<h3 class="panel-title">可选课程</h3>
											</div>
											<form class="form-inline" role="form"
						action="${pageContext.request.contextPath}/takecourse/addSuccessTakeCourse"
						method="post">
											<input type="hidden" name="takecourseId" id="takecourseId"
												value="${fn:escapeXml(takecourseDetail.takecourseId)}" />
												<input type="hidden" name="userId" id="userId"
												value="${sessionScope['_LOGIN_USER_'].userId }" />
											<input type="hidden" id="courseName"
												name="courseName" value="${fn:escapeXml(takecourseDetail.takecourseName)}" />
												<input type="hidden" id="courseClass"
												name="courseClass" value="${fn:escapeXml(takecourseDetail.takecourseClass)}" /> 
											<input
												type="hidden" name="courseRecord" id="courseRecord"
												value="${fn:escapeXml(takecourseDetail.takecourseRecord)}" /> 
											<input type="hidden" id="courseScore"
												name="courseScore" value="${fn:escapeXml(takecourseDetail.takecourseScore)}" />
											<input type="hidden" name="courseWeek" id="courseWeek"
												value="${fn:escapeXml(takecourseDetail.takecourseWeek)}" />
											<input type="hidden" name="courseTime" id="courseTime"
												value="${fn:escapeXml(takecourseDetail.takecourseTime)}" />
												
											<c:if
												test="${ !empty takecourseTeacher}">

												<div class="panel col-md-offset-1">
													<!-- Default panel contents -->




													<p>
														
													<%-- <div class="btn-group" role="group">
														<c:forEach items="${takecourseWhere.where }" var="s"
															varStatus="vs">
															<c:if test="${vs.first }">
																<input type="hidden" name="where" id="where"
																	value="${s.whereName}" />

															</c:if>
															<button type="button"
																class="btn btn-default ${vs.first?'btn-info':'' }"
																name="whereButton">${s.whereName}</button>
														</c:forEach>
													</div>
													</p> --%>
													<p>
														<label>任课教师教师与上课地点选择：</label>
													<div class="btn-group" role="group">
														<c:forEach items="${takecourseTeacher.teacher }" var="c"
															varStatus="vs">
															<c:if test="${vs.first }">
																<input type="hidden" name="courseTeacher" id="courseTeacher"
																	value="${fn:escapeXml(c.teacherName)}" />
																<input type="hidden" name="courseWhere" id="courseWhere"
																	value="${fn:escapeXml(c.teacherWhere)}" />
																	

															</c:if>
															<button type="button"
																class="btn btn-default ${vs.first?'btn-info':'' }"
																name="teacherButton">${fn:escapeXml(c.teacherName)}${fn:escapeXml(c.teacherWhere)}</button>
																<%-- <button type="button"
																class="btn btn-default ${vs.first?'btn-info':'' }"
																name="whereButton">${s.whereName}</button> --%>
														</c:forEach>
													</div>
													</p>


													<!-- <p>
											<button class="btn btn-primary btn-sm" type="submit">
												立即购买</button>
											<button class="btn btn-primary btn-sm" type="button"
												onclick="add()">加入购物车</button>
										</p> -->

												</div>
												

												<!-- List group -->


											</c:if>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info " type="submit">
												选择</button>
											</form>
										</div>
										<hr>
										<!-- <div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">已选课程</h3>
											</div>
											<div class="panel-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>课程名</th>
															<th>老师</th>
															<th>上课时间</th>
															<th>状态</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>网球</td>
															<td>李丹</td>
															<td>16周</td>
															<td><a href="2.html" class="btn btn-default"
																type="button"> 删除</a></td>
														</tr>
														<tr class="active">
															<td>体操</td>
															<td>杨帅</td>
															<td>13周</td>
															<td><a href="2.html" class="btn btn-default"
																type="button"> 删除</a>
														</tr>

														<tr class="warning">
															<td>跳远</td>
															<td>李红</td>
															<td>16周</td>
															<td><a href="2.html" class="btn btn-default"
																type="button"> 删除</a></td>
														</tr>

													</tbody>
												</table>
											</div>

										</div> -->
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
													src="${pageContext.request.contextPath}/images/7.png"
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
									<h3 class="panel-title">学生在线选课系统 </h3>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>