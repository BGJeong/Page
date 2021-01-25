<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.profile-img {
	text-align:center;
}

.profile-img img {
	width: 70%;
	height: 100%;
}

.profile-img .file {
	position: relative;
	overflow: hidden;
	margin-top: -20%;
	width: 70%;
	border: none;
	border-radius: 0;
	font-size: 15px;
	background: #212529b8;
}

.profile-img .file input {
	position: absolute;
	opacity: 0;
	right: 0;
	top: 0;
}
.dropdown-toggle::after {
	content: none;
}

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
	<form method="post" action="edit_ok.do"
		enctype="multipart/form-data" class="mt-3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 ">
					<div class="list-group ">
						<a href="edit.do"
							class="list-group-item list-group-item-action active">프로필 수정</a>
						<a href="editPass.do"
							class="list-group-item list-group-item-action">비밀번호 변경</a>
						<a href="retire.do"
							class="list-group-item list-group-item-action">회원 탈퇴</a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="card" style="position:unset;">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<h4>Your Profile</h4>
									<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-4">
										
									</div>
									<div class="form-group row">
										<label for="username" class="col-4 col-form-label">Profile Image</label>
										<div class="col-8">
											<div class="profile-img col-8">
											<img
												src="<%=request.getContextPath() %>/upload/${dto.profile_img}"
												alt=""/ class="profileimg">
											<div class="file btn btn-lg btn-primary">
												Change Photo <input type="file" onchange="readURL(this);" accept="image/*"  name="profile" />
											</div>
										</div>
										</div>
									</div>
									<div class="form-group row">
										<label for="username" class="col-4 col-form-label">User
											ID</label>
										<div class="col-8">
											<input value="${dto.userid }" id="username" name="userid"
												placeholder="Username" class="form-control here"
												required="required" type="text" readonly>
										</div>
									</div>
									<div class="form-group row">
										<label for="text" class="col-4 col-form-label">Nick
											Name</label>
										<div class="col-8">
											<input value="${dto.nickname }" id="nickname" name="nickname"
												placeholder="Nick Name" class="form-control here"
												type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="birth" class="col-4 col-form-label">birth</label>
										<div class="col-8">
											<input value="${dto.birth }" id="birth" name="birth"
												placeholder="birth" class="form-control here"
												type="date" value="0000-00-00">
										</div>
									</div>
									<div class="form-group row">
										<label for="email" class="col-4 col-form-label">email</label>
										<div class="col-8">
											<input value="${dto.email }" id="email" name="email"
												placeholder="Email" class="form-control here"
												required="required" type="text" readonly>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="offset-4 col-8">
										<button name="submit" type="submit" class="btn btn-primary">프로필
											저장하기</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
	</form>
</body>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {
				$('.profileimg').attr('src', e.target.result);
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







