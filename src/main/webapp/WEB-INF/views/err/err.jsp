<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<style>
a:hover {
	color: #545b62;
}
a {
	color: #545b62;
	text-decoration: none;
	background-color: transparent;
}
h4 {
	color: #545b62;
	text-decoration: none;
	background-color: transparent;
}

body {
	background-color: #fafafa;
}
</style>


</head>
<body>


<div class="container">
     <div class="row-md-4" style="height: 150px;">
        <div class="col-md-1"></div>
    </div>
    <div class="row">
        
        <div class="col-md-3" align='center'></div>
        <div class="col-md-6" align='center'><img width="200" height="200"src="img/warning-sign.png" alt="err"><br>
        <h4>잠시 오류가 발생했습니다</h4><br>
        <button id = "go-1" class="btn btn-dark">돌아가기</button>
        </div>
       	
    </div>
    
    <div class="row"></div>
    <div class="row"></div>
</div>
</body>
<script type="text/javascript">
	$('#go-1').click(function(){
		history.go(-1);
	});
</script>
</html>