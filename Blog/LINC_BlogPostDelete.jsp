<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/base-layout.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="LINC_DBConnect.jsp"%>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<% 	
	request.setCharacterEncoding("utf-8");
	String sIDX = request.getParameter("index");
	
	ResultSet rs = null;

	Statement stmt = null;
	%>
	
	<script type="text/javascript">
		function pvClose() {
			self.close();
		}
		
		function deleteOK() {
			<%

			try{
				stmt = conn.createStatement();
				String sSQL = "update linc_c.forum set is_delete='1' where n_PostOrder=" + "'" + sIDX + "'";
				stmt.executeUpdate(sSQL);//쿼리문을 실행하는 코드
			} catch(SQLException ex) {
				//out.println("삭제 실패하였습니다.<br>");
				//out.println("SQLException : " + ex.getMessage());
			} finally {
				if(stmt != null)
					stmt.close();
				if(conn != null)
					conn.close();
			}
			%>
			
			self.close();
			
			// return 1;
		}
	</script>
	
	<div align="center">
		<br>
		<a>글을 삭제하시겠습니까?</a>
		<div style="float:left;">
			<button type="button" onclick="deleteOK();"><a>확인</a></button>
		</div>
		<div style="float:right;">
			<button type="button" onclick="pvClose();"><a>취소</a></button>
		</div>
	</div>
	

</body>
</html>