<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>

<%
String sSQL = "update forum set is_Delete = 1 where n_PostOrder = ?";
String Num = request.getParameter("Num");
PreparedStatement pstmt=null;
String result = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		
		pstmt.setString(1, Num);
		
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