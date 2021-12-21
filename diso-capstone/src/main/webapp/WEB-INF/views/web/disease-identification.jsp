<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<head>
	<title>Phân Tích Bệnh</title>
</head>	
<body>
	<div class="container-disease-ide">
        <div class="title">
            <h1>CÔNG NGHỆ XÁC ĐỊNH BỆNH TRÊN CÂY HOA LAN</h1>
            <h3>Xác định bệnh hoa lan và cách điều trị chỉ sau một cái nhấp chuột!</h3>
        </div>
        <div class="wrapper">
            <div class="icon">
                <i class="up bi bi-cloud-arrow-up"></i>
                <i class="close bi bi-x-lg"></i>
                
            </div>
            <div id="text">Chưa có ảnh nào được chọn!</div>
            <div class="img">
                <img id="imagebox" src="" alt="">
            </div>
            <input type="file" accept="image/*" name="image" id="file" onchange="loadFile(event)">
            <label for="file" class="upload btn btn-ide">Tải ảnh lên</label>
        </div>
        <div class="container-disease-ide-btn">
            <button id="sendbutton" class="btn btn-ide"> Phân tích </button>
        </div>
         <h1 id="test"><span id="benh"></span> </h1>
         <!-- <a id="disease" href="" style="display:none;">Xem benh tai day</a> -->
         <c:url var="disease" value="/identify"/>
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
<script>
window.onload = () => {
	$('#sendbutton').click(() => {
		imagebox = $('#imagebox')
		input = $('#file')[0]
		if(input.files && input.files[0])
		{
			let formData = new FormData();
			formData.append('image' , input.files[0]);
			$.ajax({
				url: "http://localhost:5000/detectObject", // fix this to your liking
				type:"POST",
				data: formData,
				cache: false,
				processData:false,
				contentType:false,
				error: function(data){
					console.log("upload error" , data);
					console.log(data.getAllResponseHeaders());
				},
				success: function(data){
					console.log(data);
					bytestring = data['status']
					// image = bytestring.split('\'')[1]
					imagebox.attr('src' , 'data:image/jpeg;base64,'+ bytestring.split('\'')[1])
					test = document.getElementById("benh");
					benh = data['Ten']
					let link = document.getElementById('disease');
					
					
					link.style.display = "block";
					if(data['Ten'] == null)
						test.innerText = "Không nhận dạng được bệnh vui lòng thử lại";
					if(data['Ten'] == '0'){
						test.innerText = "Bệnh nhện đỏ";
						link.href = `${ disease }/1`;
						window.location.href = "${ disease }/1";
					}
					else if(data['Ten'] == '1'){
						test.innerText = "Bệnh rệp sáp";
						link.href = `${ disease }/2`;
						window.location.href = "${ disease }/2";
					}
					else if(data['Ten'] == '2'){
						test.innerText = "Benh thán thư";
						link.href = `${ disease }/3`;
						window.location.href = "${ disease }/3";
					}
						
					else 
						test.innerText = "Không nhận dạng được bệnh vui lòng thử lại";
				}
			});
		}
	});
};
</script>
</body>
