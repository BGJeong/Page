<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	 function pwfindCheck() {
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
		if($("#email").val()==""){
			var pwtext = "<font color='red'>email를 입력해주세요.</font>"
			$("#emailFindCheck").text("");
			$("#emailFindCheck").show();
    		$("#emailFindCheck").append(pwtext);
			$("#email").focus(); 
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
	
	function emailCheck() {
		
		$("#emailFindCheck").hide();
		
		//이메일 표현식
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//정규표현식 검사
		if(!emailRule.test($("#email").val())){

			var idtext = "<font color='red'>정확한 email을 입력해주세요.</font>"
			$("#emailFindCheck").text("");
			$("#emailFindCheck").show();
    		$("#emailFindCheck").append(idtext);
			return false;
		}
		if($("#email").val()!="") {
				$("#emailFindCheck").text = "";
				$("#emailFindCheck").hide();
				
		}
		
	}; 
		
</script>

<title>pw 찾기</title>
</head>
<body>
<form action="pwfind.do" method="post" onsubmit="return pwfindCheck()">
<table align=center>
	<tr>
		<td colspan="2" align=center>pw찾기</td>
	</tr>
	<tr>
		<td>id</td>
		<td><input type=text name="userid" id="userid" onfocusout="idCheck()" /></td>
	</tr>
	<tr><td colspan="2">
		<div id="idcheck"></div>
	</td></tr>
	<tr>
		<td>email</td>
		<td><input type="text" name="email" id="email" onfocusout="emailCheck()"/></td>
	</tr>
	<tr><td colspan="2">
		<div id="emailFindCheck"></div>
	</td></tr>

</table>
<div id="login_menu" align=center>
    <input type="submit" value="비밀번호 찾기" class="input_button" />
        
</div>

<div align=center><a href="login.do">로그인</a></div>
</form>
</body>
</html>