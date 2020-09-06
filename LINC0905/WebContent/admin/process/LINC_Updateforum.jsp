<%if(session.getAttribute("userid").equals("admin")){%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body onload="WinNext()">
	<%@include file="../DBDB.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	String n_PostOrder = request.getParameter("n_PostOrder");
	String is_Delete = request.getParameter("his_Delete");
	String cnum = request.getParameter("cnum");
	Statement stmt = null;
	try {
		String sSQL = null;
		if (Integer.parseInt(is_Delete) == 0) {
			sSQL = "update forum set is_Delete='1' where n_PostOrder ='" + n_PostOrder + "'";
		} else {
			sSQL = "update forum set is_Delete='0' where n_PostOrder ='" + n_PostOrder + "'";
		}
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
	<script>
function WinNext()
{
	<%if(Integer.parseInt(cnum)!=0){%>
	location.replace("../LINC_AdminPgtext.jsp?cnum=<%=cnum%>");
	<%}else{%>
	location.replace("../LINC_AdminPggarbage.jsp");
	<%}%>
		}
	</script>
</body>
</html>
<%}%>