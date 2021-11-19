<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<nav class="nav">
	<div class="nav-menu flex-row">
		<div class="nav-brand">
			<a href="#" class="text-gray">DISO</a>
		</div>
		<div class="toggle-collapse">
			<div class="toggle-icons">
				<i class="fas fa-bars"></i>
			</div>
		</div>
		<div>
			<ul class="nav-item">
				<li class="nav-link"><a href="<c:url value='/'/>">Trang chủ</a></li>
				<li class="nav-link"><a href="#">Giới thiệu</a></li>
				<li class="nav-link"><a href="<c:url value='/identify'/>">Phân
						tích bệnh</a></li>
				<li class="nav-link"><a href="<c:url value='/community'/>">Cộng Đồng</a></li>
			</ul>
		</div>

		<div class="account-icon text-gray">
			<i class="fas fa-user-circle"></i>

		</div>
		<c:if test="${ loginInfo == null }">
			<div class="account-menu">
				<h3>TÀI KHOẢN</h3>
				<ul>
					<li class="js-sign"><a href="<c:url value='/register'/>"><img src="<c:url value='/template/webb/assets/signin.png'/>" alt="">Đăng kí</a></li>
					<li class="js-sign"><a href="<c:url value='/login'/>"><img src="<c:url value='/template/webb/assets/signin.png'/>" alt="">Đăng nhập</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${ loginInfo != null}">
			<div class="account-menu">
			<div class="username">
				<a href="<c:url value='/profile/${ loginInfo.id }'/>">${ loginInfo.firstName } ${ loginInfo.lastName }</a>
			</div>

			<ul>
				<li><img src="<c:url value='/template/webb/assets/feedback.png'/>" alt=""><a href="">Đóng
						góp ý kiến</a></li>

				<li><img src="<c:url value='/template/webb/assets/blog.png'/>" alt=""><a
					href="<c:url value='/post'/>">Viết Bài</a></li>

				<li><img src="<c:url value='/template/webb/assets/blogging.png'/>" alt=""><a
					href="<c:url value='/my-post'/>">Bài viết của tôi</a></li>

				<li><img src="<c:url value='/template/webb/assets/log-out.png'/>" alt=""><a
					href="<c:url value='/logout'/>">Đăng xuất</a></li>
			</ul>
		</div>
		</c:if>
		


	</div>
</nav>