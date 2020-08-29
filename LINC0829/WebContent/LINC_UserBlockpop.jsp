<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBDB.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid");
		String s_BlockDetail=null;

	if(uid!=null){
		String sSQL = "select * from user_stat where s_ID='"+uid+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sSQL);
			rs = pstmt.executeQuery();
			rs.next();
			s_BlockDetail=rs.getString("s_BlockDetail");
		} catch (SQLException e) {
			out.print(e);
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	%>

	<form action="LINC_UpdateUserBlock.jsp" method="post">
		아 &nbsp;&nbsp;이&nbsp;&nbsp;디&nbsp;-&nbsp;<%=uid%><br>
		<input type="hidden" name="userid" value="<%=uid%>" />
		차단 일수 - <input type="text" name="blocknum" style="border-color: DodgerBlue;border-style: solid;">
		<br><br>
		차단 사유 - <input type="text" name="BlockDetail" style="border-color: DodgerBlue;border-style: solid;">
		<br><br>
		<input type="submit" value="차단" style="width: 335px;height: 50px ;background-color:white;border-color: DodgerBlue;border-style: solid;font-size: 20px;"/>
		
	</form>
</body>
</html>