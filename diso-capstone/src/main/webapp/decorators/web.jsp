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

<script src="<c:url value='/libraries/ckeditor/ckeditor.js'/>"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"
	type="text/javascript"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
	<!------------------Navigation------------------------>

	<%@include file="/common/web/header.jsp"%>

	<div id="mess"
		style="position: fixed; left: 490px; top: 78px; display: none; color: white; background: black;">
		<h1>Cảm ơn đóng góp của bạn</h1>
	</div>

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
	<script>
		var editor = CKEDITOR.replace('content', {
		   toolbar: 'Custom', //makes all editors use this toolbar
		   toolbarStartupExpanded : false,
		   toolbarCanCollapse  : false,
		   toolbar_Custom: [] //define an empty array or whatever buttons you want.
		});
	
	</script>
	<script src="<c:url value='/template/user/assets/js/events.js'/>"></script>



	<!-- Vendor JS Files -->
	<script src='<c:url value='/template/user/assets/vendor/aos/aos.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/glightbox/js/glightbox.min.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/email-form/validate.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/purecounter/purecounter.js'/>'></script>

	<script
		src='<c:url value='/template/user/assets/vendor/swiper/swiper-bundle.min.js'/>'></script>


	<script src='<c:url value='/template/user/assets/js/main.js'/>'></script>

</body>

</html>