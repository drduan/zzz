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
	href="${pageContext.request.contextPath}/css/bootstrap/css/default.css">
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

<script type="text/javascript">
	$(document).ready(
			function() {
				//验证用户名是否可用
				$("#regForm #userName").blur(function() {
					$.post(getContextPath() + "/user/checkStudentName", {
						userName : $("#regForm #userName").val()
					}, function(result) {
						if (result.available) {
							$("#checkNameResult").html("该用户名可用");
						} else {
							$("#checkNameResult").html("对不起，该用户名已被占用，请更换");
						}
					});
				});
				

				
				if (cart.getGoodsList() == false)
					$("#cartBadge").html(0);
				else
					$("#cartBadge").html(cart.getGoodsList().length);

				$.post(getContextPath() + "/cate/getAllCates", null, function(
						result) {
					var cates = result.cates;
					if (cates && cates.length > 0) {
						var cateId = $.getUrlParam("cateId");
						for (var i = 0; i < cates.length; i++) {
							//上方导航下拉菜单-商品分类
							var s = "<li><a href='" + getContextPath()
									+ "/goods/getGoodsByCate?cateId="
									+ cates[i].cateId + "'>"
									+ cates[i].cateName + "</a></li>";
							$("#dropdown_cate").append(s);

							//左侧导航listgroup-商品分类						
							if (i == cateId - 1)
								s = "<a href='" + getContextPath()
										+ "/goods/getGoodsByCate?cateId="
										+ cates[i].cateId
										+ "' class='list-group-item active'>"
										+ cates[i].cateName + "</a>";
							else
								s = "<a href='" + getContextPath()
										+ "/goods/getGoodsByCate?cateId="
										+ cates[i].cateId
										+ "' class='list-group-item '>"
										+ cates[i].cateName + "</a>";
							$("#left_cate").append(s);
						}
					} else {
						$("#dropdown_cate").html("暂无相关信息");
					}

				}, "json");
			});

	function login() {
		var userName = $("#userName").val();
		var userPass = $("#userPass").val();
		$
				.post(
						getContextPath() + "/user/login",
						{
							userName : userName,
							userPass : userPass
						},
						function(result) {
							$('#loginFormModal').modal('hide');
							if (result.login == "yes") {
								//alert("true");
								$("#info")
										.html(
												"<li id='li1'><span>"
														+ userName
														+ "您好，欢迎来到学生选课系统！</span>"
														
														+ "<li><a href='#' onclick='logout()'>退出登录</a></li>");
								
							} else {
								//alert("false");
								$("#msgTitle").html("登录失败");
								$("#msgBody").html("用户名或密码错误");
								$("#msgModal").modal();

							}
						});
	}
	function logout() {
		$
				.post(
						getContextPath() + "/user/logout",
						null,
						function() {
							$("#info")
									.html(
											"<li id='li1'><span>您好，欢迎来到学生选课系统！</span>"
													+ "<a href='#loginFormModal' data-toggle='modal'>[登录]</a>&nbsp;<a href='#regFormModal' data-toggle='modal'>[新用户注册]</a></li>"
													);
							//显示购物车中商品数量
							
						});
	}
	function reg() {
		$.post(getContextPath() + "/user/reg", $('#regForm').serialize(),
				function(result) {
					$('#regFormModal').modal('hide');
					if (result.reg == "yes") {
						$("#msgTitle").html("注册成功");
						$("#msgBody").html("恭喜您，注册成功");
						$("#msgModal").modal();
					} else {
						$("#msgTitle").html("注册失败");
						$("#msgBody").html("对不起，注册失败");
						$("#msgModal").modal();
					}
				});
	}
	function checkLogin(result) {
		if (result.login) {
			//$("#msgTitle").html(result.login);
			//$("#msgBody").html(result.login);
			//$("#msgModal").modal();
			$("#loginFormModal").modal();
			return false;
		}
		return true;
	}

	
	
	
