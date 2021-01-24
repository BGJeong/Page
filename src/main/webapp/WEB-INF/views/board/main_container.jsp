<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
@media (min-width: 992px) {
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
.img-fluid. max-width: 100%; and height: auto;
.card{
	position:unset !important;
}
        
</style>
</head>
<body>

<div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
            	<!-- 왼쪽 사이드바 -->
            </div>
            <div class="col-md-6 gedf-main">
				
                <!--- \\\\\\\Post-->
                <div class="card gedf-card" style="position:unset;">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make
                                    a publication</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" id="message" rows="3" placeholder="What are you thinking?"></textarea>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">Upload image</label>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary">share</button>
                            </div>
                            <div class="btn-group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="fa fa-globe"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="#"><i class="fa fa-globe"></i> Public</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-users"></i> Friends</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Just me</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${empty list}">
						<h3>
							<a href="search.do">팔로우</a>하고 소식받기
						</h3>
					</c:if>
				<c:if test="${!empty list }">
                
                <!-- Post /////-->
				<c:forEach var="a" items="${list}" varStatus="status">
                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img src="<%=request.getContextPath() %>/upload/${mem_dto[status.index].profile_img}" width="45" class="rounded-circle">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0"><a style="color: #3c3d3f;text-decoration: none;" href="userView.do?uid=${a.id }">@${a.id }</a></div>
                                    <div class="h7 text-muted">${a.name}</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>${a.regdate }</div>
                        <a class="card-link" href="#">
                            <!-- 제목 공간 -->
                            <img src="<%=request.getContextPath() %>/upload/${a.upload}"
													class="img-fluid" />
                        </a>

                        <p class="card-text">
                            ${a.content }
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                </div>
                <!-- Post /////-->
                </c:forEach>
                </c:if>
</div>
                



            </div>
            <!-- <div class="col-md-3">
                <div class="card gedf-card">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                            card's content.</p>
                        <a href="#" class="card-link">Card link</a>
                        <a href="#" class="card-link">Another link</a>
                    </div>
                </div>
                <div class="card gedf-card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                                card's content.</p>
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
            </div>
        </div> -->
    </div>
	<%-- <selection class="container">
	<div class="row">
		<div class="col "></div>
		<div class="col-5">
			<!-- 내용 -->
			<div class="row">
				<div class="col">
					<!-- 리스트 -->
					<article class="my-3 mx-5">
						<div class="row">
							<%@ include file="modal.jsp"%>
						</div>
					</article>
					<c:if test="${empty list}">
						<h3>
							<a href="search.do">팔로우</a>하고 소식받기
						</h3>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="a" items="${list}" varStatus="status">
							<article class="my-3 mx-5">
								<div class="row border""><a href="userView.do?uid=${a.id }" style="display: inline-block;text-decoration:none;color:black;"><img src="<%=request.getContextPath() %>/upload/${mem_dto[status.index].profile_img}" style="width:2rem;" class="rounded-circle">${a.id }</a></div>
								<!-- 이름 -->
								<div class="row border">
									<!-- contents -->
									<div class="col">
										<div class="row">${a.content }</div>
										<c:if test="${!empty a.upload }">
											<div class="row">
												<img src="<%=request.getContextPath() %>/upload/${a.upload}"
													width="500px" />
											</div>
										</c:if>
									</div>
								</div>

								<div class="row">
									<!-- bottom_icons -->
									<div class="col text-center">
										<!-- 좋아요 -->
										<a class="btn btn-white" href="good.do?no='${a.no}'"><img
											src="./img/good.jpg" width="60%"></a>
									</div>

									<div class="col text-center">
										<!-- 댓글달기 -->
										<a class="btn btn-white" href="#"><img
											src="./img/comment.jpg" width="60%"></a>
									</div>
								</div>

								<div class="row border">좋아요 ${a.goodcount }</div>
								<!-- like -->
								<div class="row border">comment_container</div>
								<!-- comment_container -->
								<div class="row border">comment_field</div>
								<!-- comment_field -->
							</article>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col "></div>
	</div>
	</selection> --%>

</body>
</html>