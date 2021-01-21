<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<selection class="container">
	<div class="row">
		<div class="col "></div>
		<div class="col-5">
			<!-- 내용 -->
			<div class="row">
				<div class="col">
					<!-- 리스트 -->
					<article class="my-3 mx-5">
						<div class="row">
							<%@ include file="modal.jsp"%>
						</div>
					</article>
					<c:if test="${empty list}">
						<h3>
							<a href="search.do">팔로우</a>하고 소식받기
						</h3>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="a" items="${list}" varStatus="status">
							<article class="my-3 mx-5">
								<div class="row border""><a href="userView.do?uid=${a.id }" style="pointer-events: none; display: inline-block;text-decoration:none;color:black;"><img src="<%=request.getContextPath() %>/upload/${mem_dto[status.index].profile_img}" style="width:2rem;" class="rounded-circle">${a.id }</a></div>
								<!-- 이름 -->
								<div class="row border">
									<!-- contents -->
									<div class="col">
										<div class="row">${a.content }</div>
										<c:if test="${!empty a.upload }">
											<div class="row">
												<img src="<%=request.getContextPath() %>/upload/${a.upload}"
													width="500px" />
											</div>
										</c:if>
									</div>
								</div>

								<div class="row">
									<!-- bottom_icons -->
									<div class="col text-center">
										<!-- 좋아요 -->
										<a class="btn btn-white" href="good.do?no='${a.no}'"><img
											src="./img/good.jpg" width="60%"></a>
									</div>

									<div class="col text-center">
										<!-- 댓글달기 -->
										<a class="btn btn-white" href="#"><img
											src="./img/comment.jpg" width="60%"></a>
									</div>
								</div>

								<div class="row border">좋아요 ${a.goodcount }</div>
								<!-- like -->
								<div class="row border">comment_container</div>
								<!-- comment_container -->
								<div class="row border">comment_field</div>
								<!-- comment_field -->
							</article>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col "></div>
	</div>
	</selection>

</body>
</html>