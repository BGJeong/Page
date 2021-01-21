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
						<button type="button" class="btn btn-outline-success btn-sm" id="followBtn">Follow</button>
						<a href="edit.do" class="btn btn-primary btn-sm">프로필</a>
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
			   Some user related content goes here...
            </div>
		</div>

		</div>
	</div>
	<center>
		<strong>footer </strong>
	</center>
	<%-- <div class="mt-3 container-fluid" align="center">
		<h3>상세정보</h3>
		<div class="row align-items-start" style="width: 80%;">
			<c:if test="${!empty userdto}">
				<div class="col-sm-3">
					<img
						src="<%=request.getContextPath() %>/upload/${userdto.profile_img}"
						style="width: 30%; height: 30%;" class="img-fluid rounded-circle">
					<p>${userdto.userid }</p>
				</div>
				<div class="col">
					<input type="button" class="btn btn-outline-dark btn-block"
						value="팔로우" id="followBtn">
				</div>
				<div class="col">
					<div>
						팔로잉<a href="following.do?userid=${userdto.userid }"
							class="btn btn-outline-dark following"></a>팔로워<a
							href="follower.do?userid=${userdto.userid }"
							class="btn btn-outline-dark follower"></a>
					</div>
				</div>
			</c:if>

			<c:if test="${empty userdto }">
				<div class="col-sm-3">
					<img src="https://cdn.jsdelivr.net/gh/bgjeong/cdn/user_flat.png"
						style="width: 30%; height: 30%;" class="img-fluid rounded-circle">
					존재하지 않는 사용자입니다.
				</div>
			</c:if>



			<div></div>
		</div>
	</div>
	<hr>
 --%>
</body>
<script type="text/javascript">
	$(function() {
		console.log("${userdto}");
		var sessionid = "${userdto.userid}";
		$.ajax({
			url : "userFollow.do",
			type : "post",
			data : {
				"userFollow" : sessionid
			},
			success : function(msg) {
				if (msg === 1) {
					$('#followBtn').val('팔로잉');
					$('#followBtn').removeClass('btn-outline-success');
					$('#followBtn').addClass('btn-success');
				} else if (msg === 2) {
					$('#followBtn').val('팔로우');
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
		if ($('#followBtn').val() == '팔로잉') {
			$('#followBtn').val('팔로우');
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
			$('#followBtn').val('팔로잉');
			$('#followBtn').removeClass('btn-outline-success');
			$('#followBtn').addClass('btn-success');

			$.ajax({
				url : "newFollow.do",
				type : "post",
				data : {
					"newfol" : sessionid
				},
				succes : function(msg) {
					$('#followBtn').val('팔로잉');
				}
			});
		}
		console.log("sessionid : " + sessionid)
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