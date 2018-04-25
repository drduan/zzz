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
<title>选课课程管理-操作选课课程</title>

<script type="text/javascript">
$(document).ready(function() {
	// make code pretty
	window.prettyPrint && prettyPrint();
	
	if ( window.location.hash ) {
		scrollTo(window.location.hash);
	}
	
	$('.nav').on('click', 'a', function(e) {
		scrollTo($(this).attr('href'));
	});		

	$('#undo_redo').multiselect({
		keepRenderingSort: true
	});

	$('#undo_redo').multiselect();
	$('#undo_redo2').multiselect();
});

function scrollTo( id ) {
	if ( $(id).length ) {
		$('html,body').animate({scrollTop: $(id).offset().top - 40},'slow');
	}
}
function check(){
	if($("select[name='teacherIds']").children().teacher()==0){
		showMsgModal("提示","请选择选课教师");
		return false;
	}
	else{
		$("select[name='teacherIds']").children().attr("selected","selected");
	}
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
							<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active">
		  	<a href="#">管理选课教师</a>	  
		  </li>

		  <li role="presentation" >
		  	<a href="${pageContext.request.contextPath}/admin/takecourse/handleCourseTeacher?takecourseId=${takecourseId}">管理商品颜色</a>
		  </li>
		  
		</ul>



          
          <div class="col-sm-12  col-md-12 ">
            <c:if test="${!empty takecourseTeacher.teacher }">
            	<p>商品尺寸信息：
	            <c:forEach items="${takecourseTeacher.teacher }" var="s">
	  				${fn:escapeXml(s.teacherName)} 
				</c:forEach>
				</p>
			</c:if>
			<c:if test="${empty takecourseTeacher.teacher }">
				<h2>暂无商品尺寸信息</h2>
			</c:if>
			<form class="form" role="form"  method="post" onsubmit="return check()" action="${pageContext.request.contextPath}/admin/takecourse/doHandleCourseTeacher">
	            <input type="hidden" name="takecourseId" value="${takecourseId}"/>
	            <div class="form-group">
	            <div class="row">
				<div class="col-xs-5">
					<select name="from" id="undo_redo" class="form-control" size="15" multiple="multiple">
						<c:forEach items="${teacher}" var="s">
							<option value="${s.teacherId }">${fn:escapeXml(s.teacherName) }</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="col-xs-2">
					<button type="button" id="undo_redo_undo" class="btn btn-primary btn-block">undo</button>
					<button type="button" id="undo_redo_rightAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-forward"></i></button>
					<button type="button" id="undo_redo_rightSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
					<button type="button" id="undo_redo_leftSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
					<button type="button" id="undo_redo_leftAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-backward"></i></button>
					<button type="button" id="undo_redo_redo" class="btn btn-warning btn-block">redo</button>
				</div>

				
				<div class="col-xs-5">
					<select name="sizeIds" id="undo_redo_to" class="form-control" size="15" multiple="multiple">
						<c:forEach items="${takecourseTeacher.teacher }" var="s">
							<option value="${s.teacherId }" >${fn:escapeXml(s.teacherName)}</option>			  				
						</c:forEach>
					</select>
				</div>
				</div>
	            </div>	
				<div class="form-group">
				<button class="btn btn-primary" type="submit" >提交商品尺寸更新</button>
				<button class="btn btn-primary" id="back" type="button" onclick="javascript:location.href='<%=CommonBaseAction.getFullReferUrl()%>'">返回列表</button>
				</div>
			</form>
		   </div>
		   

        </div>
						</div>
					</div>
</body>
</html>