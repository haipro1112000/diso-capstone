<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><dec:title default="Master-layout" /></title>
<%-- <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
 	<link rel="stylesheet" href="<c:url value='/template/webb/bootstrap/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/all.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/givefeedback.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/post.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/question.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/signup.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/test.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/disease-identification.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/webb/css/information.css'/>"> --%>

<!-- Favicons -->
<!--  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

<link
	href='<c:url value='/template/user/assets/img/apple-touch-icon.png'/>'
	rel="apple-touch-icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

<link href='<c:url value='/template/user/assets/vendor/aos/aos.css'/>'
	rel="stylesheet">

<link
	href='<c:url value='/template/user/assets/vendor/bootstrap/css/bootstrap.min.css'/>'
	rel="stylesheet">

<link
	href='<c:url value='/template/user/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>'
	rel="stylesheet">

<link
	href='<c:url value='/template/user/assets/vendor/boxicons/css/boxicons.min.css'/>'
	rel="stylesheet">

<link
	href='<c:url value='/template/user/assets/vendor/glightbox/css/glightbox.min.css'/>'
	rel="stylesheet">

<link
	href='<c:url value='/template/user/assets/vendor/remixicon/remixicon.css'/>'
	rel="stylesheet">

<link
	href='<c:url value='/template/user/assets/vendor/swiper/swiper-bundle.min.css'/>'
	rel="stylesheet">


<!-- Template Main CSS File -->

<link href='<c:url value='/template/user/assets/css/style.css'/>'
	rel="stylesheet">
<link
	href='<c:url value='/template/user/assets/css/disease-identification.css'/>'
	rel="stylesheet">
<link href='<c:url value='/template/user/assets/css/information.css'/>'
	rel="stylesheet">
<link href='<c:url value='/template/user/assets/css/signup.css'/>'
	rel="stylesheet">
<link href='<c:url value='/template/user/assets/css/community.css'/>'
	rel="stylesheet">
<link href='<c:url value='/template/user/assets/css/create-post.css'/>'
	rel="stylesheet">




<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"
	type="text/javascript"></script>


<!-- <style type="text/css">
main .site-title {
	background: url("./template/web/images/blue_flower.jpg");
	background-size: 100%;
	background-repeat: no-repeat;
	height: 90vh;
	display: flex;
	justify-content: center;
}
</style> -->
</head>

<body>
	<!------------------Navigation------------------------>

	<%@include file="/common/web/header.jsp"%>



	<!--------Main Site Section--------->
	<dec:body />

	<%@include file="/common/web/footer.jsp"%>
	<!---x----Main Site Section----x---->

	<script>
	var dateComment = document.getElementsByClassName("date-now");
		for(let i=0 ; i<dateComment.length ; i++){
			let d = dateComment[i];
			d.innerHTML = moment(d.innerHTML,"YYYY-MM-DD hh:mm:ss").locale('vi').fromNow();
		}
	</script>
	<%-- <script src="<c:url value='/template/webb/js/Jquery3.6.0.min.js'/>"></script>
	<!--Custom Javascript file -->
	<script src="<c:url value='/template/webb/js/mainn.js'/>"></script> --%>
	 <script src="<c:url value='/template/webb/js/xuli.js'/>"></script> 



	<!-- Vendor JS Files -->
	<script src='<c:url value='/template/user/assets/vendor/aos/aos.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/glightbox/js/glightbox.min.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/php-email-form/validate.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/purecounter/purecounter.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/swiper/swiper-bundle.min.js'/>'></script>


	<script src='<c:url value='/template/user/assets/js/main.js'/>'></script>

</body>

</html>