<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBCONN.jsp"%>
<%
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String sSQL = "select * from user_stat where s_ID=? and s_Pwd=md5(?);";
PreparedStatement pstmt=null;
ResultSet rs = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		pstmt.setString(1, userid);
		pstmt.setString(2, userpwd);
		rs=pstmt.executeQuery();
		rs.next();
		String is_cri = rs.getString("s_AccStat");
		if(is_cri.equals("미인증")){
			out.println("<script>location.href='Access.jsp';</script>");
		}
		session.setAttribute("userid", userid);
		session.setAttribute("userpwd", userpwd);
		out.println("<script>location.href='LINC_MAIN.jsp';</script>");
%>
해치웠나?
<%		
	}catch(SQLException e){
		out.println("<script>alert('로그인에 실패하였습니다');history.back();</script>");
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
</body>
</html>