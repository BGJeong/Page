<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<style>
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
.btn-outline-success:hover {
    color: #41464b;
    background-color: #f9fafb;
    border-color: #f9fafb;
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
							src="<%=request.getContextPath() %>/upload/${userdto.profile_img}"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${userdto.userid }</div>
						<div class="profile-usertitle-job">${userdto.nickname }</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<button type="button" class="btn btn-outline-success btn-sm" id="followBtn" >팔로우</button>
						<div class="profile-userbuttons">
							팔로잉<a href="following.do?userid=${userdto.userid }" class="btn btn-outline-dark following btn-sm"></a> 
							팔로워<a href="follower.do?userid=${userdto.userid }" class="btn btn-outline-dark follower btn-sm"></a>
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
								<h3>이 유저의 글 목록</h3>
							</div>
						</article>
						<c:if test="${empty board}">
							<h3>작성한 글이 없습니다</h3>
						</c:if>
						<c:if test="${!empty board }">
							<c:forEach var="a" items="${board}" varStatus="status">
								<div class="card gedf-card"  style="position:unset;">
									<div class="card-header">
										<div class="d-flex justify-content-between align-items-center">
											<div
												class="d-flex justify-content-between align-items-center">
												<div class="mr-2">
													<img src="<%=request.getContextPath() %>/upload/${userdto.profile_img}"
														width="45" class="rounded-circle">
												</div>
												<div class="ml-2">
													<div class="h5 m-0">${a.id }</div>
													<div class="h7 text-muted">${userdto.nickname}</div>
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
										<c:if test="${empty arr_like[status.index]}">
											<img onclick="view(${a.no}, this)" class="likeimg" id="likeimg_${status.index }" src="https://cdn.jsdelivr.net/gh/bgjeong/cdn/line_like.png" style="width:1.5rem">
											<span class="totalLike${status.index}">${arr_int[status.index]}</span>
										</c:if>
										<c:if test="${! empty arr_like[status.index]}">
											<img onclick="view(${a.no}, this)" class="likeimg" id="likeimg_${status.index }" src="https://cdn.jsdelivr.net/gh/bgjeong/cdn/fill_like.png" style="width:1.5rem">
											<span class="totalLike${status.index }">${arr_int[status.index]}</span>
										</c:if> 
										<a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
										<a href="#"	class="card-link"><i class="fa fa-mail-forward"></i>Share</a>
									</div>
								</div>

							</c:forEach>
						</c:if>
            </div>
		</div>

		</div>
	</div>
	<center>
		<strong>footer </strong>
	</center>

</body>
<script type="text/javascript">
function view(msg, e){
	var userid = "${userdto.userid}";
	$.ajax({
		url : "clickLikeUser.do",
		type : "post",
		data : {
			"board_no" : msg,
			"userid" : userid
		},
		success : function(result) {
			console.log(result);
			if(result.result == 1) {
				$(e).attr("src", "https://cdn.jsdelivr.net/gh/bgjeong/cdn/fill_like.png");
				$(e).next().html(result.totalLike);
			} else {
				$(e).next().html(result.totalLike);
				$(e).attr("src", "https://cdn.jsdelivr.net/gh/bgjeong/cdn/line_like.png");
			}
		}
	});
};

	$(function() {
		var itemList = [
		                <c:forEach items="${board}" var="item" varStatus="status">
		                        "${item.no}",
		                </c:forEach>
		                ];
		console.log("len : "+itemList.length);
		console.log("uid : "+'${userdto.userid}');
		console.log("id : ${id}");
		console.log("userdto : ${userdto}");
		var sessionid = "${userdto.userid}";
		$.ajax({
			url : "userFollow.do",
			type : "post",
			data : {
				"userFollow" : sessionid
			},
			success : function(msg) {
				if (msg === 1) {
					$('#followBtn').html('팔로잉');
					$('#followBtn').removeClass('btn-outline-success');
					$('#followBtn').addClass('btn-success');
				} else if (msg === 2) {
					$('#followBtn').html('팔로우');
					$('#followBtn').removeClass('btn-success');
					$('#followBtn').addClass('btn-outline-success');
				} else {
					$('#followBtn').val('err');
				}
			}
		});
		$.ajax({
			url : "searchFollow.do",
			type : "post",
			data : {
				"fol_list" : sessionid
			},
			success : function(msg) {
				$('.following').html(msg.length);
				console.log(msg);
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
	$('#followBtn').click(function() {
		var sessionid = "${userdto.userid}";
		if ($('#followBtn').html() == '팔로잉') {
			$('#followBtn').html('팔로우');
			$('#followBtn').removeClass('btn-success');
			$('#followBtn').addClass('btn-outline-success');

			$.ajax({
				url : "unfollow.do",
				type : "post",
				data : {
					"unfol" : sessionid
				},
				succes : function(msg) {
					$('#followBtn').val('팔로우');
				}
			});
		} else {
			$('#followBtn').html('팔로잉');
			$('#followBtn').removeClass('btn-outline-success');
			$('#followBtn').addClass('btn-success');

			$.ajax({
				url : "newFollow.do",
				type : "post",
				data : {
					"newfol" : sessionid
				},
				succes : function(msg) {
					$('#followBtn').html('팔로잉');
				}
			});
		}
		console.log("sessionid : " + sessionid)
		$.ajax({
			url : "searchFollow.do",
			type : "post",
			data : {
				"fol_list" : sessionid
			},
			success : function(msg) {
				$('.following').html(msg.length);
				console.log(msg);
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