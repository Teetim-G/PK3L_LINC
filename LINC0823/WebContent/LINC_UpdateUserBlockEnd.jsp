<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	/* 퀵메뉴 창닫기 기능 */

	function WinClose()
	{
		setTimeout(function() {
			opener.parent.location.reload();
			window.open('','_self').close();
			}, 700);
	}
</script>
</head>
<body onload="WinClose()" style="text-align: center;">
차단 해제 됐습니다
	<%@include file="DBDB.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	Statement stmt = null;
	try {
		String sSQL = "update user_stat set s_BlockEndDay=NOW(), s_BlockStartDay=NOW() where s_ID ='" + uid + "'";
		stmt = conn.createStatement();
		stmt.executeUpdate(sSQL);
	} catch (SQLException ex) {
		out.println("SQLException:" + ex.getMessage());
	} finally {
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}
	%>
	<form action="LINC_Adminblockuserpop.jsp" name="form" method="post">
		<input type="hidden" name="mem_uid3" value="<%=uid%>">
	</form>
</body>
</html>