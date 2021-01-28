<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 상세 보기</title>
<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<style>
.img-fluid{
	width: 100%;
	height: 370px;
}
.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  width: 450px;
}
.desc {
  padding: 15px;
  text-align: center;
  word-break:break-all;
}

</style>
</head>
<body>
<div class="gallery" onclick="javascript:window.close()" style="margin:auto; width:300; height:auto;">
	<div class="row">
		<div class="card-body">
				<div class="text-muted h7 mb-2">
					<p>작성날짜: </p> <fmt:formatDate value="${pop.regdate }" pattern="yyyy-MM-dd HH:mm"/></div>
				<c:if test="${!empty pop.upload }">
					<img
						src="<%=request.getContextPath() %>/upload/${pop.upload}"
						class="img-fluid img-thumbnail" />
				</c:if>
				<p class="desc">${pop.content }</p>
			</div>
	 </div>
</div>
	


</body>
</html>