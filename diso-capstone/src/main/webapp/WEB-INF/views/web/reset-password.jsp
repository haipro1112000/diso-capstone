<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<head>
	<title>Tạo mật khẩu</title>
</head>
<body>
	<c:url var="resetPwAction" value="/reset-password" />
	<%-- <c:if test="${ not empty status }">
		<h1>${ status }</h1>
	</c:if> --%>
	<%-- <form:form method="post" action="${ resetPwAction }"
		modelAttribute="user"
		style="width:300px;margin-left: 300px; margin-top: 100px;">
		
		
		<h1>${ error }</h1>
		<div class="control-group">
			<label class="control-label" for="inputVerify">Mã Xác Nhận </label>
			<div class="controls">
				<input type="text" id="inputVerify" class="form-control" required="required"
					name="verify" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputNPassword">Mật Khẩu Mới </label>
			<div class="controls">

				<form:input type="password" id="inputNPassword" cssClass="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				 title="Mật khẩu phải gồm chữ HOA, chữ thường và số"  
					path="newPassword" required="required" />
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
	</form:form> --%>
	<section class="sign-in">
    <div class="container-signup">
      <div class="signin-content">
        <div class="signin-image">
          <figure><img src="<c:url value='/template/user/assets/img/signin-image.jpg'/>" alt="sing up image"></figure>
          
          <a href="<c:url value='/login'/>" class="signup-image-link">Đăng nhập</a>
        </div>

        <div class="signin-form">
          <h2 class="form-title">Tạo mật khẩu mới</h2>
          <form:form method="POST" class="register-form" action="${ resetPwAction }"
					modelAttribute="user">
            <div class="form-group">
              <label for="your_pass"><i class="bi bi-lock-fill"></i></label>
              <input type="text" name="verify" id="your_pass" placeholder="Mã xác nhận" />
            </div>
            <div class="form-group">
              <label for="your_pass"><i class="bi bi-lock-fill"></i></label>
              <form:input type="password" path="newPassword" id="your_pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				 title="Mật khẩu phải gồm 8 ký tự (chữ HOA, chữ thường và số)"   placeholder="Mật khẩu mới" />
            </div>
            <div class="form-group">
              <label for="your_pass"><i class="bi bi-lock-fill"></i></label>
              <form:input type="password" path="confirmPassword" id="your_pass" placeholder="Nhập lại mật khẩu mới" />
            </div>
            <c:if test="${ not empty status }">
							<div class="alert alert-danger" style="padding: 0.4rem 0.6rem">
								${ status }</div>
						</c:if>
            <div class="form-group form-button">
              <input type="submit" name="signin" id="signin" class="form-submit" value="Xác Nhận" />
            </div>
          </form:form>
        </div>
      </div>
    </div>
  </section>

</body>
