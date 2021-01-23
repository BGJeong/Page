<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>이메일 인증</title>
<style>
</style>
</head>
<body>
	<div class="container">
		<form method="post" action="login.do">
			<div class="row mt-5">
				<div class="col-4"></div>
				<div class="col-4" align="center">
					<h1>이메일 인증</h1>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row mt-3">
				<div class="col-4"></div>
				<div class="col-4">
					<div>이메일</div>
					<div class="">
						<input name="email" type="email" class="form-control" id="email" value="${param.email}" readonly>
					</div>
						<input type="text" class="form-control" id="key"> 
				</div>
				<div class="col-4">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-4"></div>
				<div class="col-4">
					<input type="button"
						class="btn btn-dark btn-lg btn-block" value="인증완료" onclick="check()"/>
				</div>
				<div class="col-4"></div>
			</div>
		</form>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
<script>
function check(){
	
	keys=${keys};
	email = $("#email").val();
			if(keys==$("#key").val()){
				$.ajax({
					type:"POST",
					url:"ecupdate.do",
					data:{"email":email},
					success: function(data){
						alert("인증완료!");
						location.href="login.jsp"
					
					}
				});
			}else{
				alert('인증실패!!');
				$("#key").val('').focus();
				return false;
			}
		
		}
		
		
	
	



</script>
</html>

