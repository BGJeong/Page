<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result==1 }">
	
	<script>
		alert("가입하신 email로 id가 전송되었습니다.");
		location.href="login.do";
	</script>
</c:if>
<c:if test="${result != 1}">
	<script>
		alert("잘못된 이메일 또는 가입되지 않은 회원입니다.");
		history.go(-1);
	</script>
</c:if>
