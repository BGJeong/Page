<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

body {
	background-color: #fafafa;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	 function pwfindCheck() {
		
	
		if($("#id").val()==""){
			alert("ID를 입력해주세요")
			$("#id").focus();
			return false;
		}
		
		//이메일 표현식
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//정규표현식 검사
		if(!emailRule.test($("#email").val())){

			alert("정확한 email을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		
	};
	
	
	 
		
</script>

<title>pw 찾기</title>
</head>
<body>
<form action="pwfind.do" method="post" onsubmit="return pwfindCheck()">
<table align=center>
	<div class="container">
			<div class="row mt-5"></div>
			<div class="row mt-5"></div>
			<div class="row mt-5"></div>
			<div class="row mt-5"></div>
			<div class="row mt-5">
				<div class="col-4"></div>
				<div class="col-4" align="center">
					<h1>비밀번호 찾기</h1>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row mt-3">
				<div class="col-4"></div>
				<div class="col-4">
					<div>
						<input name="userid" type="text" class="form-control" id="id"
							placeholder="ID를 입력 해주세요">
					</div>
					<label class="id_label" style="display: none;"></label>
				</div>
				
				<div class="col-4"></div>
				
			</div>
			<div class="row mt-3">
				<div class="col-4"></div>
				<div class="col-4">
					<div>
						<input name="email" type="text" class="form-control"
							id="email" placeholder="이메일을 입력 해주세요">
					</div>
					<label class="pawd_label" style="display: none;"></label>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row mt-3">
				<div class="col-4"></div>
				<div class="col-4">
					<input id="login" type="submit"
						class="btn btn-dark btn-lg btn-block" value="임시 비밀번호 발급" />
				</div>
				<div class="col-4"></div>
			</div>
			<div class="mt-3" style="text-align: center">
				<a href="join.do">회원가입</a> &nbsp;&nbsp;&nbsp; <a
					href="login.do">로그인</a> &nbsp;&nbsp;&nbsp; 
			</div></div>
			
	

</table>



</form>
</body>
</html>