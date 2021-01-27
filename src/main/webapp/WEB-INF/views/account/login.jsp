<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<style>
a:hover {
	color: #545b62;
}

a {
	color: #545b62;
	text-decoration: none;
	background-color: transparent;
}
h1 {
	color: #545b62
}
label {
	color: #545b62
}
body {
	background-color: #fafafa;
}
</style>
<title>페이지</title>
</head>
<body>
	<form method="post" action="loginAction.do">
		<div class="container mt-5" style="width:300px; margin:auto; ">
			<div class="mb-3 mt-5" style="text-align:center;">
				<img src="https://cdn.jsdelivr.net/gh/bgjeong/cdn/logo.png">
			</div>
			<div class="mb-3" style="text-align:center;"><h1> Log in</h1></div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">I D</label> 
				<input name="userid" type="text" class="form-control" id="exampleFormControlInput1" placeholder="I  D">
			</div>
			<div class="mb-3 mt-1">
				<label for="exampleFormControlInput1" class="form-label">Password</label> 
				<input name="passwd" type="password" class="form-control" id="exampleFormControlInput1" placeholder="Password">
			</div>
			<div class="mb-3">
					<input id="login" type="submit"
						class="btn btn-dark btn-lg btn-block" value="로그인" />
				</div>
			<div class="mt-3" style="text-align: center; font-size:small;">
				<a href="join.do">회원가입</a> |
				<a href="idfindform.do">아이디 찾기</a> |
				<a href="pwfindform.do">비밀번호 찾기 </a>
			</div>
			<div class="mt-3" id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="250"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
				</a>
			</div>
			<div class="mt-3" id="kakao_id_login" style="text-align: center">
				<a href="${kakao_url}"> 
					<img width="250" height="59" src="img/kakao_login_medium_narrow.png" />
				</a> 
			</div>
		</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>