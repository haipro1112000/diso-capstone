<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Thông Tin Cá Nhân</title>
</head>
<body>
	<c:url var="editProfile" value="/profile" />
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
		<h1 id="status" style="display: none"></h1>

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
							<form:form method="POST" action="${ editProfile }"
								modelAttribute="user" enctype="multipart/form-data">
								<!-- <div class="card-body media align-items-center">
									<img src="" alt="" class="d-block ui-w-80">
									<div class="media-body ml-4">
										<label for="file" class="btn-upload-avt btn-outline-primary">
											Tải ảnh lên <input type="file"
											class="account-settings-fileinput" name="image-avt" id=file
											onchange="loadFile(event)">
										</label> &nbsp;
										<button type="button"
											class="btn-reset-avt btn-outline-primary">Reset</button>

									</div>
								</div> -->
								<div class="card-body media align-items-center">
									<div class="img-avt">
										<img src="${ loginInfo.avatar }" alt=""
											class="d-block ui-w-80 active">
									</div>

									<div class="media-body ml-4">
										<label for="file" class="btn-upload-avt btn-outline-primary">
											Tải ảnh lên <form:input type="file"
												class="account-settings-fileinput" id="file"
												onchange="loadFile(event)" path="file" />
										</label> &nbsp;
										<button type="reset" class="btn-reset-avt btn-outline-primary"
											style="display: none" id="reset-avt">Reset</button>
									</div>
								</div>

								<%-- <div class="card-body media align-items-center">
								<div class="img-avt">
									<img src="${ loginInfo.avatar }"
										alt="" class="d-block ui-w-80 active">
								</div>
								
								<div class="media-body ml-4" >
									<label for="file" class="btn-upload-avt btn-outline-primary">
										Tải ảnh lên 
										<form:input type="file" cssClass="account-settings-fileinput" accept="image/*"
										id="file" onchange="loadFile(event)" path="file"/>
									</label> &nbsp;
									<!-- <input type="submit" class="btn-reset-avt btn-outline-primary" 
										id="reset-avt" value="Thay đổi"/> -->
								</div>
							</div> --%>
								<hr class="border-light m-0">

								<div class="card-body">
									<div>
										<form:hidden path="id" value="${ loginInfo.id }" />
										<div class="form-group">
											<label class="form-label">Họ</label>
											<form:input type="text" value="${ loginInfo.firstName }"
												cssClass="form-control" placeholder="Nhập họ và tên đệm"
												path="firstName" />
										</div>
										<div class="form-group">
											<label class="form-label">Tên</label>
											<form:input type="text" value="${ loginInfo.lastName }"
												cssClass="form-control" placeholder="Nhập tên"
												path="lastName" />
										</div>
										<div class="form-group">
											<label class="form-label">Số điện thoại</label>
											<form:input type="tel" cssClass="form-control" maxlength="11"
												pattern="[0]{1}[1-9]{8,10}"
												title="Số điện thoại không hợp lệ vui lòng nhập lại(9-11 )"
												value="${ loginInfo.phone }" placeholder="Số điện thoại"
												path="phone" />
										</div>
										<div class="form-group">
											<label class="form-label">Địa chỉ</label>
											<form:input type="text" value="${ loginInfo.address }"
												cssClass="form-control" placeholder="Tỉnh/Thành Phố"
												path="address" />
										</div>
										<div class="form-group">
											<label class="form-label">E-mail</label>
											<form:input type="email" value="${ loginInfo.email }"
												cssClass="form-control mb-1" placeholder="Nhập Email"
												path="email" />

										</div>
										<div class="text-right mt-3">
											<input type="submit" class="btn-outline-primary"
												value="Lưu Thay Đổi" /> &nbsp;
											<!-- <button type="button" class="btn-outline-primary">Hủy</button> -->

										</div>

									</div>
								</div>
							</form:form>
						</div>
						<div class="tab-pane fade" id="account-change-password">
							<div class="card-body pb-2">
								<c:url var="changePassword" value='/change-password' />
								<form>
									<div class="form-group">
										<label class="form-label">Mật khẩu hiện tại</label>
										<input type="password" class="form-control"
											name="password" value="" id="password" />
									</div>

									<div class="form-group">
										<label class="form-label">Mật khẩu mới</label>
										<input id="newPassword" type="password"	class="form-control" name="newPassword"
											
											 />
									</div>

									<div class="form-group">
										<label class="form-label">Nhập lại mật khẩu mới</label>
										<input id="confirmPassword" type="password"
											class="form-control" name="confirmPassword" />
									</div>


									<div class="alert alert-danger" style="padding: 0.4rem 0.6rem; display:none" id="mess">
										<span id="message"></span>
									</div>

									<div class="text-right mt-3">
										<%-- <button type="button" id="change"
											onclick="changePw(${ loginInfo.id })"
											class="btn-outline-primary">Lưu thay đổi</button> --%>
										<input type=""
											onclick="changePassword(${ loginInfo.id })"
											value="Lưu thay đổi" class="btn-outline-primary">
										&nbsp;
										

									</div>
								</form>

							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
    const upload = document.querySelector("input");
    const uploadbtn = document.querySelector(".btn-upload-avt");
    const image = document.querySelector(".img-avt img");
    const close = document.querySelector("#reset-avt"); 

    var loadFile = function (event) {
      var image = document.querySelector(".img-avt img");
      image.classList.add("active");
      close.classList.add("exit");
      // if user clicks on the browse file button it executes a command opening a pannel for the user to pick he's source file of the image
      image.src = URL.createObjectURL(event.target.files[0]);

      close.onclick = (e) => {
        image.classList.remove("active");
        close.classList.remove("exit");
      }
    }
  </script>
	<script>
  		function changeImage(){
			let a = document.getElementById('file').value
			console.log(a);
			
		}
  </script>
</body>