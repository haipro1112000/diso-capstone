$(document).ready(function() {

	$nav = $('.nav');
	$toggleCollapse = $('.toggle-collapse');

	/* click event on toggle menu*/
	$toggleCollapse.click(function() {
		$nav.toggleClass('collapse');
	});

	$('.account-icon').click(function() {
		$('.account-menu').toggle();
	});

	$('.sign').click(function() {
		$('.form-container').toggleClass('active');
	})
});
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
			<div class="dateComment" style="border: 1px solid black">
					<h4>${ data.firstName} ${data.lastName}</h4>
					<i>${ moment(data.createAt, "YYYY-MM-DD hh:mm:ss").locale('vi').fromNow()}</i>
					<p>${ data.content}</p>
					<input type="button" onclick="deleteComment(${ data.id})"
							value="Xoa binh luan" />
				
			</div>
		` + area.innerHTML;
	});
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
		let comment = document.getElementById(`comment${ commentId }`);
		comment.style.display = "none";
	});
}


