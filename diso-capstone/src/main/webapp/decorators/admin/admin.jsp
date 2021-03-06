<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Dashboard</title>

<!-- Custom fonts for this template-->



<!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
<link
	href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<!--  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet"> -->
<link
	href="<c:url value='/template/admin/vendor/datatables/dataTables.bootstrap4.css'/>"
	rel="stylesheet">
	<link
	href='<c:url value='/template/user/assets/vendor/bootstrap/css/bootstrap.min.css'/>'
	rel="stylesheet">
<!-- Custom styles for this template-->
<!-- <link href="css/sb-admin.css" rel="stylesheet"> -->
<link href="<c:url value='/template/admin/css/sb-admin.css'/>"
	rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body id="page-top">

	<%@include file="/common/admin/header.jsp"%>

	<!--  wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%-- <%@include file="/common/admin/menu.jsp"%> --%>
		<!-- Sidebar close tag -->
		
		
		<!-- content - wrapper -->
		<dec:body/>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<!-- Sticky Footer -->
	<!--  <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer> -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Đăng xuất ?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Bạn có chắc muốn thoát phiên đăng nhập của mình</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="<c:url value='/adminLogout'/>">Đăng xuất</a>
				</div>
			</div>
		</div>
	</div>

	<script src="<c:url value='/template/user/assets/js/events.js'/>"></script>

	<!-- Bootstrap core JavaScript-->
	<script
		src="<c:url value="/template/admin/vendor/jquery/jquery.min.js"/>	"></script>


	<!-- <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<script
		src="<c:url value="/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"/>	"></script>

	<!-- Core plugin JavaScript-->
	<!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->
	<script
		src="<c:url value="/template/admin/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
	<!-- Page level plugin JavaScript-->
	<!-- <script src="vendor/chart.js/Chart.min.js"></script> -->


	<!-- <script src="vendor/datatables/jquery.dataTables.js"></script> -->
	<script
		src="<c:url value="/template/admin/vendor/datatables/jquery.dataTables.js"/>"></script>
	<!-- <script src="vendor/datatables/dataTables.bootstrap4.js"></script> -->
	<script
		src="<c:url value="/template/admin/vendor/datatables/dataTables.bootstrap4.js"/>"></script>

	<!-- Custom scripts for all pages-->
	<!--  <script src="js/sb-admin.min.js"></script> -->
	<script src="<c:url value="/template/admin/js/sb-admin.min.js"/>"></script>

	<!-- Demo scripts for this page-->
	<!-- <script src="js/demo/datatables-demo.js"></script> -->
	<script
		src="<c:url value="/template/admin/js/demo/datatables-demo.js"/>"></script>
	<!-- <script src="js/demo/chart-area-demo.js"></script> -->

</body>

</html>
