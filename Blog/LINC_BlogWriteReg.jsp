<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/base-layout.css">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="LINC_DBConnect.jsp"%>
	<% request.setCharacterEncoding("utf-8"); %>
	<% 
		String sCategory = request.getParameter("PostSubject");
		String sTitle = request.getParameter("PostTitle");
		String sTag = request.getParameter("PostTag");
		String sPostContent = request.getParameter("PostContents");
		String sUserID = request.getParameter("postRegister");
	%>
	
	<%
		// Select * from post_state where Uaer_stat_s_ID = 'admin'	
	
	
		Statement stmt = null;
		try{
			stmt = conn.createStatement();
			//String sSQL = "insert forum" +
			//			  "(n_PostNum,s_MkDate,n_PostCode,s_Title,s_PostContent,s_Tag,s_Category,User_Stat_s_ID,Post_Category_n_PostNum)" +
			//			  "values" +
			//			  "(4,now(),'"+sPostCode+"','"+sTitle+"','"+sPostContent+"','"+sTag+"','"+sCategory+"','admin',4)";
			String sSQL = "insert forum" +
					  "(s_MkDate,s_Title,s_PostContent,s_Tag,s_Category,User_Stat_s_ID)" +
					  "values" +
					  "(now(),'"+sTitle+"','"+sPostContent+"','"+sTag+"','"+sCategory+"','admin')";
			out.println(sSQL + "<br>");
			
			stmt.executeUpdate(sSQL);//쿼리문을 실행하는 코드
			out.println("입력에 성공하였습니다.");
		} catch(SQLException ex) {
			out.println("입력에 실패하였습니다.<br>");
			out.println("SQLException : " + ex.getMessage());
		} finally {
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		}
	%>

</body>
</html>