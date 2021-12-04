<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Thông Tin Bệnh</title>
</head>
<body>
	<!------------------Navigation------------------------>
	<%--  <div class="container-info">
        <div class="information">
            <h2>${ disease.getName() }</h2>
            <h3 class="information-heading">Hình ảnh minh họa</h3>
            <div class="disease-img">
                <img
				src="<c:url value='/template/web/images/${ disease.getImage1() }' />"
				alt="" width="100px" height="100px">
                <img
				src="<c:url value='/template/web/images/${ disease.getImage2() }' />"
				alt="" width="100px" height="100px">
                <img
				src="<c:url value='/template/web/images/${ disease.getImage3() }' />"
				alt="" width="100px" height="100px">
				
            </div>
        </div>
        <div class="information">
            <h3 class="information-heading">Nguyên Nhân</h3>
            <p class="about-text">${ disease.getReason() }</p>
        </div>
    
        <div class="information">
            <h3 class="information-heading">Triệu chứng</h3>
            <p class="about-text">${ disease.getSymptom() }</p>
    
        </div>
        <div class="information">
            <h3 class="information-heading">Cách phòng bệnh</h3>
            <p class="about-text">${ disease.getPrevention() }</p>
        </div>
    
        <div class="information">
            <h3 class="information-heading">Cách chữa trị</h3>
            <p class="about-text">Thuốc khuyên dùng</p>
           ${ disease.getMedicine() }
        </div>
           
    </div> --%>
	<!-- <div class="container-info">
        <div class="information">
            <h2>BỆNH THỐI NÂU</h2>
            <h3 class="information-heading">Hình ảnh minh họa</h3>
            <div class="disease-img">
                <img src="./assets/abc.png" alt="">
                <img src="./assets/abc.png" alt="">
                <img src="./assets/abc.png" alt="">
            </div>
        </div>
        <div class="information">
            <h3 class="information-heading">Nguyên Nhân</h3>
            <p class="about-text">Bệnh thối nâu do vi khuẩn Pseudomonas gladioii (Cụ thể là Acidovorax (syn. Pseudomonas)	.</p>
        </div>
    
        <div class="information">
            <h3 class="information-heading">Triệu chứng</h3>
            <p class="about-text">Những điểm nhỏ ngậm nước có thể xuất hiện bất cứ khu vực nào của lá. Ban đầu là những đốm nhỏ màu xanh lá cây hơi nhạt hơn khu vực xung quanh, sau đó những đốm này mở rộng ra và hợp lại với nhau thành những chấm hoặc những khoang vùng bệnh màu nâu hoặc đen, những vết này khô đi và lõm hẳn xuống. </p>
        </div>
        <div class="information">
            <h3 class="information-heading">Cách phòng bệnh</h3>
            <p class="about-text">Giảm độ ẩm trong vườn, không tưới với vòi phun áp suất cao và không bón phân nhiều đạm.
                 Cách nhanh gọn nhất, tiết kiệm nhất là sử dụng lọ nano bạc Hùng Nguyễn, chuyên trị thối nâu, thối nhũn, chết nhanh, nấm giá thể.
            </p>
        </div>
    
        <div class="information">
            <h3 class="information-heading">Cách chữa trị</h3>
            <p class="about-text">Thuốc khuyên dùng</p>
            <ul class="about-text">
                <li>Kasumin 2L</li>
                <li>Kasuran 47 WP</li>
                <li>Physan20</li>
                <li>Viên sủi Poner</li>
            </ul>
        </div>
    
        <div class="information">
            <h3 class="information-heading">Cách phòng bệnh</h3>
            <p class="about-text"> Giảm độ ẩm trong vườn, không tưới với vòi phun áp suất cao và không bón phân nhiều đạm.
                 Cách nhạnh gọn nhất, tiết kiệm nhất là sử dụng lọ nano bạc Hùng Nguyễn, chuyên trị thối nâu, thối nhũn, chết nhanh, nấm giá thể.
            </p>
            <hr>
        </div>
        
    </div> -->
	<section class="about">
		<div class="container container-view-disease" data-aos="fade-up">

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
							
								src="<c:url value='/template/web/images/${ disease.getImage1() }' />"
								class="img-fluid" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 d-flex align-items-center"
					data-aos="fade-up" data-aos-delay="100">
					<div class="member">
						<div class="member-img">
							<img
								src="<c:url value='/template/web/images/${ disease.getImage2() }' />"
								class="img-fluid" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 d-flex align-items-center"
					data-aos="fade-up" data-aos-delay="100">
					<div class="member">
						<div class="member-img">
							<img
								src="<c:url value='/template/web/images/${ disease.getImage3() }' />"
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