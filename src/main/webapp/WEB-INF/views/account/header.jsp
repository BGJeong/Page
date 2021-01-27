<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>Hello, world!</title>
<style>
body {
	font-family: sans-serif;
	background-color: #eeeeee;
}

.dropdown-toggle::after {
	content: none;
}

@media only screen and (max-width : 760px) {
	#input {
		display: none;
	}
}
.result{
	position:absolute;
	margin-top:40px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-light bg-light">
		<div class="container-sm" style="width: 80%;">
			<a class="navbar-brand" href="board_home.do"> <img
				src="https://cdn.jsdelivr.net/gh/bgjeong/cdn/logo.png" alt=""
				style="width: 4rem;" class="d-inline-block align-top img-fluid">
			</a>
			<div class="col-sm-3 col-md-3">
				<form class="navbar-form" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search" id="input">
						<div class="result">

						</div>
					</div>
				</form>
			</div>
			<form class="d-flex">
				<a href="board_home.do" class="btn"> <img
					src="https://cdn.jsdelivr.net/gh/bgjeong/cdn/home.png"
					style="width: 1.5rem;" class=""></a> <a href="modal.do" class="btn">
					<img src="https://cdn.jsdelivr.net/gh/bgjeong/cdn/plus_flat.png"
					style="width: 1.5rem;" class="">
				</a>
				<div class="dropdown">
					<a class="btn dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> <img
						src="<%=request.getContextPath() %>/upload/${pimg}"
						style="width: 1.5rem;" class="rounded-circle">
					</a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<li><h6 class="dropdown-header">${id }님</h6></li>
						<li><a class="dropdown-item" href="mypage.do">마이페이지</a></li>
						<li><a class="dropdown-item" href="edit.do">프로필 수정</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a href="search.do" class="dropdown-item">유저 검색</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
					</ul>
				</div>

			</form>
		</div>
	</nav>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
    <script>
	$('#input').keyup(function(){
		var search = $('#input').val();
		var uid = "";
		var html ="<table class='table' style='background:white; width:200px;'>";
		var sessionid = "<%=(String)session.getAttribute("id")%>";
		$.ajax({
			url:"searchAction.do",
			type: "post",
			data: {"search":search},
			success: function(msg) {
				for(var i=0; i<msg.length; i++) {
					uid=msg[i].userid;
					upro = msg[i].profile_img;
					if(uid===sessionid){
						continue;
					} else {
						html+="<tr><td><a style='text-decoration:none; color:black;' href='userView.do?uid="+uid+"'><img src='upload/"+upro+"' style='width:2rem;' class='rounded-circle'>&nbsp;&nbsp;&nbsp;"+uid+"</td></tr></a>";
					}
				}
				html+="</table>";
				$('.result').html(html);
			}
		});
	});

	function btnclick (fid){
		$.ajax({
			url:"follow.do",
			type: "post",
			data: {"fid": fid},
			success: function(msg) {
				console.log(msg+" 가져오기성공");
				location.reload();
				return msg;
			}
		});
	};
	function viewBtnClick(param){
		location.href="userView.do?uid="+param;
	}

</script>
</body>
</html>