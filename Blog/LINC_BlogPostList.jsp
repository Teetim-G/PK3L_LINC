<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/base-layout.css">
<title>게시글 목록</title>

</head>
<body>

	<!-- %@ include file="LINC_DBConnect.jsp" %-->
	<%@ include file="header.jsp"%>

	<div style="height: 56px;"></div>

	<div style="margin: auto; height: 1000px; width: 1200px;">
		<div style="width: 100%;">
			<div class="board">

				<ul class="BoardList">
					<li><a href="LINC_BlogMain.jsp">블로그 메인</a></li>
					<li><a href="LINC_BlogUserHome.jsp">전체글보기</a></li>
					<li><a href="LINC_BlogBoardTest1.jsp">게시판1</a></li>
					<li><a href="LINC_BlogBoardTest2.jsp">게시판2</a></li>
					<li><a href="LINC_BlogBoardTest3.jsp">게시판3</a></li>
				</ul>

				<div>
					<ul>
						<li><a href="LINC_BlogWrite.jsp">글 작성하기</a></li>
						<li><a href="LINC_BlogPostList.jsp">게시글 목록</a></li>
						<li><a href="LINC_BlogManagement.jsp">블로그 관리</a></li>
					</ul>
				</div>

			</div>

			<div class="contents" style="width: 1000px;">
				<div id="conmain">
					<table class="table table-striped" border="1" align="right"
						style="clear: both; width: 100%">
						<thead>
							<tr>
								<th style="width: 10%;">글번호</th>
								<th style="width: 70%;">제목</th>
								<th style="width: 10%;">날짜</th>
								<th style="width: 10%;">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>첫번째 글</td>
								<td>2020.08.00</td>
								<td>0</td>
							</tr>
							<tr>
								<td>2</td>
								<td>두번째 글</td>
								<td>2020.08.00</td>
								<td>0</td>
							</tr>
							<tr>
								<td>3</td>
								<td>세번째 글</td>
								<td>2020.08.00</td>
								<td>0</td>
							</tr>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination">
							<li class="disabled"><a href="#"> <span>이전</span>
							</a></li>
							<li class="active"><a href="#"> 1 </a></li>
							<li class="active"><a href="#"> 2 </a></li>
							<li class="active"><a href="#"> 3 </a></li>
							<li class="active"><a href="#"> 4 </a></li>
							<li class="active"><a href="#"> 5 </a></li>
							<li><a href="#"> <span>다음</span>
							</a></li>
						</ul>
					</div>

					<div style="margin: auto; width: 100%;">
						<div style="float: right;">
							<select name="year" id="year">
								<option value="all" selected="">제목+내용</option>
								<option value="title">제목만</option>
								<option value="contents">내용만</option>
							</select> <input type="text" name="text">
							<button type="button" name="검색">검색</button>
						</div>
					</div>

				</div>
				<script src="js/bootstrap.js"></script>
			</div>

		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<%@ include file="JsLoad.jsp"%>

</body>
</html>