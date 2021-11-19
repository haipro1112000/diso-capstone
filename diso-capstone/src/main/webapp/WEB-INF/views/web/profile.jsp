<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<body>
	<%-- <h3>Ten : ${ profile.firstName } ${ profile.lastName }</h3>
	<h3>Dia Chi : ${ profile.address } </h3>
	<h3>So DIen Thoai : ${ profile.phone }</h3>
	<h3>Email : ${ profile.email }</h3>
	<a href="<c:url value="/profile/edit/${ loginInfo.id }"/>">Edit</a> 
	<a href="<c:url value="/change-password"/>">Doi mat khau</a> --%>
	<div class="container light-style flex-grow-1 container-p-y">

		<h4 class="font-weight-bold py-3 mb-4">TÀI KHOẢN</h4>

		<c:if test="${not empty status}">
			<h1>${status}</h1>
		</c:if>
		
		<div class="card overflow-hidden">
			<div class="row no-gutters row-bordered row-border-light">
				<div class="col-md-3 pt-0">
					<div class="list-group list-group-flush account-settings-links">
						<a class="list-group-item list-group-item-action active"
							data-toggle="list" href="#account-general">Thông tin chung</a> <a
							class="list-group-item list-group-item-action "
							data-toggle="list" href="#account-change-password">Đổi mật
							khẩu</a>

					</div>
				</div>
				<div class="col-md-9">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="account-general">
							<div class="card-body media align-items-center">
								<img src="" alt="" class="d-block ui-w-80">
								<div class="media-body ml-4">
									<label for="file" class="btn-upload-avt btn-outline-primary">
										Tải ảnh lên <input type="file"
										class="account-settings-fileinput" name="image-avt" id=file
										onchange="loadFile(event)">
									</label> &nbsp;
									<button type="button" class="btn-reset-avt btn-outline-primary">Reset</button>

								</div>
							</div>
							<hr class="border-light m-0">

							<div class="card-body">
								<c:url var="editProfile" value="/edit/status"/>
								
								<form:form method="post" action="${ editProfile }" modelAttribute="user">
									<form:hidden path="id" value="${ loginInfo.id }"/>
									<div class="form-group">
										<label class="form-label">Họ</label> <form:input type="text" value="${ loginInfo.firstName }"
											class="form-control" placeholder="Nhập họ và tên đệm" path="firstName"/>
									</div>
									<div class="form-group">
										<label class="form-label">Tên</label> <form:input type="text" value="${ loginInfo.lastName }"
											class="form-control" placeholder="Nhập tên" path="lastName"/>
									</div>
									<div class="form-group">
										<label class="form-label">Số điện thoại</label> <form:input
											type="tel" class="form-control" maxlength="11" value="${ loginInfo.phone }"
											placeholder="Số điện thoại" path="phone"/>
									</div>
									<div class="form-group">
										<label class="form-label">Địa chỉ</label> <form:input type="text" value="${ loginInfo.address }"
											class="form-control" placeholder="Tỉnh/Thành Phố" path="address"/>
									</div>
									<div class="form-group">
										<label class="form-label">E-mail</label> <form:input type="email" value="${ loginInfo.email }"
											class="form-control mb-1" placeholder="Nhập Email" path="email"/>

									</div>
									<div class="text-right mt-3">
										<input type="submit" class="btn-outline-primary"
										 value="Lưu Thay Đổi" />
											
										&nbsp;
										<button type="button" class="btn-outline-primary">Hủy</button>

									</div>
									
								</form:form>
							</div>

						</div>
						<div class="tab-pane fade" id="account-change-password">
							<div class="card-body pb-2">
								<c:url var="changePassword" value='/change-password'/>
								<form:form method="post" action="${ changePassword }" modelAttribute="user">
								<div class="form-group">
									<label class="form-label">Mật khẩu hiện tại</label> <form:input
										type="password" class="form-control" path="password" value="" id="password"/>
								</div>

								<div class="form-group">
									<label class="form-label">Mật khẩu mới</label> <form:input id="newPassword"
										type="password" class="form-control" path="newPassword"/>
								</div>

								<div class="form-group">
									<label class="form-label">Nhập lại mật khẩu mới</label> <form:input id="confirmPassword"
										type="password" class="form-control" path="confirmPassword"/>
								</div>
							
								<div id="status" class="form-group" style="display: none"><span id="message"></span></div>
						
								<div class="text-right mt-3">
								<button type="button" class="btn-outline-primary">Lưu
									thay đổi</button>
								<input type="button" onclick="changePassword(${ loginInfo.id })" value="lưu thay đổi" class="btn-outline-primary">
								&nbsp;
								<button type="button" class="btn-outline-primary">Hủy</button>

							</div>
								</form:form>

							</div>
							
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>