<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Tìm Mật Khẩu</title>
</head>
<body>
	<c:url var="forgotPasswordAction" value="/forgot-password" />
	<%--
	
	<c:if test="${ not empty status }">
			<h1>${ status }</h1>
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
 --%>
	<section class="sign-in">
		<div class="container-signup">
			<div class="signin-content">
				<div class="signin-image">
					<figure>
						<img
							src="<c:url value='/template/user/assets/img/signin-image.jpg'/>"
							alt="sing up image">
					</figure>
					<a href="<c:url value='/login'/>" class="signup-image-link">Đăng nhập</a>
				</div>

				<div class="signin-form">
					<h2 class="form-title">Quên mật khẩu</h2>
					<form:form class="register-form" method="post"
						action="${ forgotPasswordAction }" modelAttribute="user">
						<div class="form-group">
							<label for="your_name"><i class="bi bi-person-fill"></i></label>
							<form:input type="text" path="userName" id="your_name"
								placeholder="Tên tài khoản" />
						</div>
						<div class="form-group">
							<label for="email"><i class="bi bi-envelope-fill"></i></label>
							<form:input type="email" path="email" id="email"
								placeholder="Email" />
						</div>
						<c:if test="${ not empty status }">
							<div class="alert alert-danger" style="padding: 0.4rem 0.6rem">
								${ status }</div>
						</c:if>
						<div class="form-group form-button">
							<input type="submit" name="signin" id="signin"
								class="form-submit" value="Xác Nhận" />
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>

