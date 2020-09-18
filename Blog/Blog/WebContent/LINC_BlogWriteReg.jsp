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
		String sContent = request.getParameter("PostContents");
		String sUserID = request.getParameter("postRegister");
	%>

	<%


		Statement stmt = null;
		try{
			stmt = conn.createStatement();
			/* String sSQL = "insert into linc_c.forum" +
					  "(s_WriteDay,s_Title,s_Content,n_ForumCategory,s_PostUser)" +
					  "values" +
					  "(now(),'"+sTitle+"','"+sContent+"','"+sCategory+"','Dong')"; */
			String sSQL = "insert into linc_c.forum" +
					  "(s_WriteDay,s_Title,s_Content,n_ForumCategory,s_PostUser,is_BlogWrite)" +
					  "values" +
					  "(now(),'" + sTitle + "','" + sContent + "','" + sCategory + "','Finale','1')";
			stmt.executeUpdate(sSQL);//쿼리문을 실행하는 코드
      /*if(sSQL.indexOf("<p><img src=")) {
          String target = "title=\"";
          int target_num = str.indexOf(target);
          String sImageURL = str.subString(target_num,(str.substring(target_num).indexOf("\"")+target_num));

      }*/
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		} finally {
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		}
	%>
  <script>
    self.close();
  </script>

</body>
</html>
