<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center" style="width:80%;">
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4">
			<table class="table" >
			<c:forEach var="item" items="${following_dto }" varStatus="status">
				<tr>
					<td>
						<a class="btn btn-outline-primary btn-block" href="userView.do?uid=${item.target_id }"><img src="<%=request.getContextPath() %>/upload/${mem_info[status.index].profile_img}" style="width: 2rem;" class="rounded-circle"> ${item.target_id }</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<div class="col-4"></div>
	</div>
		
	</div>
</body>
<script>
</script>
</html>
