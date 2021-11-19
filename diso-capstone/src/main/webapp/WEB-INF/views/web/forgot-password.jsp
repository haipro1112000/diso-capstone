<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<body>
	<c:url var="forgotPasswordAction" value="/forgot-password" />
	<c:if test="${ not empty status }">
			<h1>${ status }</h1>
	</c:if>
	<c:if test="${ not empty error }">
			<h1>${ error }</h1>
	</c:if>
	<form:form method="post" action="${ forgotPasswordAction }"
		modelAttribute="user"
		style="width:300px;margin-left: 300px; margin-top: 100px;">
	
		<div class="control-group">
			<label class="control-label" for="inputEmail">username </label>
			<div class="controls">
				<form:input type="text" id="inputFname" cssClass="form-control"
					path="userName" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Email </label>
			<div class="controls">

				<form:input type="email" id="inputFname" cssClass="form-control"
					path="email" />
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="submit" value="Xac nhan" />
			</div>
		</div>
	</form:form>

</body>

