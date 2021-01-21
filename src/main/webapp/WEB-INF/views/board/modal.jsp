<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
</head>
<body>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#boardform_modal">
  글작성
</button>

<!-- Modal -->
<form method="post" action="board_write.do"	enctype="multipart/form-data">
	<!-- enctype:전송되는 데이터 형식(파일,이미지를 서버로 전송 -->
	<div class="modal fade" id="boardform_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">피드 작성</h5>
					<button type="button" class="btn-close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered align-middle text-center">
						<caption>피드 만들기</caption>
						<tr><th>내용</th>
							<td><textarea rows="5" cols="40" name="content" required="required"></textarea></td>
						</tr>
						<tr><th>게시물</th>
							<td>
								<input type="file" name="upload_file">
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<a class="btn btn-secondary" data-bs-dismiss="modal">취소</a>
					<input type="submit" value="글작성">
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>