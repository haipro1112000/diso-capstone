<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<%-- <h1>helo</h1>
	<h1>${ post.size() }</h1>
	
	<c:forEach var="item" items="${ post }">
		<div style="border: 1px solid black">
			<h1>${ item.id}</h1>
			<h2>${ item.firstName } ${ item.lastName }</h2>
			<a href="<c:url value='/community/${  item.title }' />"><h2>${item.title}</h2></a>
			<p>${item.content}</p>
			<i>${ item.createAt}</i>
			<p>${ item.totalComment }</p>
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
	</c:forEach> --%>

	<c:forEach var="item" items="${ post }">
		<div class="container-viewpost-detail">
			<div class="post">
				<!-- POST HEADER -->
				<div class="post__header header">
					<!-- header left -->
					<div class="header__left">
						<a href="#"> <img
							src="https://res.cloudinary.com/nguyenhai/image/upload/v1636880416/default-avatar_bjg40e.jpg"
							class="post__author-pic" />
						</a>
						<div class="post__author author">
							<span class="author__name"> <a href="#">${ item.firstName }
									${ item.lastName }</a>
							</span> <i class="author__verified"></i>
						</div>
						<span class="post__date"> <i>${item.createAt}</i>
						</span> <span class="post__date-privacy-separator">&nbsp;·</span> <i
							class="post__privacy"></i>
					</div>
					<!-- Header right -->
					<div class="header__right">
						<div class="post__options options">
							<i class="options__icon"></i>
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

	<!-- <div class="container-viewpost-detail">
        <div class="post">
            POST HEADER
            <div class="post__header header">
                header left
                <div class="header__left">
                    <a href="#">
                        <img src="./images/author-pic.jpg" class="post__author-pic" />
                    </a>
                    <div class="post__author author">
                        <span class="author__name">
                            <a href="#">Bui Huu Nghia</a>
                        </span>
                        <i class="author__verified"></i>
                    </div>
                    <span class="post__date">
                        <a href="#">November 05, 2021</a>
                    </span>
                    <span class="post__date-privacy-separator">&nbsp;·</span>
                    <i class="post__privacy"></i>
                </div>
                Header right
                <div class="header__right">
                    <div class="post__options options">
                        <i class="options__icon"></i>
                    </div>
                </div>
            </div>
            POST CONTENT
            <div class="post__content content">
                <div class="post-title">
                    <h2>Facebook's Oculus Quest 2 starts shipping today! It's another big
                       </h2>
                </div>
                <p class="content__paragraph">
                    Facebook's Oculus Quest 2 starts shipping today! It's another big
                    step forward for VR. I've been using mine all summer and I'm looking
                    forward to more of you experiencing this.
                </p>
                <img src="images/post-pic.jpg" class="content__image" />
            </div>
            POST FOOTER
            <div class="post__footer footer">
                <p class="buttons__comment comment">10 bình luận</p>
                Buttons
                <div class="footer__buttons buttons">
                    <span class="buttons__comment comment"><a href="viewpost-detail.html">Xem chi tiết</a> </span>
                </div>
            </div>
        </div>
    </div> -->



</body>