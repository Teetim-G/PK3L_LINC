<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@include file="DBDB.jsp"%>
	<%
		String sblocknum = request.getParameter("blocknum");
		String suserid = request.getParameter("userid");
		Statement stmt = null;
		try{
			String sSQL = "update user_stat set s_BlockEndDay = DATE_ADD(NOW(), INTERVAL "+sblocknum+" DAY),s_BlockStartDay=NOW() where s_ID ='"+suserid+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(sSQL);
		}catch(SQLException ex){
			out.println("SQLException:" + ex.getMessage());
		}finally{
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}

	%>
</body>
</html>