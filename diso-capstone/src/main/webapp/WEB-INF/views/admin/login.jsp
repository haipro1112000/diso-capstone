<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<body>
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Đăng Nhập</div>
			<div class="card-body">
			
				<form method="POST" action="<c:url value="/loginAdmin"/>">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="inputEmail"
								class="form-control" placeholder="Email address"
								required="required" autofocus="autofocus" name="userName" />
							<label for="inputEmail">Tên tài khoản</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input  type="password" id="inputPassword"
								class="form-control" placeholder="Password" required="required" name="password" />
							<label for="inputPassword">Mật khẩu</label>
						</div>
					</div>

					<input type="submit" class="btn btn-primary btn-block"
						value="Đăng nhập" />
						<br>
					<c:if test="${ not empty status }">
						<div class="alert alert-danger" style="padding: 0.4rem 0.6rem">
							${ status }
						</div>
					</c:if>
				</form>
				<div class="text-center">
				
					<a class="d-block small mt-3" href="<c:url value="/loginAdmin/forgot-password"/>">Quên mật khẩu?</a>
				</div>
			</div>
		</div>
	</div>
</body>