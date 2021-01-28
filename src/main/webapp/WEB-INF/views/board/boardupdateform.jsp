<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form method="post" action="boardupdate.do" enctype="multipart/form-data">
<input type="hidden" name="no" value="${board.no }">
<table class="table table-bordered align-middle text-center">
	<caption>피드 만들기</caption>
	<tr><th>내용</th>
		<td><textarea class="form-control" id="content" name="content" rows="3" placeholder="수정글 입력">${board.content }</textarea></td>
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