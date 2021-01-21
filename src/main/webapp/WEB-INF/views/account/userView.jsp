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
</head>
<body>

	<div class="mt-3 container-fluid" align="center">
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
					$('#followBtn').removeClass('btn-outline-dark');
					$('#followBtn').addClass('btn-dark');
				} else if (msg === 2) {
					$('#followBtn').val('팔로우');
					$('#followBtn').removeClass('btn-dark');
					$('#followBtn').addClass('btn-outline-dark');
				} else {
					$('#followBtn').val('err');
				}
			}
		});
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
	$('#followBtn').click(function() {
		var sessionid = "${userdto.userid}";
		if ($('#followBtn').val() == '팔로잉') {
			$('#followBtn').val('팔로우');
			$('#followBtn').removeClass('btn-dark');
			$('#followBtn').addClass('btn-outline-dark');

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
			$('#followBtn').removeClass('btn-outline-dark');
			$('#followBtn').addClass('btn-dark');

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