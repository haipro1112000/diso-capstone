<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<ul class="sidebar navbar-nav">
		<li class="nav-item "><a class="nav-link"
			href="<c:url value="/admin/home"/>"> <i
				class="fas fa-fw fa-tachometer-alt"></i> <span>Tài khoản</span>
		</a></li>

		<li class="nav-item"><a class="nav-link"
			href="<c:url value="/admin/home"/>"> <i
				class="fas fa-fw fa-table"></i> <span>Tài khoản</span>
		</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="<c:url value="/admin/post"/>"> <i
				class="fas fa-fw fa-table"></i> <span>Bài viết</span>
		</a></li>
	</ul>
	<div id="content-wrapper">

		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-comments"></i>
							</div>
							<div class="mr-5">${ accounts.size() } Tài khoản</div>
						</div>
						<a class="card-footer text-white clearfix small z-1"
							href="<c:url value="/admin/home"/>"> <span class="float-left">Xem
								chi tiết</span> <span class="float-right"> <i
								class="fas fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-list"></i>
							</div>
							<div class="mr-5">${ inactiveAccounts.size() } Tài khoản bị
								khóa</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="<c:url value="/admin/inactive-account"/>">
							<span class="float-left">Xem chi tiết</span> <span
							class="float-right"> <i class="fas fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-shopping-cart"></i>
							</div>
							<div class="mr-5">${ posts.size() } Bài viết</div>
						</div>
						<a class="card-footer text-white clearfix small z-1"
							href="<c:url value="/admin/post"/>"> <span class="float-left">Xem
								chi tiết</span> <span class="float-right"> <i
								class="fas fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
			</div>

		
			<!-- DataTables Example -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> Bảng dữ liệu bài viết
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>

								<tr>
									<th>ID</th>
									<th>Tiêu đề</th>
									<th>Người đăng</th>
									<th>Ngày đăng</th>
									<th>Ngày chỉnh sửa</th>
									<th>số bình luận</th>
									<th>Báo cáo</th>
									<th>Hành động</th>
								</tr>

							</thead>
							<tfoot>

								<tr>
									<th>ID</th>
									<th>Tiêu đề</th>
									<th>Người đăng</th>
									<th>Ngày đăng</th>
									<th>Ngày chỉnh sửa</th>
									<th>số bình luận</th>
									<th>Báo cáo</th>
									<th>Hành động</th>
								</tr>
							</tfoot>
							<tbody>

								<c:forEach var="item" items="${ posts }">
									<tr>
										<td>${ item.id }</td>
										<td>${ item.title }</td>
										<td>${ item.firstName } ${ item.lastName }</td>
										<td>${ item.createAt }</td>
										<td>${ item.updateAt }</td>
										<td>${ item.totalComment }</td>
										<td>${ item.report }</td>
										<%-- <td><button onclick="warningBeforeDelete(${ item.id })">Xoá</button></td> --%>
										<td><a style="color:white; "  class="btn btn-danger" onclick="warningBeforeDelete(${ item.id })">Xoá bài viết</a></td>
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div>
				
			</div>

		</div>
		<!-- /.container-fluid -->
		<div class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Website 2021</span>
				</div>
			</div>
		</div>

	</div>

</body>