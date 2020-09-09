<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 미리보기</title>
</head>
<body>
	<!--  %@ include file="LINC_DBConnect.jsp" % -->
	<script type="text/javascript">
		function pvClose() {
			self.close();
		}
	</script>


	<% request.setCharacterEncoding("utf-8"); %>

	<div id="conmain">
		<table border="1" align="center" style="clear: both; width: 100%;">
			<tbody>
				<tr>
					<td style="width: 50px;" align="center">
						<%=request.getParameter("PostCode")%>
					</td>
					<td width="50px" align="center"><a>제목</a></td>
					<td style="width: 400px;">
						<%=request.getParameter("PostTitle")%>
					</td>
				</tr>

				<tr>
					<td style="width: 50px;" align="center">
						<%=request.getParameter("PostSubject")%>
					</td>
					<td width="50" align="center">태그</td>
					<td width="400">
						<%=request.getParameter("PostTag")%>
					</td>
				</tr>

				<tr>
					<td colspan="3">
						<p style="white-space: pre-line;"><%=request.getParameter("PostContents")%></p>
					</td>
				</tr>
			</tbody>
		</table>
	</div>


	<br><br>
	<div style="float:right;">
		<input type="button" value="확인" onclick="pvClose();">
	</div>
	



</body>
</html>