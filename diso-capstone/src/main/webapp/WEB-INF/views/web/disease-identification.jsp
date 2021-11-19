<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<div class="container-disease-ide">
		<div class="title">
			<h1>CÔNG NGHỆ XÁC ĐỊNH BỆNH TRÊN CÂY HOA LAN</h1>
			<h3>Xác định bệnh hoa lan  chỉ sau một cái nhấp
				chuột!</h3>
		</div>
		<div class="wrapper">
			<div class="icon">
				<i class="up fas fa-cloud-upload-alt"></i> <i
					class="close fas fa-times"></i>
			</div>
			<div id="text">Chưa có ảnh nào được chọn!</div>
			<div class="img">
				<img src="" alt="">
			</div>
			<input type="file" accept="image/*" name="image" id="file"
				onchange="loadFile(event)"> <label for="file" class="upload">Tải
				ảnh lên</label>
		</div>
		<div class="container-disease-ide-btn">
			<button class="btn btn-ide">Phân tích</button>
		</div>

	</div>
	<script>
        const upload = document.querySelector("input");
        const uploadbtn = document.querySelector(".upload");
        const image = document.querySelector(".img img");
        const close = document.querySelector(".icon .close");

        var loadFile = function (event) {
            var image = document.querySelector(".img img");
            image.classList.add("active");
            close.classList.add("exit");
            // if user clicks on the browse file button it executes a command opening a pannel for the user to pick he's source file of the image
            image.src = URL.createObjectURL(event.target.files[0]);

            close.onclick = (e) => {
                image.classList.remove("active");
                close.classList.remove("exit");
            }
        }
</script>
</body>
