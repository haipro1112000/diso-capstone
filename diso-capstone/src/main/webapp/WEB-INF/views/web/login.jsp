<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Đăng Nhập</title>
</head>
<%-- <body>
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

</body> --%>
<section class="sign-in">
	<div class="container-signup">
		<div class="signin-content">
			<div class="signin-image">
				<%-- <c:url value='/template/user/assets/img/signin-image.jpg'/> --%>
				<figure>
					<img
						src="<c:url value='/template/user/assets/img/signin-image.jpg'/>"
						alt="sing up image">
				</figure>

				<a href="<c:url value='/register'/>" class="signup-image-link">Tạo
					tài khoản</a>
			</div>

			<div class="signin-form">
				<h2 class="form-title">Đăng Nhập</h2>
				<c:url var="loginAction" value="/login" />
				<form:form method="POST" class="register-form" id="login-form "
					action="${ loginAction }" modelAttribute="user">
					<div class="form-group">
						<label for="your_name"><i class="bi bi-person-fill"></i></label>
						<form:input type="text" path="userName" id="your_name"
							placeholder="Tên tài khoản" />
					</div>
					<div class="form-group">
						<label for="your_pass"><i class="bi bi-lock-fill"></i></label>
						<form:input type="password" path="password" id="your_pass"
							placeholder="Mật khẩu" />
					</div>
					<c:if test="${ not empty status }">
						<div class="alert alert-danger" style="padding: 0.4rem 0.6rem">
							${ status }
						</div>
					</c:if>
					<div class="form-group form-button">
						<input type="submit" name="signin" id="signin" class="form-submit"
							value="Đăng Nhập" />
					</div>
					
					<a href="<c:url value='/forgot-password'/>">Quên mật khẩu ?</a>
				</form:form>
			</div>
		</div>
	</div>
</section>