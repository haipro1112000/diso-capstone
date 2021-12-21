<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Bài Viết</title>
</head>
<%@include file="/common/taglib.jsp"%>

<%-- <h1>${ list.size() }</h1> --%>
<c:url value="/post" var="action" />
<%-- <h1>Hello</h1>
<form:form method="post" action="${ action }" modelAttribute="post"
	enctype="multipart/form-data">
	<div class="form-group">
		<label for="title">title</label>
		<form:input type="text" id="title" cssClass="form-control"
			path="title" />
	</div>
	<div class="form-group">
		<label for="content">content</label><br>
		<form:textarea id="content" path="content" cols="30" rows="5" />
	</div>
	<div class="form-group">
		<label for="file1">Anh 1</label>
		<form:input type="file" id="file1" cssClass="form-control"
			path="file1" />
	</div>
	
	<div class="form-group">
		<input type="submit" value="Them Post" class="btn btn-danger" />
	</div>
</form:form> --%>


<%--  <div class="question-container">
	<c:if test="${not empty status }">
		<h1>${ status }</h1>
	</c:if>
	<h1>HỎI & ĐÁP</h1>
	<form:form method="post" action="${ action }" modelAttribute="post"
		enctype="multipart/form-data">
		<form:hidden path="id"/>
		<div class="title">
			<h2>Tiêu đề</h2>
			<form:input type="text" placeholder="Đặt câu hỏi" path="title" />
		</div>
		<div class="upload-img container-disease-ide">
			<h2>Ảnh đính kèm</h2>
			<div class="wrapper">
				<div class="icon">
					<i class="up fas fa-cloud-upload-alt"></i> <i
						class="close fas fa-times"></i>
				</div>
				<div id="text">Chưa có ảnh nào được chọn!</div>
				<div class="img">
					<!-- <img src="https://res.cloudinary.com/nguyenhai/image/upload/v1636880416/default-avatar_bjg40e.jpg" alt="aa" class="active"> -->
					<c:if test="${ post.image1 != null }">
						<c:if test="${ post.image1 == 'null' }">
							<img src="" alt="">
						</c:if>
						<c:if test="${ post.image1 != 'null' }">
							<img src="${ post.image1 }" alt="" class="active">
						</c:if>
					</c:if>
					<c:if test="${ post.image1 == null }">
						<img src="" alt="">
					</c:if>
					
				</div>
				<form:input type="file" accept="image/*" name="image" id="file"
					onchange="loadFile(event)" path="file1" />
				<label for="file" class="upload btn-upload">Tải ảnh lên</label>
			</div>
			<div class="form-group">
				<label for="file2">Anh 2</label>
				<form:input type="file" id="file2" cssClass="form-control"
					path="file2" />
			</div>
			<div class="form-group">
				<label for="file3">Anh 3</label>
				<form:input type="file" id="file3" cssClass="form-control"
					path="file3" />
			</div>
		</div>

		<!-- Nội dung -->
		<div class="question-content">
			<h2>Nội dung</h2>
			<div class="text-area">
				<form:textarea name="" id="" cols="30" rows="10"
					placeholder="Đặt vấn đề ở đây" path="content" />
			</div>
		</div>
		<c:if test="${  post.id == 0 }">
			<input type="submit" class="btn" value="Gửi câu hỏi">
		</c:if>
		<c:if test="${  post.id !=0 }">
			<input type="submit" class="btn" value="Thay đổi ">
		</c:if>
		
	</form:form>
</div>  --%>

<section id="contact" class="contact">
	<div class="container container-view-disease" data-aos="fade-up">

		<div class="section-title">
			<c:if test="${ post.id != 0 }">
				<h2>Cập nhập bài viết</h2>
			</c:if>
			<c:if test="${ post.id == 0 }">
				<h2>Tạo bài viết</h2>
			</c:if>

			<p>Cùng tham gia thảo luận về hoa lan!</p>
		</div>

		<div class="row justify-content-center">

			<div class="col-lg-8 mt-5 mt-lg-0 ">

				<form:form method="post" action="${ action }" modelAttribute="post"
					enctype="multipart/form-data">
					<form:hidden path="id" />
					<div class="form-group mt-3">
						<form:input type="text" class="form-control" path="title"
							placeholder="Tiêu Đề" required="required" />
					</div>
					<div class="form-group mt-3">
						<form:textarea class="form-control" name="message" rows="5"
							id="content" placeholder="Nội dung" required="required"
							path="content" />
					</div>
					<!-- <label for=""> Đính kèm ảnh: <input type="file" required>
					</label> -->
					<div class="form-group mt-3 img-pre">
						<div class="container-disease-ide">
							<div class="wrapper">
								<div class="icon">
									<i class="up bi bi-cloud-arrow-up"></i> <i
										class="close bi bi-x-lg"></i>
								</div>
								<div id="text">Chưa có ảnh nào được chọn!</div>
								<div class="img">
									<%-- <c:if test="${ post.image1 != 'null' }">
										<img src="${ post.image1 }" alt="" class="active" id="image1">
									</c:if>
									<c:if test="${ post.image1 == 'null' }">
										<img src="" alt="">
									</c:if> --%>

									<c:if test="${ post.image1 != null }">
										<c:if test="${ post.image1 == 'null' }">
											<img src="" alt="">
										</c:if>
										<c:if test="${ post.image1 != 'null' }">
											<img src="${ post.image1 }" alt="" class="active">
										</c:if>
									</c:if>
									<c:if test="${ post.image1 == null }">
										<img src="" alt="">
									</c:if>

								</div>
								<form:input type="file" accept="image/*" path="file1" id="file"
									onchange="loadFile(event)" />

							</div>

						</div>
						<label for="file" class="upload btn btn-outline-primary">Tải
							ảnh lên</label>
					</div>
					<div class="up-post">
						<c:if test="${ post.id != 0 }">
							<button class="btn-outline-primary" type="submit">Cập nhập bài viết</button>
						</c:if>
						<c:if test="${ post.id == 0 }">
							<button class="btn-outline-primary" type="submit">Đăng
							bài viết</button>
						</c:if>
						
					</div>

				</form:form>

			</div>

		</div>

	</div>
</section>
<script>
        const upload = document.querySelector("input");
        const uploadbtn = document.querySelector(".upload");
        const image = document.querySelector(".img img");
        const close = document.querySelector(".icon .close");

        var loadFile = function (event) {
            var image = document.querySelector(".img img");
            image.classList.add("active");
            close.classList.add("exit");
            // if user clicks on the browse file button it executes a command opening a pannel for the user to pick he's source file of the image
            image.src = URL.createObjectURL(event.target.files[0]);

            close.onclick = (e) => {
                image.classList.remove("active");
                close.classList.remove("exit");
                document.getElementById('file').value = '';
            }
        }
 </script>


