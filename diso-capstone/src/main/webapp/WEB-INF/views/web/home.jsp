<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>
<title>Trang Chủ</title>
</head>
<main id="main">
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div class="container position-relative" data-aos="fade-up"
			data-aos-delay="100">
			<div class="row justify-content-center">
				<div class="col-xl-7 col-lg-9 text-center">
					<h1>HOA LAN BỊ BỆNH</h1>
					<h2>Hãy cùng chúng tôi đi tìm nguyên nhân và cách chữa trị</h2>
				</div>
			</div>
			<div class="text-center">
				<a href="<c:url value='/identify'/>"
					class="btn-get-started scrollto">Tìm hiểu bệnh</a>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<!-- ======= About Section ======= -->
	<section id="about" class="about">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>Giới Thiệu</h2>
				<p>Đây là sản phẩm của nhóm C1SE.04 cho môn đồ án Capstone 1 !</p>
			</div>

			<div class="row content">
				<div class="col-lg-6">
					<p>DISO-DISEASE IDENTIFICATION SYSTEM ON ORCHIDS là công cụ
						dùng để xác định bệnh hoa lan với:</p>
					<ul>
						<li><i class="ri-check-double-line"></i> Sử dụng công nghệ
							Machine Learning, tự động xác định bệnh.</li>
						<li><i class="ri-check-double-line"></i> Xác định bệnh nhanh
							chóng và chính xác.</li>
						<li><i class="ri-check-double-line"></i> Đưa ra thông tin về
							bệnh và giải pháp chữa trị.</li>
					</ul>
				</div>
				<div class="col-lg-6 pt-4 pt-lg-0">
					<p>Từ những vấn đề thực tế chúng tôi đã thu thập được từ người
						trồng lan, chúng tôi đề xuất giải pháp ứng dụng tự động nhận biết
						bệnh hại trên cây lan bằng hình ảnh, đây là ứng dụng giúp người
						dùng dễ dàng nhận biết loại bệnh gặp trên cây lan. Ứng dụng sẽ
						phân tích dữ liệu hình ảnh từ người dùng và cung cấp thông tin về
						các bệnh gặp phải, đồng thời đưa ra giải pháp điều trị. Giúp người
						dùng xác định nhanh loại bệnh gặp phải, giảm thiểu rủi ro, tiết
						kiệm chi phí cho người trồng.</p>
				</div>
			</div>

		</div>
	</section>


	<!-- ======= Team Section ======= -->
	<section id="team" class="team section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>Thành Viên</h2>
				<p>Để có được đồ án thành công như hiện tại, đều nhờ sự chung
					sức, nỗ lực, đoàn kết của cả 4 thành viên.</p>
			</div>

			<div class="row">

				<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
					data-aos="fade-up" data-aos-delay="100">
					<div class="member">
						<div class="member-img">
							<img
								src="<c:url value='/template/user/assets/img/—Pngtree—blue fresh literary flowers_925010.jpg'/>"
								class="img-fluid" alt="">
							<div class="social">
								<a href=""><i class="fab fa-facebook-f"></i></a> <a href=""><i
									class="fab fa-instagram"></i></a> <a href=""><i
									class="fab fa-twitter"></i></a> <a href=""><i
									class="fab fa-google"></i></a>
							</div>
						</div>
						<div class="member-info">
							<h4>Bùi Hữu Nghĩa</h4>
							<span>Leader</span>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
					data-aos="fade-up" data-aos-delay="200">
					<div class="member">
						<div class="member-img">
							<img
								src="<c:url value='/template/user/assets/img/—Pngtree—blue fresh literary flowers_925010.jpg'/>"
								class="img-fluid" alt="">
							<div class="social">
								<a href=""><i class="fab fa-facebook-f"></i></a> <a href=""><i
									class="fab fa-instagram"></i></a> <a href=""><i
									class="fab fa-twitter"></i></a> <a href=""><i
									class="fab fa-google"></i></a>
							</div>
						</div>
						<div class="member-info">
							<h4>Trương Đăng Minh</h4>
							<span>Team Member</span>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
					data-aos="fade-up" data-aos-delay="300">
					<div class="member">
						<div class="member-img">
							<img
								src="<c:url value='/template/user/assets/img/—Pngtree—blue fresh literary flowers_925010.jpg'/>"
								class="img-fluid" alt="">
							<div class="social">
								<a href=""><i class="fab fa-facebook-f"></i></a> <a href=""><i
									class="fab fa-instagram"></i></a> <a href=""><i
									class="fab fa-twitter"></i></a> <a href=""><i
									class="fab fa-google"></i></a>
							</div>
						</div>
						<div class="member-info">
							<h4>Đặng Ngọc Nam</h4>
							<span>Team Member</span>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 d-flex align-items-stretch"
					data-aos="fade-up" data-aos-delay="400">
					<div class="member">
						<div class="member-img">

							<img
								src="<c:url value='/template/user/assets/img/—Pngtree—blue fresh literary flowers_925010.jpg'/>"
								class="img-fluid" alt="">
							<div class="social">
								<a href=""><i class="fab fa-facebook-f"></i></a> <a href=""><i
									class="fab fa-instagram"></i></a> <a href=""><i
									class="fab fa-twitter"></i></a> <a href=""><i
									class="fab fa-google"></i></a>
							</div>
						</div>
						<div class="member-info">
							<h4>Nguyễn Hải</h4>
							<span>Team Member</span>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- End Team Section -->

	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>Liên hệ</h2>
				<p>Nếu có ý kiến đóng góp xin liên lạc với chúng tôi !</p>
			</div>

			<div>
				<iframe style="border: 0; width: 100%; height: 270px;"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d958.5256759264338!2d108.20914674655248!3d16.060159390048632!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219b4239d8e51%3A0x96e408c6b0419760!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBEdXkgVMOibg!5e0!3m2!1svi!2sbg!4v1636991566354!5m2!1svi!2sbg"
					frameborder="0" allowfullscreen></iframe>
			</div>

			<div class="row mt-5">

				<div class="col-lg-4">
					<div class="info">
						<div class="address">
							<i class="bi bi-geo-alt"></i>
							<h4>Địa Chỉ:</h4>
							<p>254 Nguyễn Văn Linh, Đà Nẵng</p>
						</div>

						<div class="email">
							<i class="bi bi-envelope"></i>
							<h4>Email:</h4>
							<p>travisbui147@gmail.com</p>
						</div>

						<div class="phone">
							<i class="bi bi-phone"></i>
							<h4>Điện thoại:</h4>
							<p>+84 686 868 686</p>
						</div>

					</div>

				</div>

				<div class="col-lg-8 mt-5 mt-lg-0">
					<form action="/diso-capstone/api/account/feedback" method="post" role="form"
						class="php-email-form">
						<div class="row">
							 <div class="col-md-6 form-group">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="Họ Tên" required>
							</div> 
							<div class="col-md-6 form-group">
								<input type="email" class="form-control" name="email" id="email"
									placeholder="Email" required>
							</div>
						</div>
						<div class="form-group mt-3">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="Tiêu Đề" required>
						</div>
						<div class="form-group mt-3">
							<textarea class="form-control" name="message" rows="5" id="content" 
								placeholder="Nội dung" required></textarea>
						</div>
						<div class="my-3">
							<div class="loading">Đang tải</div>
							<div class="error-message"></div>
							<div class="sent-message">Tin nhắn của bạn đã được gửi. Cảm
								ơn!</div>
						</div>
						<div class="text-center">
							<button type="submit">Gửi lời nhắn</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</section>
	<!-- End Contact Section -->

</main>
<!-- End #main -->

