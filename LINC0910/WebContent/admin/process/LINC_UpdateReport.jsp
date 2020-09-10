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
	String n_ReportOrder = request.getParameter("n_ReportOrder");
	String is_Report = request.getParameter("is_Report");
	String cnum = request.getParameter("cnum");
	Statement stmt = null;
	try {
		String sSQL = null;
		if (Integer.parseInt(is_Report) == 0) {
			sSQL = "update report set is_Report='1' where n_ReportOrder ='" + n_ReportOrder + "'";
		} else {
			sSQL = "update report set is_Report='0' where n_ReportOrder ='" + n_ReportOrder + "'";
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
	location.replace("../LINC_AdminPgreport.jsp?cnum=<%=cnum%>");
	<%}else{%>
	location.replace("../LINC_AdminPgreport.jsp");
	<%}%>
		}
	</script>
</body>
</html>
<%}%>