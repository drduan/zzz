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
<title>查看留言</title>
<script type="text/javascript">
	$(
			function() {
				$('body')
						.on(
								'click',
								'button[name="readLe"]',
								function() {
									$
											.post(
													"${pageContext.request.contextPath}/admin/user/readLevMG",
													{
														"levID" : this.id
													},
													function(result) {
														if (result.flag) {
															initData(result.list);
														}
													})
								})
				$('body')
						.on(
								'click',
								'button[name="delLe"]',
								function() {
									$
											.post(
													"${pageContext.request.contextPath}/admin/user/delLevMG",
													{
														"levID" : this.id
													},
													function(result) {
														if (result.flag) {
															initData(result.list);
														}
													})
								})
				function initData(list) {
					$("#levMgTB").empty();
					for ( var i in list) {
						var statu = '未读';
						var options = "<button class='btn btn-default btn-xs' id='"+list[i].levID+"' name='readLe'>标记已阅</button>"
								+ "<button class='btn btn-default btn-xs' id='"+list[i].levID+"' name='delLe'>删除</button>";
						if (list[i].levFlag == 1) {
							statu = '已读';
							options = "<button class='btn btn-default btn-xs' id='"+list[i].levID+"' name='delLe'>删除</button>";
						}
						var tr = "<tr><td>" + (i + 1) + "</td><td>"
								+ list[i].s_id + "</td><td>" + list[i].levName
								+ "</td><td>" + list[i].levEmail + "</td><td>"
								+ list[i].levCon + "</td><td>"
								+ list[i].levTime + "</td><td>" + statu
								+ "</td><td>" + options + "</td></tr>"
						$("#levMgTB").append(tr);
					}
				}
			})
</script>
</head>
<body>
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
									---留言管理
								</div>
								<div class="col-md-4"></div>
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
										href="${pageContext.request.contextPath}/admin/course/getAdminCourse"
										class="btn">课程管理</a></li>
									<li role="presentation"><a href="#" class="btn btn-info">留言管理</a></li>
									<li role="presentation"><a
										href="${pageContext.request.contextPath}/admin/takecourse/getAdminTakeCourse">选课课程管理</a></li>

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
													<h3 class="panel-title" id="nav7">留言列表</h3>
												</div>
												<div class="col-md-9">
													<form class="form-inline" role="form" id="searchForm"
														method="post"
														action="${pageContext.request.contextPath}/admin/takecourse/getAdminTakeCourse">

														<div class="col-md-7">
															<div class="form-group">
																<label for="takecourseName"> 留言内容</label> <input
																	class="form-control input-sm" name="takecourseName"
																	id="takecourseName" value="${param.takecourseName}"
																	type="text" placeholder="留言内容" />
															</div>
															<button class="btn btn-info btn-sm" type="submit">搜索</button>
														</div>
														<div class="col-md-5"></div>
													</form>
												</div>

											</div>
										</div>
										<div class="panel-body">

											<div>
												<!-- Default panel contents -->
												<div class="row">
													<div class="panel-heading">
														<a class="btn btn-default"
															href="javascript:history.go(-1)">返回</a>
														<h3>查看留言</h3>
													</div>

													<!-- Table -->
													<table class="table table-bordered table-hover">
														<thead>
															<tr>
																<th>#</th>
																<th>用户名</th>
																<th>姓名</th>
																<th>邮箱</th>
																<th>留言内容</th>
																<th>时间</th>
																<th>状态</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody id="levMgTB">
															<c:if test="${_LEVMESSAGE_!=null}">
																<c:forEach items="${_LEVMESSAGE_}" var="i"
																	varStatus="ii">
																	<tr>
																		<th>${ii.count}</th>
																		<td>${i.s_id}</td>
																		<td>${i.levName}</td>
																		<td>${i.levEmail}</td>
																		<td>${i.levCon}</td>
																		<td>${i.levTime}</td>
																		<td><c:if test="${i.levFlag==0}">未读</c:if> <c:if
																				test="${i.levFlag==1}">已阅读</c:if></td>
																		<td><c:if test="${i.levFlag==0}">
																				<button class="btn btn-default btn-xs"
																					id="${i.levID}" name="readLe">标记已阅</button>
																			</c:if>
																			<button class="btn btn-default btn-xs"
																				id="${i.levID}" name="delLe">删除</button></td>
																	</tr>
																</c:forEach>
															</c:if>
														</tbody>
													</table>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>


						</div>

					</div>


				</div>


			</div>

		</div>
</body>
</html>