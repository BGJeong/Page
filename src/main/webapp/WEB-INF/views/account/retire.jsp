<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="row" >
		<div class="col-4"></div>
		<div class="col-4  mt-5">
			<form method="post" action="retireAction.do" class="form-control">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">비밀번호</label>
					<input type="password" class="form-control" id="passwd" placeholder="비밀번호">
				</div>
				<input type="submit" value="확인" class="btn btn-outline-dark btn-block">
			</form>
		</div>
		<div class="col-4"></div>
	</div>
</body>
</html>