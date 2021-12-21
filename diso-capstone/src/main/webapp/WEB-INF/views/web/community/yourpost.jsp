<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<head>
<title>${ post[0].firstName } ${ post[0].lastName }</title>
</head>
<body>
<c:if test="${ post.isEmpty() }">
	<div style="height:360px;">
		<h1 style="padding-top:165px; text-align:center;">Người dùng hiện tại không có bài viết nào!!</h1>
	</div>
</c:if>
 <c:forEach var="item" items="${ post }">
		<div class="container-viewpost-detail">
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
								<span class="author__name"> <a
									href="<c:url value='/profile'/>">${ item.firstName } ${ item.lastName }</a>
								</span>
								<i class="author__verified"></i>
							</c:if>
							<c:if test="${ loginInfo.id != item.userId }">
								<span class="author__name"> <a href="#">${ item.firstName }
										${ item.lastName }</a>
								</span>
								<i class="author__verified"></i>
							</c:if>
						</div>
						<c:if test="${item.createAt != item.updateAt}">
							<span class="post__date"> <i class="date-now">${item.updateAt}</i> đã chỉnh sửa
							</span>
						</c:if>
						<c:if test="${item.createAt == item.updateAt}">
							<span class="post__date"> <i class="date-now">${item.createAt}</i>
							</span>
						</c:if>
						<span class="post__date-privacy-separator">&nbsp;·</span> <i
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
							<c:if test="${ item.userId == loginInfo.id }">
								<a class="dropdown-item"
									href="<c:url value='/post?id=${ item.id }'/>">Chỉnh sửa</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" onclick="warningBeforeDelete(${ item.id })">Xóa</a>
							</c:if>
							<c:if test="${ item.userId != loginInfo.id }">
								<a class="dropdown-item" onclick="reportPost(${ item.id })">Báo cáo</a>
							</c:if>

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
						<a href="<c:url value='/community/${item.id}'/>"><img src="${ item.image1 }" class="content__image" /></a>
					</c:if>
				</div>
				<!-- POST FOOTER -->
				<div class="post__footer footer">
					<p class="buttons__comment comment">${ item.totalComment } bình
						luận</p>
					<!-- Buttons -->
					<div class="footer__buttons buttons">
						<span class="buttons__comment comment"><a
							href="<c:url value='/community/${item.id}'/>">Xem chi tiết</a>
						</span>
					</div>
				</div>

			</div>
		</div>
	</c:forEach>
</body>
