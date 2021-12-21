<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>${ post.title }</title>
</head>
<body>
	<div class="container-viewpost-detail">
		<div class="post">
			<!-- POST HEADER -->
			<div class="post__header header">
				<!-- header left -->
				<div class="header__left">
					<%-- <a href="<c:url value="/community/user/${ post.userId }"/>"> <img
						src="${ post.avatar }" alt="Anh dai dien" class="post__author-pic"
						target="_blank" />
					</a>
					<div class="post__author author">
						<span class="author__name"> <a
							href="<c:url value="/community/user/${ post.userId }"/>">${ post.firstName}
								${ post.lastName }</a>
						</span> <i class="author__verified"></i>
					</div> --%>
					<c:if test="${ loginInfo.id == post.userId }">
						<a href="<c:url value="/profile"/>"> <img
							src="${ post.avatar }" class="post__author-pic" />
						</a>
						<div class="post__author author">
							<span class="author__name"> <a
								href="<c:url value='/profile'/>">${ post.firstName } ${ post.lastName }</a>
							</span> <i class="author__verified"></i>
						</div>
					</c:if>

					<c:if test="${ loginInfo.id != post.userId }">
						<a href="<c:url value="/community/user/${ post.userId }"/>"> <img
							src="${ post.avatar }" class="post__author-pic" />
						</a>
						<div class="post__author author">
							<span class="author__name"> <a
								href="<c:url value="/community/user/${ post.userId }"/>">${ post.firstName }
									${ post.lastName }</a>
							</span> <i class="author__verified"></i>
						</div>
					</c:if>
					<c:if test="${post.createAt != post.updateAt}">
						<span class="post__date"> <i class="date-now">${post.updateAt}</i>
							đã chỉnh sửa
						</span>
					</c:if>
					<c:if test="${post.createAt == post.updateAt}">
						<span class="post__date"> <i class="date-now">${post.createAt}</i>
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
						<c:if test="${ loginInfo.id == post.userId }">
							<a class="dropdown-item"
								href="<c:url value='/post?id=${ post.id }'/>">Chỉnh sửa</a>
						</c:if>
						<c:if test="${ loginInfo.id != post.userId }">
							<a class="dropdown-item" onclick="reportPost(${ post.id })">Báo
								cáo spam</a>
						</c:if>

						<!-- <div class="dropdown-divider"></div> -->
						<%-- <a class="dropdown-item" onclick="deletePost(${ item.id })">Xóa</a> --%>
					</div>
				</div>
			</div>
			<!-- POST CONTENT -->
			<div class="post__content content">
				<div class="post-title">
					<h2>${post.title}</h2>
				</div>
				<div class="content__paragraph">${ post.content }</div>
				<c:if test="${ post.image1 != 'null'}">
					<a href="${ post.image1 }" target="_blank"><img
						src="${ post.image1 }" class="content__image" /></a>

				</c:if>
			</div>
			<!-- POST FOOTER -->
			<div class="post__footer footer">

				<!-- Buttons -->
				<div class="footer__buttons buttons">
					<label class="buttons__comment comment" for="commentId"> <i
						class="comment__icon"></i>Bình luận
					</label>

				</div>

				<!-- Comments -->
				<div class="footer__comments comments">
					<c:if test="${ loginInfo != null }">
						<div class="comments__box box">
							<div class="box__profile profile">
								<img src="${ loginInfo.avatar }" class="profile__pic" />
							</div>
							<form class="box__bar bar">
								<input id="commentId" type="text"
									placeholder="Viết bình luận..." class="bar__input" />
								<div class="bar__emojis emojis">
									<input type="button" class="emojis__attach attach"
										onclick="addComment(${ post.id }, ${ loginInfo.id })">
									<!-- <i class="fas fa-paper-plane"></i> -->
								</div>
							</form>
						</div>
					</c:if>
					<c:if test="${ loginInfo == null }">
						<div class="comments__box box">

							<a href="<c:url value='/login'/>">Đăng Nhập để bình luận</a>
						</div>
					</c:if>


					<div id="commentArea" class="comment-box">
						<c:forEach var="item" items="${ comment }">
							<div class="user-comment-box" style="display: none;">
								<div id="comment${ item.id }"
									class="comments__friend-comment friend-comment"
									style="margin-bottom: 5px;">
									<c:if test="${ loginInfo.id == item.userId }">
										<img src="${ item.avatar }" class="friend-comment__pic" />
										<div class="friend-comment__comment comment">
											<span> <a href="<c:url value='/profile'/>"
												class="comment__author">${ item.firstName} ${ item.lastName }</a>
												<i class="date-now">${ item.createAt}</i>
											</span> <span class="comment__content"> ${ item.content } </span>
										</div>
									</c:if>
									<c:if test="${ loginInfo.id != item.userId }">
										<img src="${ item.avatar }" class="friend-comment__pic" />
										<div class="friend-comment__comment comment">
											<span> <a
												href="<c:url value='/community/user/${ item.userId }'/>"
												class="comment__author">${ item.firstName} ${ item.lastName }</a>
												<i class="date-now">${ item.createAt}</i>
											</span> <span class="comment__content"> ${ item.content } </span>
										</div>
									</c:if>

									<button type="button" class="btn" data-bs-toggle="dropdown"
										aria-expanded="false">
										<div class="friend-comment__options options">
											<i class=" bi bi-three-dots options__icon options__comment"></i>
										</div>
									</button>
									<c:if
										test="${ loginInfo.id == item.userId || loginInfo.id == post.userId }">
										<div class="dropdown-menu">
											<a class="dropdown-item"
												onclick="deleteComment(${ item.id })">Xóa Bình Luận </a>
											<c:if test="${ loginInfo.id != item.userId }">
												<a class="dropdown-item"
													onclick="reportAccount(${ item.userId })">Báo cáo spam
												</a>
											</c:if>
										</div>
									</c:if>

									<c:if test="${ loginInfo.id != item.userId }">
										<div class="dropdown-menu">
											<a class="dropdown-item"
												onclick="reportAccount(${ item.userId })">Báo cáo spam </a>
										</div>
									</c:if>
									<%-- <div class="dropdown-menu">
									<a class="dropdown-item" onclick="deleteComment(${ item.id })">Xóa
										Bình Luận </a>
								</div> --%>
									<%-- <c:if test="${ loginInfo.id == item.userId || loginInfo.id == post.userId }">
									<button type="button" class="btn" data-bs-toggle="dropdown"
										aria-expanded="false">
										<div class="friend-comment__options options">
											<i class=" bi bi-three-dots options__icon options__comment"></i>
										</div>
									</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" onclick="deleteComment(${ item.id })">Xóa
											Bình Luận </a>
									</div>
								</c:if>
								<c:if test="${ loginInfo.id != item.userId }">
									<button type="button" class="btn" data-bs-toggle="dropdown"
										aria-expanded="false">
										<div class="friend-comment__options options">
											<i class=" bi bi-three-dots options__icon options__comment"></i>
										</div>
									</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" onclick="">Báo cáo spam </a>
									</div>
								</c:if> --%>

								</div>
							</div>


						</c:forEach>
						<!-- More comments -->
						<c:if test="${ comment.size() > 5 }">
							<div class="comments__more-comments more-comments see-more">
								<span class="more-comments__link"> <a href="#">Xem
										thêm bình luận</a>
								</span>
								<!-- <span class="more-comments__count">1 của 10</span> -->
							</div>
						</c:if>



					</div>




				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function(){
	       // select the first 5 hidden divs
	    
			$( ".comment-box" ).each(function( index ) {
			 	$(this).children(".user-comment-box").slice(0,5).show();
			});
			
	        $(".see-more").click(function(e){ // click event for load more
	            e.preventDefault();
	            var done = $('<div class="comments__more-comments=done more-comments=done"><div>');
	            $(this).siblings(".user-comment-box:hidden").slice(0,5).show(); // select next 5 hidden divs and show them
	            if($(this).siblings(".user-comment-box:hidden").length == 0){ // check if any hidden divs
	                $(this).replaceWith(done); // if there are none left
	            }
	        });
		});
	</script>

</body>