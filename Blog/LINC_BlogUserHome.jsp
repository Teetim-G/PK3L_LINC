<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/base-layout.css">
<title>개인 블로그(메인)</title>


</head>
<body>
	<%@ include file="LINC_DBConnect.jsp" %>

	<%@ include file="header.jsp"%>

	<div style="height: 56px;"></div>

	<div style="margin: auto; height: 1000px; width: 1200px;">
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
			<div style="display: inline-block;">
				<button type="button">썸네일보기</button>
				<button type="button">바둑판보기</button>
			</div>
			<div id="conmain" style="height: 1000px; width: 100%;">

				<div id="music" style="border: 1px solid; height: 300px;">
					<a>음악</a>
				</div>

				<div id="free" style="border: 1px solid; height: 300px;">
					<a>잡담</a>
				</div>

				<div id="video" style="border: 1px solid; height: 300px;">
					<a>영상</a>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<%@ include file="JsLoad.jsp"%>

</body>

</html>