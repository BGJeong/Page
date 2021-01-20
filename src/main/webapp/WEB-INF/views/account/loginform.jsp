<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/js/login.js"></script>
<script>
	 function loginCheck() {
		$("#idcheck").hide();
		$("#pwcheck").hide();
	
		if($("#userid").val()==""){
			var idtext = "<font color='red'>id를 입력해주세요.</font>"
			$("#idcheck").text("");
			$("#idcheck").show();
    		$("#idcheck").append(idtext);
			$("#userid").focus();
			return false;
		}
		if($("#passwd").val()==""){
			var pwtext = "<font color='red'>password를 입력해주세요.</font>"
			$("#pwcheck").text("");
			$("#pwcheck").show();
    		$("#pwcheck").append(pwtext);
			$("#passwd").focus(); 
			return false;
		}
	};
	function idCheck() {
		
		$("#idcheck").hide();
		
	
		if($("#userid").val()==""){
			var idtext = "<font color='red'>id를 입력해주세요.</font>"
			$("#idcheck").text("");
			$("#idcheck").show();
    		$("#idcheck").append(idtext);
			
			return false;
		}else if ($("#userid").val()!="") {
			$("#idcheck").text = "";
			$("#idcheck").hide();
			
		}
		
	};
	function pwCheck() {
		
		$("#idcheck").hide();
		
	
		if($("#passwd").val()==""){
			var idtext = "<font color='red'>password를 입력해주세요.</font>"
			$("#pwcheck").text("");
			$("#pwcheck").show();
    		$("#pwcheck").append(idtext);
			
			return false;
		}else if ($("#pw").val()!="") {
			$("#pwcheck").text = "";
			$("#pwcheck").hide();
			
		}
		
	}; 


</script>

<title>로그인</title>
</head>
<body>
<form action="login.do" method="post" onsubmit="return loginCheck()">
<table align=center>
	<tr>
		<td colspan="2" align=center>page</td>
	</tr>
	<tr>
		<td>id</td>
		<td><input type=text name="userid" id="userid" onfocusout="idCheck()" /></td>
	</tr>
	<tr><td colspan="2">
		<div id="idcheck"></div>
	</td></tr>
	<tr>
		<td>pw</td>
		<td><input type=password name="passwd" id="passwd" onfocusout="pwCheck()"/></td>
	</tr>
	<tr><td colspan="2">
		<div id="pwcheck"></div>
	</td></tr>

</table>
<div id="login_menu" align=center>
    <input type="submit" value="로그인" class="input_button" />
        
</div>
<div id="login_menu" align=center>
    <input type="button" value="kakao"/>
        
</div>
<div id="login_menu" align=center>
    <input type="button" value="naver"/>
        
</div>
<div id="login_menu" align=center>
    <input type="button" value="facebook"/>
        
</div>
<div align=center><a href="idfindform.do">id 찾기</a></div>
<div align=center><a href="pwfindform.do">비밀번호를 잊으셨나요?</a></div>
</form>
</body>
</html>