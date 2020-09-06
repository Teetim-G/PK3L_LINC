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
	PreparedStatement pstmt=null,pstmt1=null;
	ResultSet rs=null,rs1 = null;
%>
<%
try{
		int cnumber = Integer.parseInt(request.getParameter("cnumber"));
		String sSQL = "update certification set is_certification = 1 where n_key = ?";
		
		pstmt=conn.prepareStatement(sSQL);
		pstmt.setInt(1, cnumber);
		int r = pstmt.executeUpdate();
		
		sSQL = "update user_stat set s_AccStat=? where  s_ID= (select s_UserID from certification where n_key=?);";
		pstmt1=conn.prepareStatement(sSQL);
		pstmt1.setString(1, "인증");
		pstmt1.setInt(2, cnumber);
		r = pstmt1.executeUpdate();
		if (r==0){
			throw new Exception();
		}
%>
<%		
	}catch(Exception e){
		out.println("<script>alert('정확한 인증번호를 입력해 주세요');history.back();</script>");
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
</body>
</html>