<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>

<%
String sSQL = "update user_stat set s_EMail = ? where s_ID = ?";
String uID = request.getParameter("idial");
String NewEMail = request.getParameter("to");
PreparedStatement pstmt=null;
String result = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		
		pstmt.setString(1, NewEMail);
		pstmt.setString(2, uID);
		
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