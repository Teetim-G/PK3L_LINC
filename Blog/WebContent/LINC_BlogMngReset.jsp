<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/base-layout.css">

<title>개인 블로그 관리</title>

<script type="text/javascript">
	function blogReset() { // 블로그초기화

		var url = "LINC_BlogMngResetPop.jsp";

		window
				.open(url, "블로그 초기화 안내",
						"width=850, height=600, location=no, status=no, scrollbars=yes");
		// pop.action = url;
		// pop.method = "post";
		// pop.submit()

	}
</script>



</head>
<body>

	<script src="http://code.jquery.com/jquery-latest.js"></script>



	<!-- %@ include file="LINC_DBConnect.jsp" %-->
	<%@ include file="header.jsp"%>

	<div style="height: 56px;"></div>

	<div style="margin: auto; height: 1000px; width: 1200px;">
		<div class="board">

			<ul class="BoardList">
				<li><a href="LINC_BlogUserHome.jsp">내 블로그 가기</a></li>
				<li><a href="LINC_BlogMngReset.jsp">블로그 초기화</a></li>
				<li><a href="LINC_BlogMngCg.jsp">카테고리 설정</a></li>
				<li><a href="LINC_BlogMngTm.jsp">테마 변경</a></li>
				<li><a href="LINC_BlogMngIf.jsp">통계</a></li>
			</ul>

			<ul class="BoardList">
				<li><a href="LINC_BlogMngPost.jsp">게시글 관리</a></li>
				<li><a href="LINC_BlogMngComment.jsp">댓글 관리</a></li>
			</ul>

		</div>

		<div class="contents" style="width: 1000px;">
			<div id="conmain">
				<div align="center"
					style="border: 1px solid; height: 200px; width: 100%;">
					<button
						onclick="window.open('LINC_BlogMngResetPop.jsp','reset','width=850, height=600, location=no, status=no, scrollbars=yes');"
						name="reset">블로그 초기화</button>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>