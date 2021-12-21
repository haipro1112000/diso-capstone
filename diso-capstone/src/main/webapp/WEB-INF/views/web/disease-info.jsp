<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>${ disease.name }</title>
</head>
<body>
	
	<section class="about">
		<div class="container container-view-disease" data-aos="fade-up">
			<a style="color:white;"  class="btn btn-primary" onclick="history.back()">Quay lại</a>
			<div class="section-title">
				<h2>${ disease.getName() }</h2>
				<p>Dưới đây là những thông tin liên quan đến bệnh này !</p>
			</div>
		</div>
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h3>Ảnh minh họa</h3>
			</div>

			<div class="row">
				<div class="col-lg-4 col-md-6 d-flex align-items-center"
					data-aos="fade-up" data-aos-delay="100">
					<div class="member">
						<div class="member-img">
							<img
								src="${ disease.getImage1() }"
								class="img-fluid" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 d-flex align-items-center"
					data-aos="fade-up" data-aos-delay="100">
					<div class="member">
						<div class="member-img">
							<img
								src="${ disease.getImage2() }"
								class="img-fluid" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 d-flex align-items-center"
					data-aos="fade-up" data-aos-delay="100">
					<div class="member">
						<div class="member-img">
							<img
								src="${ disease.getImage3() }"
								class="img-fluid" alt="">
						</div>
					</div>
				</div>

			</div>


		</div>
		<div class="container container-view-disease" data-aos="fade-up">
			<div class="row content">
				<div class="col-lg-6">
					<div class="section-title">
						<h3>Nguyên nhân</h3>
					</div>
					<div>${ disease.getReason() }</div>
					<!-- <p>Từ những vấn đề thực tế chúng tôi đã thu thập được từ người
						trồng lan, chúng tôi đề xuất giải pháp ứng dụng tự động nhận biết
						bệnh hại trên cây lan bằng hình ảnh, đây là ứng dụng giúp người
						dùng dễ dàng nhận biết loại bệnh gặp trên cây lan. Ứng dụng sẽ
						phân tích dữ liệu hình ảnh từ người dùng và cung cấp thông tin về
						các bệnh gặp phải, đồng thời đưa ra giải pháp điều trị. Giúp người
						dùng xác định nhanh loại bệnh gặp phải, giảm thiểu rủi ro, tiết
						kiệm chi phí cho người trồng.</p> -->
				</div>
				<div class="col-lg-6 pt-4 pt-lg-0">
					<div class="section-title">
						<h3>Triệu chứng</h3>
					</div>
					<div>${ disease.getSymptom() }</div>
				</div>
			</div>
		</div>

		<div class="container container-view-disease" data-aos="fade-up">
			<div class="row content">
				<div class="col-lg-6">
					<div class="section-title">
						<h3>Cách phòng bệnh</h3>
					</div>
					<div>${ disease.getPrevention() }</div>
				</div>
				<div class="col-lg-6 pt-4 pt-lg-0">
					<div class="section-title">
						<h3>Cách chữa trị</h3>
					</div>
					<div> ${ disease.getMedicine() }</div>
				</div>
			</div>
		</div>
	</section>



	<!--Jquery Library file -->
	<!-- <script src="./js/Jquery3.6.0.min.js"></script>

	Custom Javascript file
	<script src="./js/main.js"></script> -->

</body>