<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<body>
	<c:url var="loginAction" value="/login" />

	<form:form method="post" action="${ loginAction }"
		modelAttribute="user"
		style="width:300px;margin-left: 300px; margin-top: 100px;">
		<c:if test="${ not empty status }">
			<h1>${ status }</h1>
		</c:if>
		
		<div class="control-group">
			<label class="control-label" for="inputUserName"><spring:message code="label.username"/> </label>
			<div class="controls">
				<form:input type="text" id="inputUserName" cssClass="form-control" 
					path="userName" />
			
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputPassword">Mật Khẩu  </label>
			<div class="controls">
				<form:input type="password" id="inputPassword" cssClass="form-control" required="required"
					path="password" />
					
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="submit" value="Đăng Nhập" />
			</div>
		</div>
	</form:form>

</body>