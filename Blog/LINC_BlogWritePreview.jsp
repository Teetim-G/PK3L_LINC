<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 미리보기</title>
</head>
<body>
	<!-- %@ include file="LINC_DBConnect.jsp" %-->
	<script>
		
		function pvClose() {
			self.close();
		}
	</script>
	

	<% request.setCharacterEncoding("utf-8"); %>
	제목 : <%=request.getParameter("PostTitle") %><br>
	태그 : <%=request.getParameter("PostTag") %><br>
	내용 : <%=request.getParameter("PostContents") %>
	<br><br>
	
	
	<input type="button" value="확인" onclick="pvClose();">
	
	

</body>
</html>