<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>

<%
String sSQL = "update user_stat set ? where s_ID = ?";
String uID = (String)session.getAttribute("userid");
PreparedStatement pstmt=null;
String result = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);

		pstmt.setString(1, uID);
		
		result = Integer.toString(pstmt.executeUpdate());
		out.print(result);
	}catch(SQLException e){
		out.print(e);
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>