</script>
<body>
<div class="container-fluid">
	<div class="row">

		<div class="col-md-12 text-right">

			<ol class="breadcrumb" id="info">

				<c:if test="${sessionScope['_LOGIN_USER_']==null}">
					<li id="li1"><span>您好，欢迎来到书炉专卖店！</span> <a
						href="#loginFormModal" data-toggle="modal">[登录]</a>&nbsp;<a
						href="#regFormModal" data-toggle="modal">[新用户注册]</a></li>
					
				</c:if>
				<c:if test="${sessionScope['_LOGIN_USER_']!=null}">
					<li id="li1"><span>${sessionScope['_LOGIN_USER_'].userName }您好，欢迎来到书炉专卖店！</span>
					
					<li><a href="#" onclick="logout()">退出登录</a></li>
				</c:if>
			</ol>

		</div>

		
	</div>
	
	<div class="container-fluid" >
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
											<li role="presentation"><a href="index.jsp"
												class="btn btn-info">主页</a></li>

											<li role="presentation"><a href="findCourse.jsp">课程查询</a></li>
											<li role="presentation"><a href="addCourse.jsp">课程添加</a></li>
											<li role="presentation"><a href="addCoursetype.jsp">课程类别添加</a></li>
											<li role="presentation"><a href="addCourse1.jsp">选课</a></li>
											<li role="presentation"><a href="ours.jsp">联系我们</a></li>
											<div class="collapse navbar-collapse"
												id="bs-example-navbar-collapse-1">

												<form class="navbar-form navbar-right" role="search">
													<div class="form-group">
														<input type="text" class="form-control" />
													</div>
													<button type="submit" class="btn btn-default">查找</button>
												</form>

											</div>
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
												<a href="12.jsp" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
													<br>学生资料
												</a> <a href="13.jsp" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
													<br>学期成绩
												</a> <a href="14.jsp" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-star-empty"
													aria-hidden="true"></span> <br>学期课表
												</a> <a href="15.jsp" class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-th-large"
													aria-hidden="true"></span> <br>所有课程
												</a> <a href="1.jsp" class="btn btn-default" type="button">

													<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
													<br>退出系统
												</a>
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
										<div class="carousel slide" id="carousel-630680">
											<ol class="carousel-indicators">
												<li class="active" data-slide-to="0"
													data-target="#carousel-630680"></li>
												<li data-slide-to="1" data-target="#carousel-630680"></li>
												<li data-slide-to="2" data-target="#carousel-630680"></li>
											</ol>
											<div class="carousel-inner">
												<div class="item active">
													<img src="${pageContext.request.contextPath}/images/9.jpg" />
													<div class="carousel-caption"></div>
												</div>
												<div class="item">
													<img alt="Carousel Bootstrap Second"
														src="${pageContext.request.contextPath}/images/10.jpg" />
													<div class="carousel-caption"></div>

												</div>
												<div class="item">
													<img alt="Carousel Bootstrap Third"
														src="${pageContext.request.contextPath}/images/11.png" />
													<div class="carousel-caption"></div>
												</div>
											</div>
											<a class="left carousel-control" href="#carousel-630680"
												data-slide="prev"><span
												class="glyphicon glyphicon-chevron-left"></span></a> <a
												class="right carousel-control" href="#carousel-630680"
												data-slide="next"><span
												class="glyphicon glyphicon-chevron-right"></span></a>
										</div>
										<h3>
											<span class="glyphicon glyphicon-tree-deciduous"
												aria-hidden="true"></span>学院公告
										</h3>
										<hr />
										<div class="row">
											<div class="col-md-6">
												<ul>
													<li>青协陪你过中秋</li>
													<li>“中秋路边天文夜”来啦(づ￣ 3￣)づ</li>
													<li>大学生创业中心（sovo）纳新了！</li>
													<li>大连实干者科技有限责任公司</li>
													<li>方舟工作室面向全校纳新</li>
													<li>索尼公司吴永波老师-摄像主题讲座~</li>

												</ul>
											</div>
											<div class="col-md-6">
												<ul>
													<li>“年轻就要不一Young”</li>
													<li>大连东软Mac4me苹果电脑88折抢购</li>
													<li>【抢票】中国礼仪教授第一人、“人大名嘴”金正昆做客日新讲坛</li>
													<li>SOVO品牌管理部纳新</li>
													<li>2015年中国电信东软合约计划</li>
													<li>2016春季赴日留学</li>

												</ul>
											</div>
										</div>
										<h3>
											<span class="glyphicon glyphicon-education"
												aria-hidden="true"></span>作息时间
										</h3>
										<hr />
										<img src="${pageContext.request.contextPath}/images/12.png">
									</div>
									<div class="col-md-3">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">选课通知</h3>
											</div>
											<div class="panel-body">
												<img src="${pageContext.request.contextPath}/images/4.png" width=20 height=20>2015-2016学期选修结束<br>
												<img src="${pageContext.request.contextPath}/images/5.png" width=20 height=20>十月一之后，学校将开启选修课程<br>
												<img src="${pageContext.request.contextPath}/images/6.png" width=20 height=20>体育选，正选结束，补选时间待定<br>
												<img src="${pageContext.request.contextPath}/images/7.png" width=20 height=20>大一新生第一次之后，重新密码<br>
												<img src="${pageContext.request.contextPath}/images/8.png" width=20 height=20>十月一之后，学校将开选修课程<br>
												>>>更多

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
												<marquee direction="up">

													<font color="#88" size="+1"> 2015年程序设计竞赛实验班报名通知<br>
														关于中秋国庆假期调停课的通知<br> 关于2015-2016学年第一学期重修报名...<br>
														关于统计2015届毕业生各专业（方向）核...<br> 关于做好2015-2016学年第一学期考试...<br>
														关于组织课程开放学习及辅修专业学习...<br>
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

	<%@include file="loginFormModal.jsp"%>

	<%@include file="msgModal.jsp"%>

	<%@include file="regFormModal.jsp"%>

	
</div>
</body>