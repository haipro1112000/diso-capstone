<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
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
					<a href="#"> <img
						src="https://res.cloudinary.com/nguyenhai/image/upload/v1636880416/default-avatar_bjg40e.jpg"
						alt="Anh dai dien" class="post__author-pic" />
					</a>
					<div class="post__author author">
						<span class="author__name"> <a href="#">${ post.firstName}${ post.lastName }</a>
						</span> <i class="author__verified"></i>
					</div>
					<span class="post__date"> <i>${ post.createAt}</i>
					</span> <span class="post__date-privacy-separator">&nbsp;·</span> <i
						class="post__privacy"></i>
				</div>
				<!-- Header right -->
				<div class="header__right">
					<div class="post__options options">
						<i class="fas fa-ellipsis-h"></i>
					</div>
				</div>
			</div>
			<!-- POST CONTENT -->
			<div class="post__content content">
				<div class="post-title">
					<h2>${post.title}</h2>
				</div>
				<div class="content__paragraph">${ post.content }</div>
				<img src="${ post.image1 }" class="content__image" />
			</div>
			<!-- POST FOOTER -->
			<div class="post__footer footer">

				<!-- Buttons -->
				<div class="footer__buttons buttons">
					<span class="buttons__like like"> <i class="like__icon"></i>Bình
						luận
					</span>

				</div>

				<!-- Comments -->
				<div class="footer__comments comments">
					<!-- Comments filter -->

					<!-- Comments box -->
					<div class="comments__box box">
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
					</div>

					<div id="commentArea">
						<c:forEach var="item" items="${ comment }">
							<div id="comment${ item.id }" class="comments__friend-comment friend-comment">
								<img
									src="https://res.cloudinary.com/nguyenhai/image/upload/v1636880416/default-avatar_bjg40e.jpg"
									class="friend-comment__pic" />
								<div 
									class="friend-comment__comment comment">
									<a href="#" class="comment__author">${ item.firstName}${ item.lastName }</a>
									<span class="comment__content"> ${ item.content } </span>
								</div>
								<c:if test="${ loginInfo.id == item.userId }">
									<input type="button" onclick="deleteComment(${ item.id })"
										value="Xoa binh luan" />
								</c:if>
							</div>
					

						</c:forEach>
					</div>



					<div class="comments__more-comments more-comments">
						<span class="more-comments__link"> <a href="#">View
								more comments</a>
						</span>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%-- <i>${ moment(data.createAt, "YYYY-MM-DD hh:mm:ss").locale('vi').fromNow()}</i> --%>
	<script type="text/javascript">

</script>

</body>