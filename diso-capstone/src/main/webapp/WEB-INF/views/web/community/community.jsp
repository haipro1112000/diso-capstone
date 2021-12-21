<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Cộng Đồng</title>
</head>
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
						<c:if test="${ loginInfo.id == item.userId }">
							<a href="<c:url value="/profile"/>">
								<img src="${ item.avatar }" class="post__author-pic" />
							</a>
							<div class="post__author author">
								<span class="author__name"> <a
									href="<c:url value='/profile'/>">${ item.firstName } ${ item.lastName }</a>
								</span> <i class="author__verified"></i>
							</div>
						</c:if>

						<c:if test="${ loginInfo.id != item.userId }">
							<a href="<c:url value="/community/user/${ item.userId }"/>">
								<img src="${ item.avatar }" class="post__author-pic" />
							</a>
							<div class="post__author author">
								<span class="author__name"> <a
									href="<c:url value="/community/user/${ item.userId }"/>">${ item.firstName }
										${ item.lastName }</a>
								</span> <i class="author__verified"></i>
							</div>
						</c:if>
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
								<a class="dropdown-item"
									onclick="warningBeforeDelete(${ item.id })">Xóa</a>
							</c:if>
							<c:if test="${ item.userId != loginInfo.id }">
								<a class="dropdown-item" onclick="reportPost(${ item.id })">Báo
									cáo</a>
							</c:if>

						</div>
					</div>
				</div>
				<!-- POST CONTENT -->
				<div class="post__content content">
					<div class="post-title">
						<h2>${item.title}</h2>
					</div>
					<div class="content__paragraph show-read-more${ item.id }">${item.content}</div>

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
							href="<c:url value='/community/${item.id}'/>">Xem chi tiết</a> </span>
					</div>
				</div>

			</div>
		</div>
		<script>
		    $(document).ready(function(){
		      var maxLength = 100;
		      $(`.show-read-more${ item.id }`).each(function(){
		        var myStr = $(this).text();
		        if($.trim(myStr).length > maxLength){
		          var newStr = myStr.substring(0, maxLength);
		          var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
		          $(this).empty().html(newStr);
		          $(this).append(` <a href="<c:url value='/community/${item.id}'/>" class="read-more">Xem thêm...</a>`);
		          // $(this).append('<span class="more-text">' + removedStr + '</span>');
		        }
		      });
		      $(".read-more").click(function(){
		        $(this).siblings(".more-text").contents().unwrap();
		        $(this).remove();
		      });
		    });
    </script>
	</c:forEach>

</body>