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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body {
	font-family: sans-serif;
	background-color: #eeeeee;
}
.dropdown-toggle::after {
	content: none;
}
</style>
</head>
<body>
	<form method="post" action="editPass_ok.do" class="mt-3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 ">
					<div class="list-group ">
						<a href="edit.do"
							class="list-group-item list-group-item-action">프로필 수정</a>
						<a href="editPass.do"
							class="list-group-item list-group-item-action active">비밀번호 변경</a>
						<a href="retire.do"
							class="list-group-item list-group-item-action">회원 탈퇴</a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="card" style="position:unset;">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<h4>비밀번호 변경</h4>
									<hr>
								</div>
							</div>
							<div class="row">
									<div class="form-group row">
										<label for="passwd_now" class="col-4 col-form-label">현재 비밀번호</label>
										<div class="col-8">
											<input id="passwd_now" name="passwd_now"
												placeholder="현재 비밀번호" class="form-control here"
												required="required" type="Password">
										</div>
									</div>
									<div class="form-group row">
										<label for="passwd" class="col-4 col-form-label">새 비밀번호</label>
										<div class="col-8">
											<input id="passwd" name="passwd"
												placeholder="새 비밀번호" class="form-control here"
												type="Password" required>
										</div>
									</div>
									<div class="form-group row">
										<label for="passwd_cf" class="col-4 col-form-label">새 비밀번호 확인</label>
										<div class="col-8">
											<input  id="passwd_cf" name="passwd_cf"
												placeholder="새 비밀번호 확인" class="form-control here" type="Password" required>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="offset-4 col-8">
										<button name="submit" type="submit" class="btn btn-primary">비밀번호 변경</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
	</form>
</body>
<script>
	
</script>
</html>







