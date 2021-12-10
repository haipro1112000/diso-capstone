<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Bài Viết Của Tôi</title>
</head>
<%-- <body>
	<h1>helo</h1>
	<h1>${ mypost.size() }</h1>
	<div style="border: 1px solid black">
		<h1>ID</h1>
		<h2>title</h2>
		<p>content</p>
		<p>2000/1/1</p>
		<img src="<c:url value='/template/web/images/' />" alt=""
			width="100px" height="100px"> <img
			src="<c:url value='/template/web/images/' />" alt="" width="100px"
			height="100px"> <img
			src="<c:url value='/template/web/images/' />" alt="" width="100px"
			height="100px">
	</div>
	<c:forEach var="item" items="${ mypost }">
		<div style="border: 1px solid black">
			<button onclick="deletePost(${ item.id })">Xoa bai dang</button>
			<a href="<c:url value='/post?id=${ item.id }'/>">EDIT</a>
			<h1>${ item.id}</h1>
			<a href="<c:url value='/community/${  item.title }' />"><h2>${item.title}</h2></a>
			<p>${item.content}</p>
			<div><i id="date">${ item.createAt}</i></div>
			

			<c:if test="${ item.image1 != 'null'}">
				<a href="${ item.image1 }" target="_blank"><img src="${ item.image1 }" alt="" width="100px" height="100px"></a>
			</c:if>
			<c:if test="${ item.image2 != 'null'}">
				<a href="${ item.image2 }" target="_blank"><img src="${ item.image2 }" alt="" width="100px" height="100px"></a>
			</c:if>
			<c:if test="${ item.image3 != 'null'}">
				<a href="${ item.image3 }" target="_blank"><img src="${ item.image3 }" alt="" width="100px" height="100px"></a>
			</c:if>
			
		</div>
	</c:forEach>
	<script type="text/javascript">
		var element = document.getElementById("date");
		moment(date).locale('vi').fromNow();
	</script>
	<script type="text/javascript">
		function deletePost(postId){
			fetch("/diso-capstone/api/post", {
				method: 'DELETE',
				body: JSON.stringify({
					"id": postId
				}),
				headers: {
					"Content-Type": "application/json"
				}
			}).then(function(res) {
				return res.json();
			}).then(function(data) {
				console.info(data);
				location.reload();
			});
}
		
	</script>
</body>  --%>
<c:if test="${ mypost.isEmpty() }">
	<div style="height:360px;">
		<h1 style="padding-top:165px; text-align:center;">Bạn không có bài viết nào!!</h1>
	</div>
</c:if>

<a onclick="">click vo day</a>
<c:forEach var="item" items="${ mypost }">
	
	<div class="container-viewpost-detail">
		<input type="hidden" value="${ item.id }" id="post${ item.id }"/>
		<div class="post">
			<!-- POST HEADER -->
			<div class="post__header header">
				<!-- header left -->
				<div class="header__left">
					<a href="#"> <img src="${ item.avatar }"
						class="post__author-pic" />
					</a>
					<div class="post__author author">
						<c:if test="${ loginInfo.id == item.userId }">
							<span class="author__name">
							 <a href="<c:url value='/profile'/>">${ item.firstName } ${ item.lastName }</a>
							</span>
							<i class="author__verified"></i>
						</c:if>
						<c:if test="${ loginInfo.id != item.userId }">
							<span class="author__name">
							 <a href="#">${ item.firstName } ${ item.lastName }</a>
							</span>
							<i class="author__verified"></i>
						</c:if>
					</div>
					<span class="post__date"> <i class="date-now">${item.createAt}</i>
					</span> <span class="post__date-privacy-separator">&nbsp;·</span> <i
						class="post__privacy"></i>
				</div>
				<!-- Header right -->
				<div class="header__right btn-group dropend">
					<button type="button" class="btn" data-bs-toggle="dropdown"
						aria-expanded="false">
						<div class="post__options options">
							<i class="bi bi-three-dots options__icon "></i>
						</div>
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item"
							href="<c:url value='/post?id=${ item.id }'/>">Chỉnh sửa</a>
						<div class="dropdown-divider"></div>
						<%-- <a class="dropdown-item" onclick="deletePost(${ item.id })">Xóa</a> --%>
						<a class="dropdown-item" onclick="warningBeforeDelete(${ item.id })">Xóa</a>
					</div>
				</div>
			</div>
			<!-- POST CONTENT -->
			<div class="post__content content">
				<div class="post-title">
					<h2>${item.title}</h2>
				</div>
				<div class="content__paragraph">${item.content}</div>

				<c:if test="${ item.image1 != 'null'}">
					<img src="${ item.image1 }" class="content__image" />
				</c:if>
			</div>
			<!-- POST FOOTER -->
			<div class="post__footer footer">
				<p class="buttons__comment comment">${ item.totalComment } bình
					luận</p>
				<!-- Buttons -->
				<div class="footer__buttons buttons">
					<span class="buttons__comment comment"><a
						href="<c:url value='/community/${item.title}'/>">Xem chi tiết</a>
					</span>
				</div>
			</div>

		</div>
	</div>
</c:forEach>
<script type="text/javascript">
		var element = document.getElementById("date");
		moment(date).locale('vi').fromNow();
	</script>
<script type="text/javascript">
		
		
	</script>