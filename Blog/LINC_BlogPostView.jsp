<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

	<%@ include file="LINC_DBConnect.jsp"%>
	<%@ include file="header.jsp"%>

	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<%
		//페이지 링크 : LINC_BlogPostView.jsp?myID=글번호

		request.setCharacterEncoding("utf-8");
		String sIDX = request.getParameter("myID");
	
		ResultSet rs = null;
	
		Statement stmt = null;
		
		int nCount = 0;
		
		try{
			String sSQL = "SELECT * FROM post_state where n_PostOrder="+"'"+sIDX+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sSQL);
			
			// out.println(sSQL + "<br>");
			
			while(rs.next()){
				
				String sForumCategory = rs.getString("n_ForumCategory");
				String sPostNum = rs.getString("n_PostNum");
				String sTitle = rs.getString("s_Title");
				String sWriteDay = rs.getString("s_WriteDay");
				String sTag = rs.getString("s_Tag");
				String sCategory = rs.getString("s_Category");
				String sView = rs.getString("n_ViewCount");
				String sGood = rs.getString("n_GoodCount");
				String sBad = rs.getString("n_BadCount");
				String sContent = rs.getString("s_Content");

	%>
	
	<form action="" name="MyForm" method="post">
		제목 : <%= sTitle %><br>
		게시판 : <%= sForumCategory %><br>
		날짜 : <%= sWriteDay %><br>
		분류 : <%= sCategory %><br>
		태그 : <%= sTag %><br>
		조회수 : <%= sView %><br>
		추천 : <%= sGood %><br>
		비추천 : <%= sBad %><br>
		내용 : <%= sContent %><br>
	</form>
	
	<%
			}
		}
		catch(SQLException ex) {
			out.println("에러 발생<br>");
			out.println("SQLException : " + ex.getMessage());
		} finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		}
	
	%>
	
	<br><a href="LINC_BlogPostList.jsp">목록</a><br>

	<%@ include file="footer.jsp"%>

	<%@ include file="JsLoad.jsp"%>



</body>
</html>