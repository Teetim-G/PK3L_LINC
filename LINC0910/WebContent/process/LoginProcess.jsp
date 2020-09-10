<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>
<%
String userid = request.getParameter("InputID_");
String userpwd = request.getParameter("InputPW_");
String sSQL = "select * from user_stat where (s_ID=? and s_Password=md5(?)) or (s_ID=? and s_TempPassword=md5(?));";
PreparedStatement pstmt=null;
ResultSet rs = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		pstmt.setString(1, userid);
		pstmt.setString(2, userpwd);
		pstmt.setString(3, userid);
		pstmt.setString(4, userpwd);
		rs=pstmt.executeQuery();
		rs.next();
		String res =rs.getString("s_AccStat")+'/'+rs.getString("s_EMail")+'/'+rs.getString("s_NickName");
		String state = rs.getString("s_AccStat");
		if(state.equals("인증")||state.equals("관리자")){
			session.setAttribute("userid", rs.getString("s_ID"));
		}
		out.println(res);
%>
<%		
	}catch(SQLException e){
		out.println("로그인에 실패했습니다");
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>