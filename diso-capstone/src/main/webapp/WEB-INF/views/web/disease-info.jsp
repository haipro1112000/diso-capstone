<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

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
	<div class="container-info">
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
        
    </div>



	<!--Jquery Library file -->
	<!-- <script src="./js/Jquery3.6.0.min.js"></script>

	Custom Javascript file
	<script src="./js/main.js"></script> -->

</body>