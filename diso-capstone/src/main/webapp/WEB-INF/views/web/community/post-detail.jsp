<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Bài Viết Chi Tiết</title>
</head>
<body>
	<!-- <div id="mess" style="position: fixed;
  left: 490px;
  top: 78px;
  display:none;
  color: white;
  background: black;
  ">
	<h1>Cảm ơn đóng góp của bạn</h1>
</div> -->
	<%-- <div style="border: 1px solid black">
		<h1>${ post.id}</h1>
		<a href="<c:url value='/post/${  post.title }' />"><h2>${post.title}</h2></a>

		<h4>${ post.firstName}${ post.lastName }</h4>
		<i>${ post.createAt}</i>
		<p>${ post.content }</p>
		<c:if test="${ post.image1 != 'null'}">
			<a href="${ post.image1 }" target="_blank"><img
				src="${ post.image1 }" alt="" width="100px" height="100px"></a>
		</c:if>
		<c:if test="${ post.image2 != 'null'}">
			<a href="${ post.image2 }" target="_blank"><img
				src="${ post.image2 }" alt="" width="100px" height="100px"></a>
		</c:if>
		<c:if test="${ post.image3 != 'null'}">
			<a href="${ post.image3 }" target="_blank"><img
				src="${ post.image3 }" alt="" width="100px" height="100px"></a>
		</c:if>

		<h1>${ comment.size() }</h1>

		<form>
			<div class="form-group">
				<textarea id="commentId" class="form-control" cols="10" rows="5"></textarea>
				<br> <input type="button"
					onclick="addComment(${ post.id }, ${ loginInfo.id })"
					value="Binh luan" width="100px" />
			</div>
		</form>
		<div id="commentArea">
			<c:forEach var="item" items="${ comment }">
				<div id="comment${ item.id }" class="dateComment"
					style="border: 1px solid black">
					<h4>${ item.firstName}${ item.lastName }</h4>
					<i>${ item.createAt }</i>
					<p>${ item.content }</p>
					<c:if test="${ loginInfo.id == item.userId }">
						<input type="button" onclick="deleteComment(${ item.id })"
							value="Xoa binh luan" />
					</c:if>

				</div>
			</c:forEach>
		</div>
	</div> --%>

	<div class="container-viewpost-detail">
		<div class="post">
			<!-- POST HEADER -->
			<div class="post__header header">
				<!-- header left -->
				<div class="header__left">
					<a href="#"> <img src="${ post.avatar }" alt="Anh dai dien"
						class="post__author-pic" />
					</a>
					<div class="post__author author">
						<span class="author__name"> <a href="#">${ post.firstName}
								${ post.lastName }</a>
						</span> <i class="author__verified"></i>
					</div>
					<span class="post__date"> <i class="date-now">${ post.createAt}</i>
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
						<c:if test="${ loginInfo.id == post.userId }">
							<a class="dropdown-item"
								href="<c:url value='/post?id=${ post.id }'/>">Chỉnh sửa</a>
						</c:if>
						<c:if test="${ loginInfo.id != post.userId }">
							<a class="dropdown-item" href="#">Báo cáo spam</a>
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
					<img src="${ post.image1 }" class="content__image" />
				</c:if>
			</div>
			<!-- POST FOOTER -->
			<div class="post__footer footer">

				<!-- Buttons -->
				<div class="footer__buttons buttons">
					<span class="buttons__comment comment"> <i
						class="comment__icon"></i>Bình luận
					</span>

				</div>

				<!-- Comments -->
				<div class="footer__comments comments">
					<!-- Comments filter -->

					<!-- Comments box -->
					<%-- <div class="comments__box box">
						<div class="box__profile profile">
							<img
								src="https://res.cloudinary.com/nguyenhai/image/upload/v1636880416/default-avatar_bjg40e.jpg"
								class="profile__pic" />
						</div>
						<form class="box__bar bar">
							<input id="commentId" type="text" placeholder="Viết bình luận..."
								class="bar__input" />
							<div class="bar__emojis emojis">
								<input type="button" class="emojis__attach attach"
									onclick="addComment(${ post.id }, ${ loginInfo.id })">
								<!-- <i class="fas fa-paper-plane"></i> -->
							</div>
						</form>
					</div> --%>
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
									<img src="${ item.avatar }" class="friend-comment__pic" />
									<div class="friend-comment__comment comment">
										<span>
											<a href="#" class="comment__author">${ item.firstName} ${ item.lastName }</a>
											<i class="date-now">${ item.createAt}</i>
										</span>
										<span class="comment__content"> ${ item.content } </span>
									</div>
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
												<a class="dropdown-item" onclick="reportAccount(${ item.userId })">Báo cáo spam </a>
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
							</span> <!-- <span class="more-comments__count">1 của 10</span> -->
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