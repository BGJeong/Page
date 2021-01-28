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
/* 수정함 */
.img-fluid1{
 max-width: 100%;
  height: 168px ;
  }
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
.mylist{
	width:200px;
	height:200px;
	float: left;
	list-style:none;
	margin-right: 20px;
	margin-top: 40px;
	
}
.card-body{

	width:200px;
	height:200px;
	overflow:hidden;
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
			<div class="col-md-9 profile-content">
				
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
						<ul>
							<c:forEach var="a" items="${board}" varStatus="status">
							<li class="mylist">
								<div class="card gedf-card"  style="position:unset;" onclick="test(${a.no})">	
									<div class="card-body">
										<c:if test="${!empty a.upload }">
											<a class="card-link" href="#"> <!-- 제목 공간 --> <img
												src="<%=request.getContextPath() %>/upload/${a.upload}"
												class="img-fluid1" />
											</a>
										</c:if>
										<c:if test="${empty a.upload }">
												<a class="card-link" href="#"><img src="<%=request.getContextPath() %>/upload/default.png" class="img-fluid" />
												</a>
										</c:if>
									</div>
									
								</div>
							</li>
							</c:forEach>
							</ul>
						</c:if>
					</div>
				</div>
			</div>
		
	</div>
	<center>
		<strong>footer </strong>
	</center>
</body>
<script>

function test(a){

	var ref = "mypop.do?no="+a
	window.open(ref,"myboard","width=500 , height=500, left=800, top=500" );

}



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
