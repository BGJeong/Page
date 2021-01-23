<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result==0 }">
	<script>
		alert("비밀번호 변경 성공");
		location.href="editPass.do";
	</script>
</c:if>
<c:if test="${result == 1}">
	<script>
		alert("새로운 비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == 2}">
	<script>
		alert("현재 비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
</c:if>
