<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table">
			<c:forEach var="item" items="${follower_dto }" varStatus="status">
				<tr><td>
					<a class="btn btn-outline-primary btn-block" href="userView.do?uid=${item.mem_id }"><img src="<%=request.getContextPath() %>/upload/${fol_mem_info[status.index].profile_img}" style="width: 2rem;" class="rounded-circle"> ${item.mem_id }</a>
				</td></tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>