<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<style>
body {
	background-color: #eeeeee;
}

.h7 {
	font-size: 0.8rem;
}

.gedf-wrapper {
	margin-top: 0.97rem;
}

@media ( min-width : 992px) {
	.gedf-main {
		padding-left: 4rem;
		padding-right: 4rem;
	}
	.gedf-card {
		margin-bottom: 2.77rem;
	}
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}

.img-fluid . max-width: 100 %; and height: auto ;
body {
	background: #f8f9fa;;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
	background: #fff;
	border-width: medium;
	border-style: solid;
	border-color: #d4d4d4;
	border-width: 0.5px;
}

.profile-userpic img {
	float: none;
	margin: 0 auto;
	width: 50%;
	height: 50%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
}

.profile-usertitle-name {
	color: #5a7391;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-userbuttons {
	text-align: center;
	margin-top: 15px;
}

.profile-userbuttons .btn {
	text-transform: uppercase;
	font-size: 11px;
	font-weight: 600;
	padding: 6px 15px;
	margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
	margin-right: 0px;
}

.profile-usermenu {
	margin-top: 30px;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #93a3b5;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	background-color: #f6f9fb;
	border-left: 2px solid #5b9bd1;
	margin-left: -2px;
}

/* Profile Content */
.profile-content {
	padding: 20px;
	background: #fff;
	min-height: 460px;
	border-style: solid;
	border-color: #d4d4d4;
	border-width: 0.5px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic" style="text-align: center;">
						<img
							src="<%=request.getContextPath() %>/upload/${dto.profile_img}"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${dto.userid }</div>
						<div class="profile-usertitle-job">${dto.nickname }</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<div class="profile-userbuttons">
							팔로잉<a href="following.do?userid=${dto.userid }"
								class="btn btn-outline-dark following btn-sm"></a> 팔로워<a
								href="follower.do?userid=${dto.userid }"
								class="btn btn-outline-dark follower btn-sm"></a>
						</div>
						<div class="profile-userbuttons">
						</div>
					</div>
					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">Active</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link disabled" href="#"
								tabindex="-1" aria-disabled="true">Disabled</a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-9">
				<div class="profile-content">
					<div class="col">
						<!-- 리스트 -->
						<article class="my-3 mx-5">
							<div class="row">
								<h3>내 글 목록</h3>
							</div>
						</article>
						<c:if test="${empty board}">
							<h3>글을 작성해보세요.</h3>
						</c:if>
						<c:if test="${!empty board }">
							<c:forEach var="a" items="${board}">
								<div class="card gedf-card"  style="position:unset;">
									<div class="card-header">
										<div class="d-flex justify-content-between align-items-center">
											<div
												class="d-flex justify-content-between align-items-center">
												<div class="mr-2">
													<img src="<%=request.getContextPath() %>/upload/${pimg}"
														width="45" class="rounded-circle">
												</div>
												<div class="ml-2">
													<div class="h5 m-0">@${a.id }</div>
													<div class="h7 text-muted">${a.name}</div>
												</div>
											</div>
											<div>
												<div class="dropdown">
													<button class="btn btn-link dropdown-toggle" type="button"
														id="gedf-drop1" data-toggle="dropdown"
														aria-haspopup="true" aria-expanded="false">
														<i class="fa fa-ellipsis-h"></i>
													</button>
													<div class="dropdown-menu dropdown-menu-right"
														aria-labelledby="gedf-drop1">
														<div class="h6 dropdown-header">Configuration</div>
														<a class="dropdown-item" href="#">Save</a> <a
															class="dropdown-item" href="#">Hide</a> <a
															class="dropdown-item" href="#">Report</a>
													</div>
												</div>
											</div>
										</div>

									</div>
									<div class="card-body">
										<div class="text-muted h7 mb-2">
											<i class="fa fa-clock-o"></i>${a.regdate }</div>
										<c:if test="${!empty a.upload }">
											<a class="card-link" href="#"> <!-- 제목 공간 --> <img
												src="<%=request.getContextPath() %>/upload/${a.upload}"
												class="img-fluid" />
											</a>
										</c:if>
										<p class="card-text">${a.content }</p>
									</div>
									<div class="card-footer">
										<a href="#" class="card-link"><i class="fa fa-gittip"></i>
											Like</a> <a href="#" class="card-link"><i
											class="fa fa-comment"></i> Comment</a> <a href="#"
											class="card-link"><i class="fa fa-mail-forward"></i>
											Share</a>
									</div>
								</div>

							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<center>
		<strong>footer </strong>
	</center>
	<%-- <div class="mt-3 container-fluid" align="center">
		<h3>마이페이지</h3>
		<div class="row align-items-start">
			<div class="col-4">
				<img src="<%=request.getContextPath() %>/upload/${dto.profile_img}"
					style="width: 30%; height: 30%;" class="img-fluid rounded-circle">
				<p>${dto.userid }님</p>
			</div>
			<div class="col-4">
				<a href="edit.do" class="btn btn-primary">프로필 편집</a> <a
					href="retire.do" class="btn btn-danger">회원 탈퇴</a> <a
					href="logout.do" class="btn btn-dark">로그아웃</a>
			</div>
			<div class="col-4">
				<div>
					팔로잉<a href="following.do?userid=${dto.userid }"
						class="btn btn-outline-dark following"></a>팔로워<a
						href="follower.do?userid=${dto.userid }"
						class="btn btn-outline-dark follower"></a>
				</div>
			</div>
		</div>
		<hr>
		<selection class="container">
		<div class="row">
			<div class="col "></div>
			<div class="col-5">
				<!-- 내용 -->
				<div class="row">
					<div class="col">
						<!-- 리스트 -->
						<article class="my-3 mx-5">
							<div class="row"><h3>내 글 목록</h3></div>
						</article>
						<c:if test="${empty board}">
							<h3>글을 작성해보세요.</h3>
						</c:if>
						<c:if test="${!empty board }">
							<c:forEach var="a" items="${board}">
								<article class="my-3 mx-5">
									<div class="row border"">
										<a href="userView.do?uid=${a.id }" style="pointer-events: none; display: inline-block;text-decoration:none;color:black;" ><img
											src="<%=request.getContextPath() %>/upload/${pimg}"
											style="width: 2rem;"class="rounded-circle" >${a.id }</a>
									</div>
									<!-- 이름 -->
									<div class="row border">
										<!-- contents -->
										<div class="col">
											<div class="row">${a.content }</div>
											<c:if test="${!empty a.upload }">
												<div class="row">
													<img
														src="<%=request.getContextPath() %>/upload/${a.upload}"
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

	</div> --%>
</body>
<script>
$(function(){
	var sessionid = "<%=(String) session.getAttribute("id")%>";
		var html = "<table class='table'>";
		$.ajax({
			url : "searchFollow.do",
			type : "post",
			data : {
				"fol_list" : sessionid
			},
			success : function(msg) {
				$('.following').html(msg.length);
				console.log(msg);
				/* 			for(var i=0; i<msg.length; i++){
				 target = msg[i].target_id;
				 if(target===sessionid){
				 continue;
				 } else {
				 html+="<tr><td><img src='https://cdn.jsdelivr.net/gh/bgjeong/cdn/user_flat2.png' style='width:2rem;' class='rounded-circle'></td>";
				 html+="<td>"+target+"</td><td></td></tr>";
				 }
				 }
				 html+="</table>";
				 $('#result_list').html(html); */
			}
		});
		$.ajax({
			url : "searchFollower.do",
			type : "post",
			data : {
				"follower" : sessionid
			},
			success : function(msg2) {
				$('.follower').html(msg2.length);
				console.log(msg2);
			}
		});
	});
</script>
</html>
