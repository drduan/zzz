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
<title>主页</title>
<script type="text/javascript">
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
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/index.jsp"
												class="btn btn-info">主页</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/takecourse/getTakeCourse">选课</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/searchCourse.jsp">搜索课程</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/course/getAllCourse">学校所有课程</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/news/getNews">选课相关通知</a></li>
											<li role="presentation"><a href="${pageContext.request.contextPath}/view/ours.jsp">留言区</a></li>
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
</body>
</html>