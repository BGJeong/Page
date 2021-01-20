<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body>

	<div class="mt-3 container-fluid" align="center">
		<h3>마이페이지</h3>
		<div class="row align-items-start">
			<div class="col-sm-3">
					<img src="<%=request.getContextPath() %>/upload/${dto.profile_img}" style="width:30%; height:30%;" class="img-fluid rounded-circle">
				<p>${dto.userid } 님</p>
			</div>
			<div class="col">
				<a href="edit.do" class="btn btn-primary">프로필 편집</a>
				<a href="retire.do" class="btn btn-danger">회원 탈퇴</a>
				<a href="logout.do" class="btn btn-dark">로그아웃</a>
			</div>
			<div class="col">
				<div>팔로잉<a href="following.do?userid=${dto.userid }" class="btn btn-outline-dark following"></a>팔로워<a href="follower.do?userid=${dto.userid }" class="btn btn-outline-dark follower"></a></div>
			</div>
		</div>
		<hr>
	</div>
</body>
<script>
$(function(){
	var sessionid = "<%=(String)session.getAttribute("id")%>";
	var html ="<table class='table'>";
	$.ajax({
		url:"searchFollow.do",
		type:"post",
		data:{"fol_list":sessionid},
		success: function(msg) {
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
		url:"searchFollower.do",
		type:"post",
		data:{"follower":sessionid},
		success: function(msg2){
			$('.follower').html(msg2.length);
			console.log(msg2);
		}
	});
});
</script>
</html>
