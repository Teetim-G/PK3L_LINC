<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="DBDB.jsp"%>
	<div id="jb-container">
		<%
		String cnum = request.getParameter("cnum");
		int Page = 1;
		if(cnum!=null){Page = Integer.parseInt(cnum);
		}
		int countList = 2;
		ResultSet rs = null, rs2;
		Statement stmt = null;
		int usercount = 0;
		String sql2 = "SELECT COUNT(*) FROM user_stat";
		String s_ID, s_NickName = null, s_EMail, s_MkDay, n_CntBlock;
		try {
			stmt = conn.createStatement();
			rs2 = stmt.executeQuery(sql2);
			int cstart=(Page-1)*countList;
			int tot = 0;
			if (rs2.next())
				usercount = rs2.getInt(1);
			tot = rs2.getInt(1);
			rs2.close();
			String sql = "select * from user_stat LIMIT "+cstart+","+countList;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				s_ID = rs.getString("s_ID");
				s_NickName = rs.getString("s_NickName");
				s_EMail = rs.getString("s_EMail");
				s_MkDay = rs.getString("s_MkDay");
				n_CntBlock = rs.getString("n_CntBlock");
				out.println(s_ID);
				out.println(s_NickName);
				out.println(s_EMail);
			}
		} catch (SQLException ex) {
			out.println("테이블 호출이 실패했습니다");
			out.println("SQLException:" + ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		%>
		<%=cnum %>
		<%
		int countPage = 10;
		int totalCount = usercount;
		int totalPage = totalCount / countList;
		if (totalCount % countList > 0) {
			totalPage++;
		}
		if (totalPage < Page) {
			Page = totalPage;
		}
		int startPage = ((Page - 1) / 10) * 10 + 1;
		int endPage = startPage + countPage - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		if (startPage > 1) {
			out.print("<a href=\"?page=1\">처음</a>");
		}
		if (Page > 1) {
			out.println("<a href=\"?page=" + (Page - 1) + "\">이전</a>");
		}
		for (int iCount = startPage; iCount <= endPage; iCount++) {
			if (iCount == Page) {
				out.print(" <b>" + iCount + "</b>");
			} else {
				%>
				<form action="ex1.jsp" method="GET">
				<input type="button" value="<%=iCount%>" onclick="submit()">
				<input type="hidden" value="<%=iCount%>" name="cnum">
				</form><%
			}
		}
		if (Page < totalPage) {
			out.println("<a href=\"?page=" + (Page + 1) + "\">다음</a>");
		}
		if (endPage < totalPage) {
			out.print("<a href=\"?page=" + totalPage + "\">끝</a>");
		}
		%>
	</div>
</body>
</html>