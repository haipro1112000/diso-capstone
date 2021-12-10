<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<ul class="sidebar navbar-nav">
		<li class="nav-item "><a class="nav-link"
			href="<c:url value="/admin/home"/>"> <i
				class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
		</a></li>

		<li class="nav-item active" ><a class="nav-link"
			href="<c:url value="/admin/home"/>"> <i
				class="fas fa-fw fa-table"></i> <span>Tài khoản</span>
		</a></li>
		<li class="nav-item "><a class="nav-link"
			href="<c:url value="/admin/post"/>"> <i
				class="fas fa-fw fa-table"></i> <span>Bài viết</span>
		</a></li>
	</ul>
	<div id="content-wrapper">

		<div class="container-fluid">
			<!-- Icon Cards-->
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-comments"></i>
							</div>
							<div class="mr-5">26 New Messages!</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left">View Details</span> <span
							class="float-right"> <i class="fas fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-list"></i>
							</div>
							<div class="mr-5">11 New Tasks!</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left">View Details</span> <span
							class="float-right"> <i class="fas fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-shopping-cart"></i>
							</div>
							<div class="mr-5">123 New Orders!</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left">View Details</span> <span
							class="float-right"> <i class="fas fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-life-ring"></i>
							</div>
							<div class="mr-5">13 New Tickets!</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left">View Details</span> <span
							class="float-right"> <i class="fas fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
			</div>


			<!-- DataTables Example -->
			<h1>${ accounts.size() }</h1>
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> Data Table Example
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>

								<tr>
									<th>ID</th>
									<th>Họ và lót</th>
									<th>Tên</th>
									<th>Địa chỉ</th>
									<th>Điện thoại</th>
									<th>email</th>
									<th>Báo cáo</th>
									<th>Hành động</th>
								</tr>

							</thead>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>Họ và lót</th>
									<th>Tên</th>
									<th>Địa chỉ</th>
									<th>Điện thoại</th>
									<th>email</th>
									<th>Báo cáo</th>
									<th>Hành động</th>
								</tr>
							</tfoot>
							<tbody>

								<!-- <tr>
									<td>1</td>
									<td>Nguyễn</td>
									<td>Hải</td>
									<td>Thừa Thiên Huế</td>
									<td>0386358531</td>
									<td>nguyenhaivhien9.1@gmail.com</td>
									<td>4</td>
								</tr> -->
								<c:forEach var="item" items="${ accounts }">
									<tr>
										<td>${ item.id }</td>
										<td>${ item.firstName }</td>
										<td>${ item.lastName }</td>
										<td>${ item.address }</td>
										<td>${ item.phone }</td>
										<td>${ item.email }</td>
										<td>${ item.report }</td>
										<td style="text-align: center;"><a href="#">Khóa</a></td>
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>

		</div>
		<!-- /.container-fluid -->


	</div>

</body>