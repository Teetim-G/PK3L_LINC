<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="DBCONN.jsp"%>
<%
String id_input = request.getParameter("id_input_");

String sSQL = "select count(*) as cnt from user_stat where s_ID = ?";
PreparedStatement pstmt=null;
ResultSet rs = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		pstmt.setString(1, id_input);
		rs=pstmt.executeQuery();
		rs.next();
		
		out.print(rs.getInt("cnt"));
%>
<%		
	}catch(Exception e){
		System.out.println(e.toString());
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>