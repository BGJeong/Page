<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>
<body>
	<c:if test="${!empty pass }">
		<div align="center" class="mt-5">
			<h1>비밀번호 찾기</h1>
		</div>
		<div align="center" class="mt-3">
			${id}님의 비밀번호는 ${pass } 입니다.
		</div>
		<div id="pwd_close2" align="center" class="mt-3">
			<input type="button" value="닫기" class="input_button"
				onclick="self.close();" />
		</div>
	</c:if>
	<c:if test="${empty pass }">
		<form action="find_pwd_ok.do">
			<div align="center" class="mt-5">
				<h1>비밀번호 찾기</h1>
			</div>
			<div class="mt-5" align="center">
				<input type="text" id="id" name="id" placeholder="아이디입력"> <input
					type="submit" value="비밀번호 찾기">
			</div>
			<div align="center" class="mt-3">
				<input type="button" value="닫기" class="input_button"
					onclick="self.close();" />
			</div>
		</form>
	</c:if>
</body>
</html>