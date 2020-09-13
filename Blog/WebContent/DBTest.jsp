<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB테스트</title>
<%@include file="LINC_DBConnect.jsp"%>
</head>
<body>
	
	<%
	String sSQL = "select * from user_stat";
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	%>
	<%
	try{
			pstmt=conn.prepareStatement(sSQL);
			rs=pstmt.executeQuery();
			rs.next();
			String myName = rs.getString("s_ID");
	%>
	<%=myName%>
	<%		
		}catch(SQLException e){
			out.print(e);
		}finally{
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
	%>
	

</body>
</html>