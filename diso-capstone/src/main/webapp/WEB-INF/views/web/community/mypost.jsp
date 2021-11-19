<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<h1>helo</h1>
	<h1>${ mypost.size() }</h1>
	<%-- <div style="border: 1px solid black">
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
	</div> --%>
	<c:forEach var="item" items="${ mypost }">
		<div style="border: 1px solid black">
			<button onclick="deletePost(${ item.id })">Xoa bai dang</button>
			<a href="<c:url value='/post?id=${ item.id }'/>">EDIT</a>
			<h1>${ item.id}</h1>
			<a href="<c:url value='/community/${  item.title }' />"><h2>${item.title}</h2></a>
			<%-- <p>${item.content}</p> --%>
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
</body>