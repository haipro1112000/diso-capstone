

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
			<div id="comment${ data.id}" class="comments__friend-comment friend-comment">
				<img
					src="https://res.cloudinary.com/nguyenhai/image/upload/v1636880416/default-avatar_bjg40e.jpg"
					class="friend-comment__pic" />
				<div 
					class="friend-comment__comment comment">
					<a href="#" class="comment__author">${ data.firstName}${data.lastName}</a>
					<span class="comment__content"> ${ data.content} </span>
				</div>
				<button type="button" class="btn" data-bs-toggle="dropdown" aria-expanded="false">
					<div class="friend-comment__options options">
						<i class=" bi bi-three-dots options__icon options__comment"></i>
					</div>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" onclick="deleteComment(${ data.id })" >Xóa Bình Luận </a>
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
function changePassword(userId){
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
	}).then(function(data){
		console.info(data);
		let message = document.getElementById('message');
		let status = document.getElementById('status');
		let password = document.getElementById("password").value;
		let newPassword = document.getElementById("newPassword").value;
		let confirm = document.getElementById("confirmPassword").value;
		if(newPassword != confirm){
			message.innerHTML = `Xác nhận mật khẩu sai`
			status.style.display = 'block';
			document.getElementById('mess').style.display = 'block';
			document.getElementById("password").value=''
			document.getElementById("newPassword").value=''
			document.getElementById("confirmPassword").value=''
		}
		else if(data == 1){
			document.getElementById('status').innerText = 'Cập nhập Thành Công ';
			document.getElementById('status').style.display = 'block';
			document.getElementById('mess').style.display = 'none';
			message.innerHTML = ``
			document.getElementById("password").value=''
			document.getElementById("newPassword").value=''
			document.getElementById("confirmPassword").value=''
		}
		else{
			document.getElementById('message').innerHTML = `Mật khẩu hiện tại không đúng`;
			document.getElementById('status').style.display = 'block';
			document.getElementById('mess').style.display = 'block';
			document.getElementById("password").value=''
			document.getElementById("newPassword").value=''
			document.getElementById("confirmPassword").value=''
		}
		
	})
}

