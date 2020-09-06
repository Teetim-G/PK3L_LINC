<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>
<%
String nick_input = request.getParameter("nick_input_");
String sSQL = "select count(*) as cnt from user_stat where s_NickName = ?";
PreparedStatement pstmt=null;
ResultSet rs = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		pstmt.setString(1, nick_input);
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