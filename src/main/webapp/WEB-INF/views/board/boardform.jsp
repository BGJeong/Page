<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function() {
	    $("#upload_file").on('change', function(){
	        readURL(this);
	    });
	});
	
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	
	    reader.onload = function (e) {
	    		$('.file_upload').hide();
	            $('#select_image').attr('src', e.target.result);
	            $('.image').show();
	            
	        }
	
	      reader.readAsDataURL(input.files[0]);
	    }
	}
</script>
</head>
<body>

<form method="post" action="board_write.do" enctype="multipart/form-data">	<!-- enctype:전송되는 데이터 형식(파일,이미지를 서버로 전송 -->
<table class="table table-bordered align-middle text-center">
	<caption>피드 만들기</caption>
	<tr><th>ID</th>
		<td><input type=text name="id" required="required"></td>
	</tr>
	<tr><th>작성자명</th>
		<td><input type=text name="name" required="required"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea rows="5" cols="40" name="content" required="required"></textarea></td>
	</tr>
	<tr><th>게시물</th>
		<td>
			<div class="file_upload"><input type="file" name="upload_file" id="upload_file"></div>
			<div class="image" style="display:none;">
				<img id="select_image" src="#" width="500px">
			</div>
		</td>
	</tr>
	<tr><td colspan="2">
			<input type="submit" value="게시">
		</td>
	</tr>
	
</table>
</form>

</body>
</html>