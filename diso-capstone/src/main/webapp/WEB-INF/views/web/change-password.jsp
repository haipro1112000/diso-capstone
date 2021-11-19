<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<body>
	<c:url var="changePwAction" value="/change-password" />

	<form:form method="post" action="${ changePwAction }"
		modelAttribute="user"
		style="width:300px;margin-left: 300px; margin-top: 100px;">
		
		
		<h1>${ error }</h1>
		<div class="control-group">
			<label class="control-label" for="inputPassword">Mật Khẩu Cũ </label>
			<div class="controls">
				<form:input type="password" id="inputPassword" cssClass="form-control" required="required"
					path="password" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputNPassword">Mật Khẩu Mới </label>
			<div class="controls">

				<form:input type="password" id="inputNPassword" cssClass="form-control" required="required"
					path="newPassword" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputCPassword">Xác Nhận Mật Khẩu </label>
			<div class="controls">

				<form:input type="password" id="inputCPassword" cssClass="form-control" required="required"
					path="confirmPassword" />
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="submit" value="Doi mat khau" />
			</div>
		</div>
	</form:form>

</body>