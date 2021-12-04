<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Đăng Ký</title>
</head>
<%-- <body>
	<c:url var="registerAction" value="/register" />
	<c:if test="${ status }">
		<h1>${ status }</h1>
	</c:if>
	<form:form method="post" action="${ registerAction }"
		modelAttribute="user"
		style="width:300px;margin-left: 300px; margin-top: 100px;">
		<div class="control-group">
			<label class="control-label" for="inputFname">First name <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputFname" cssClass="form-control" 
					path="firstName" required="required"/>
			
			</div>
			<label class="control-label" for="inputLname">Last name <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputLname" cssClass="form-control"  
					path="lastName" required="required"/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputEmail">username <sup>*</sup></label>
			<div class="controls">
				<form:input type="text" id="inputFname" cssClass="form-control" 
					path="userName" required="required"/>
	
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Password <sup>*</sup></label>
			<div class="controls">
				<form:input type="password" id="inputFname" cssClass="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				 title="Mật khẩu phải gồm chữ HOA, chữ thường và số" 
					path="password" required="required" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputEmail">Email <sup>*</sup></label>
			<div class="controls">

				<form:input type="emai" id="inputEmail" cssClass="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
					title="Email không hợp lệ. vui lòng nhập lại"
					path="email" required="required"/>
				
			</div>
		</div>
		
		<div class="control-group">
			<div class="controls">
				<input type="submit" value="Đăng ký" />
			</div>
		</div>
	</form:form>

</body> --%>
<c:if test="${ not empty status }">
	<h1>${ status }</h1>
</c:if>
<section class="signup">

	<div class="container-signup">
		<div class="signup-content">
			<div class="signup-form">
				<h2 class="form-title">Đăng Kí</h2>
				<c:url var="registerAction" value="/register" />
				<form:form method="POST" class="register-form" id="register-form"
					action="${ registerAction }" modelAttribute="user">
					<div class="form-group">
						<label for="name"><i class="bi bi-person-fill"></i></label>
						<form:input type="text" path="firstName" id="name"
							placeholder="Họ và tên đệm" />
					</div>
					<div class="form-group">
						<label for="name"><i class="bi bi-person-fill"></i></label>
						<form:input type="text" path="lastName" id="name"
							placeholder="Tên" />
					</div>
					<div class="form-group">
						<label for="name"><i class="bi bi-person-fill"></i></label>
						<form:input type="text" path="userName" id="name" pattern="^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$"
							title="Tên Đăng Nhập không hợp lệ"
							placeholder="Tên tài khoản" />
					</div>
					<div class="form-group">
						<label for="pass"><i class="bi bi-lock-fill"></i></label>
						<form:input type="password" path="password" id="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				 title="Mật khẩu phải ít nhất 8 ký tự gồm chữ HOA, chữ thường và số" 
							placeholder="Mật khẩu" />
					</div>
					<div class="form-group">
						<label for="re-pass"><i class="bi bi-lock"></i></label>
						<form:input type="password" path="confirmPassword" id="re_pass"
							placeholder="Nhắc lại mật khẩu" />
					</div>
					<div class="form-group">
						<label for="email"><i class="bi bi-envelope-fill"></i></label>
						<form:input type="email" path="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
							title="Email không hợp lệ. vui lòng nhập lại"
							placeholder="Email" />
					</div>
					<div class="form-group form-button">
						<input type="submit" name="signup" id="signup" class="form-submit"
							value="Đăng kí" />
					</div>
				</form:form>
				<c:if test="${ not empty status }">
					<h1>${ status }</h1>
				</c:if>
			</div>
			<div class="signup-image">
				<figure>
					<img
						src="<c:url value="/template/user/assets/img/signup-image.jpg"/>"
						alt="sing up image">
				</figure>
				
				<a href="<c:url value="/login"/>" class="signup-image-link">Đã có tài khoản
					! </a>
			</div>
		</div>
	</div>
</section>