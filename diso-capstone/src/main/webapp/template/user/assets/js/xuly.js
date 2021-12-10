

function addComment(postId, userId) {
	fetch("/diso-capstone/api/comment", {
		method: 'POST',
		body: JSON.stringify({
			"postId": postId,
			"userId": userId,
			"content": document.getElementById("commentId").value
		}),
		headers: {
			"Content-Type": "application/json"
		}
	}).then(function(res) {
		return res.json();
	}).then(function(data) {
		console.info(data);
		
		let area = document.getElementById("commentArea");
		area.innerHTML = `
			<div id="comment${ data.id}" class="comments__friend-comment friend-comment " style="margin-bottom:5px;">
				<img src="${ data.avatar}" class="friend-comment__pic" />
				<div class="friend-comment__comment comment">
					<span>
						<a href="#" class="comment__author">${ data.firstName} ${ data.lastName }</a>
						<i class="date-now">vài giây trước</i>
					</span>
					<span class="comment__content"> ${ data.content} </span>
				</div>
				<button type="button" class="btn" data-bs-toggle="dropdown" aria-expanded="false">
					<div class="friend-comment__options options">
						<i class=" bi bi-three-dots options__icon options__comment"></i>
					</div>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" onclick="deleteComment(${ data.id})" >Xóa Bình Luận </a>
				</div>			
			</div>
		` + area.innerHTML;
	});
	document.getElementById(`commentId`).value = "";
}
function deleteComment(commentId) {
	fetch("/diso-capstone/api/comment", {
		method: 'DELETE',
		body: JSON.stringify({
			"id": commentId
		}),
		headers: {
			"Content-Type": "application/json"
		}
	}).then(function(res) {
		return res.json();
	}).then(function(data) {
		console.info(data);
		document.getElementById(`comment${commentId}`).style.display = "none";

	});
}
function deletePost(postId) {
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
function warningBeforeDelete(id) {
	Swal.fire({
		text: "Bạn có chắc chắn muốn xóa bài viết này!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Có!',
		cancelButtonText: 'Không!'
	}).then((result) => {
		if (result.isConfirmed) {
			deletePost(id);
		}
	})
}
function changePassword(userId) {
	fetch("/diso-capstone/api/account", {
		method: 'PUT',
		body: JSON.stringify({
			"userId": userId,
			"password": document.getElementById("password").value,
			"newPassword": document.getElementById("newPassword").value,
			"confirmPassword": document.getElementById("confirmPassword").value
		}),
		headers: {
			"Content-Type": "application/json"
		}
	}).then(function(res) {
		return res.json();
	}).then(function(data) {
		console.info(data);
		let message = document.getElementById('message');
		let status = document.getElementById('status');
		let password = document.getElementById("password").value;
		let newPassword = document.getElementById("newPassword").value;
		let confirm = document.getElementById("confirmPassword").value;
		if (newPassword != confirm) {
			message.innerHTML = `Xác nhận mật khẩu sai`
			status.style.display = 'block';
			document.getElementById('mess').style.display = 'block';
			document.getElementById("password").value = ''
			document.getElementById("newPassword").value = ''
			document.getElementById("confirmPassword").value = ''
		}
		else if (data == 1) {
			document.getElementById('status').innerText = 'Cập nhập Thành Công ';
			document.getElementById('status').style.display = 'block';
			document.getElementById('mess').style.display = 'none';
			message.innerHTML = ``
			document.getElementById("password").value = ''
			document.getElementById("newPassword").value = ''
			document.getElementById("confirmPassword").value = ''
		}
		else {
			document.getElementById('message').innerHTML = `Mật khẩu hiện tại không đúng`;
			document.getElementById('status').style.display = 'block';
			document.getElementById('mess').style.display = 'block';
			document.getElementById("password").value = ''
			document.getElementById("newPassword").value = ''
			document.getElementById("confirmPassword").value = ''
		}

	})
}
function reportAccount(userid){
	fetch("/diso-capstone/api/account/report", {
		method: 'POST',
		body: userid,
		headers: {
			"Content-Type": "application/json"
		}
	}).then(function(res) {
		return res.json();
	}).then(function(data){
		if(data == 1){
			console.log("report success");
			$("#mess").fadeIn();
    		setTimeout(function() { $("#mess").fadeOut(1500); }, 1000)
			
		}
	})
}
function reportPost(postId){
	fetch("/diso-capstone/api/post/report", {
		method: 'POST',
		body: postId,
		headers: {
			"Content-Type": "application/json"
		}
	}).then(function(res) {
		return res.json();
	}).then(function(data){
		if(data == 1){
			console.log("report success");
			$("#mess").fadeIn();
    		setTimeout(function() { $("#mess").fadeOut(1500); }, 1000)
			
		}
	})
}
