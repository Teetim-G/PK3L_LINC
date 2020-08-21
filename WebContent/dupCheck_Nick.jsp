<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>

<%
String sSQL = "select COUNT(*) from user_stat where s_NickName= ?";
String uNick = request.getParameter("Nick");
PreparedStatement pstmt=null;
ResultSet rs = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		
		pstmt.setString(1, uNick);
		
		rs=pstmt.executeQuery();
		rs.next();
		String cnt = rs.getString("COUNT(*)");
		out.print(cnt);
	}catch(SQLException e){
		out.print(e);
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
