<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="BSLoad.jsp" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/base-layout.css">

<title>전체 블로그 메인</title>

    
</head>
<body>

	<!--   %@ include file="LINC_DBConnect.jsp" % -->
	<%@ include file="header.jsp" %>
	
	<div style="height:56px;">
	</div>
	
	<div style="margin:auto; height:1000px; width:1200px;">
		<div class="board">
			<ul>
				<li>
					<a href="LINC_BlogMain.jsp">블로그 메인</a>
				</li>
				<li>
					<a href="LINC_BlogUserHome.jsp">내 블로그 가기</a>
				</li>
				<li>
					<a href="#">랜덤 블로그 방문</a>
				</li>
			</ul>
		</div>
		
		<div class="contents" style="width:1000px;">
			<div id="conmain" style="height:200px; width:100%;">
				<input class="submit" type="button" value="오름차순">
				<input class="submit" type="button" value="내림차순">
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
	<%@ include file="JsLoad.jsp" %>

</body>

</html>