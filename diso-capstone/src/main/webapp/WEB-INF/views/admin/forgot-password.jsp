<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<body>
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Quên Mật khẩu</div>
			<div class="card-body">
				<div class="text-center mb-4">
					<h4>Bạn quên mật khẩu?</h4>
					<p>Nhập Email của bạn để chúng tôi gửi mã xác nhận </p>
				</div>
				
				<form method="POST" action="<c:url value="/loginAdmin/forgot-password"/>">
					<div class="form-group">
						<div class="form-label-group">
							<input type="email" id="inputEmail" class="form-control"
								placeholder="Enter email address" required="required"
								autofocus="autofocus" name="email"> <label for="inputEmail">Email</label>
						</div>
					</div>
					<br>
					<c:if test="${ not empty status }">
						<div class="alert alert-danger" style="padding: 0.4rem 0.6rem">
							${ status }
						</div>
					</c:if>
					<input type="submit" class="btn btn-primary btn-block" value="Gửi" />
				</form>
				<br>
				<div class="text-center">
					<a class="d-block small" href="<c:url value="/loginAdmin"/>">Đăng nhập</a>
				</div>
			</div>
		</div>
	</div>
</body>