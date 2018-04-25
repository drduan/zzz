<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="regFormModal" role="dialog"
	aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button"
					data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">新用户注册</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="regForm" method="post">
					<div class="form-group">

							<label for="userName" class="col-sm-3 control-label"> 用户名
							</label>
							<div class="col-sm-9">
								<input type="text" name="userName" id="userName"
									class="form-control"  placeholder="用户名"
							required /> <span id="checkNameResult"></span>
							</div>
						</div>
						<div class="form-group">

							<label for="userPass" class="col-sm-3 control-label"> 密
								&nbsp;码 </label>
							<div class="col-sm-9">
								<input type="password" 
									class="form-control" name="userPass" id="userPass"  required />
							</div>
						</div>
						<div class="form-group">

							<label for="userRecord" class="col-sm-3 control-label"> 学
								&nbsp;历 </label>
							<div class="col-sm-9">
								<input type="text" 
									class="form-control" name="userRecord" id="userRecord"  required />
							</div>
						</div>
						<div class="form-group">

							<label for="userPhone" class="col-sm-3 control-label"> 电
								&nbsp;话 </label>
							<div class="col-sm-9">
								<input type="text" 
									class="form-control" name="userPhone" id="userPhone"  required />
							</div>
						</div>
						<div class="form-group">

							<label for="userBrithday" class="col-sm-3 control-label"> 生
								&nbsp;日 </label>
							<div class="col-sm-9">
								<input type="text" 
									class="form-control" name="userBrithday" id="userBrithday"  required />
							</div>
						</div>
						<div class="form-group">

							<label for="userBrithday" class="col-sm-3 control-label"> 入学时间 </label>
							<div class="col-sm-9">
								<input type="text" 
									class="form-control" name="userBrithday" id="userBrithday"  required />
							</div>
						</div>
				</form>

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" onclick="reg()">注册</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>

			</div>
		</div>

	</div>

</div>