<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
body {
	font-family: sans-serif;
	background-color: #eeeeee;
}

.file-upload {
	background-color: #ffffff;
	width: 300px;
	margin: 0 auto;
	padding: 20px;
}

.file-upload-btn {
	width: 100%;
	margin: 0;
	color: #fff;
	background: #1FB264;
	border: none;
	padding: 10px;
	border-radius: 4px;
	border-bottom: 4px solid #15824B;
	transition: all .2s ease;
	outline: none;
	text-transform: uppercase;
	font-weight: 700;
}

.file-upload-btn:hover {
	background: #b5bfba;
	color: #b5bfba;
	transition: all .2s ease;
	cursor: pointer;
}

.file-upload-btn:active {
	border: 0;
	transition: all .2s ease;
}

.file-upload-content {
	display: none;
	text-align: center;
}

.file-upload-input {
	position: absolute;
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	outline: none;
	opacity: 0;
	cursor: pointer;
}

.image-upload-wrap {
	/* margin-top: 20px; */
	border: 4px dashed #b5bfba;
	position: relative;
}

.image-dropping, .image-upload-wrap:hover {
	background-color: #e6f5ed;
	border: 4px dashed #ffffff;
}

.image-title-wrap {
	padding: 0 15px 15px 15px;
	color: #222;
}

.drag-text {
	text-align: center;
}

.drag-text h3 {
	font-weight: 100;
	text-transform: uppercase;
	color: #b5bfba;
	padding: 60px 0;
}

.file-upload-image {
	max-height: 200px;
	max-width: 200px;
	margin: auto;
	padding: 20px;
}

.remove-image {
	width: 200px;
	margin: 0;
	color: #fff;
	background: #e66363;
	border: none;
	padding: 10px;
	border-radius: 4px;
	border-bottom: 4px solid #b02818;
	transition: all .2s ease;
	outline: none;
	text-transform: uppercase;
	font-weight: 700;
}

.remove-image:hover {
	background: #c13b2a;
	color: #ffffff;
	transition: all .2s ease;
	cursor: pointer;
}

.remove-image:active {
	border: 0;
	transition: all .2s ease;
}
</style>
</head>
<body>
	<form name="file_up" method="post" action="edit_ok.do" enctype="multipart/form-data">
		<div class="container mt-3" align="center">
			<h3>프로필 편집</h3>
			<div class="row">
				<div class="col-4">사진</div>
				<div class="col-4">
					<div class="file-upload">
						<div class="image-upload-wrap">
							<input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*"  name="profile"/>
							<div class="drag-text">
								<h3>+</h3>
							</div>
						</div>
						<div class="file-upload-content">
							<img class="file-upload-image" src="#" alt="your image" />
							<div class="image-title-wrap">
								<button type="button" onclick="removeUpload()" class="remove-image">
									지우기 <span class="image-title">Uploaded Image</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>아이디</span>
					</div>
					<div class="col-4">
						<input name="userid" type="text" class="form-control" value="${dto.userid }" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>비밀번호</span>
					</div>
					<div class="col-4">
						<input name="passwd" type="text" class="form-control" value="${dto.passwd }">
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>이메일</span>
					</div>
					<div class="col-4">
						<input name="email" type="text" class="form-control" value="${dto.email }">
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>닉네임</span>
					</div>
					<div class="col-4">
						<input name="nickname" type="text" class="form-control" value="${dto.nickname }">
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>생일</span>
					</div>
					<div class="col-4">
						<input name="birth" type="text" class="form-control" value="${dto.birth }">
					</div>
				</div>

			</div>
			<div class="row">
				<input type="submit" class="btn btn-primary"  value="저장">
			
			</div>
		</div>
	</form>
</body>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {
				$('.image-upload-wrap').hide();

				$('.file-upload-image').attr('src', e.target.result);
				$('.file-upload-content').show();

				$('.image-title').html(input.files[0].name);
			};

			reader.readAsDataURL(input.files[0]);

		} else {
			removeUpload();
		}
	}

	function removeUpload() {
		$('.file-upload-input').replaceWith($('.file-upload-input').clone());
		$('.file-upload-content').hide();
		$('.image-upload-wrap').show();
	}
	$('.image-upload-wrap').bind('dragover', function() {
		$('.image-upload-wrap').addClass('image-dropping');
	});
	$('.image-upload-wrap').bind('dragleave', function() {
		$('.image-upload-wrap').removeClass('image-dropping');
	});
</script>
</html>







