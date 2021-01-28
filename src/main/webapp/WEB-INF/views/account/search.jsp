<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="row" class="form-control" style="margin:auto; width:300px;">
				<div class="form-floating mb-3 mt-5">
					<input type="text" class="form-control" id="floatingInput" >
					<label for="floatingInput">Search</label>
				</div>
			<div id="result"></div>
		</div>
</body>
<script>
	$('#floatingInput').keyup(function(){
		var search = $('#floatingInput').val();
		var uid = "";
		var html ="<table class='table'>";
		var sessionid = "<%=(String)session.getAttribute("id")%>";
		$.ajax({
			url:"searchAction.do",
			type: "post",
			data: {"search":search},
			success: function(msg) {
				for(var i=0; i<msg.length; i++) {
					uid=msg[i].userid;
					upro = msg[i].profile_img;
					path="<%=getServletContext().getRealPath("/").replace("\\", "\\\\")%>";
					console.log(path);
					if(uid===sessionid){
						continue;
					} else {
						html+="<tr><td><a href='userView.do?uid="+uid+"'><img src='upload/"+upro+"' style='width:2rem;' class='rounded-circle'><button id=btn"+i+" class='btn btn-light' onclick='viewBtnClick("+'"'+uid+'"'+")' value='"+uid+"'> "+uid+"</td></tr></a>";
					}
				}
				html+="</table>";
				$('#result').html(html);
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
</html>
