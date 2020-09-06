
<%
	try {
%>
<%
	if (session.getAttribute("userid").equals("admin")) {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	margin: 0;
}

#conmain {
	width: 100%;
	height: 100%;
}
</style>

<head>
<meta charset="UTF-8">
<script src="js/popusermemanagement.js"></script>
<script>
	function classt() {
		$('#areport').attr('class',
				'list-group-item list-group-item-action active');
	}
</script>
<link rel="stylesheet" href="css/AdminPg.css">
<%@ include file="../BSLoad.jsp"%>
</head>
<body onload="classt()">
	<%@include file="DBDB.jsp"%>
	<div id="wrap">
		<div id="adminheader">
			<%@ include file="header.jsp"%>
		</div>
		<div id="main">
			<%@ include file="LINC_Adminmenu.jsp"%>
			<%
				request.setCharacterEncoding("utf-8");
			String listnum = request.getParameter("listnum");
			if (listnum != null) {
				session.setAttribute("garbagelistnum", listnum);
			}
			%>
			<div id="contents">
			<form action="LINC_AdminPgreport.jsp" method="GET"
					style="height: 9px; width: 100%; text-align: right;">
					페이지에 표시할 개수 <select name='listnum' size='1' onchange=submit()>
						<option value='' selected>-- 선택 --</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</form>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>신고 구분</th>
							<th>신고자</th>
							<th>피신고자</th>
							<th>신고날짜</th>
							<th>신고 게시물</th>
							<th>신고 사유</th>
							<th>확인</th>
						</tr>
					</thead>
					<tbody>
						<%
							String cnum = request.getParameter("cnum");
						int Page = 1;
						if (cnum != null) {
							Page = Integer.parseInt(cnum);
						}
						int countList = 1;
						if (session.getAttribute("garbagelistnum") != null) {
							countList = Integer.parseInt((String) session.getAttribute("garbagelistnum"));
						}
						ResultSet rs = null, rs2;
						Statement stmt = null;
						int usercount = 0;
						String sql2 = "SELECT COUNT(*) FROM report";
						String s_ReportContent, s_Reporter = null, s_Defendant, s_ReportDay, n_ForumNumber, s_Ror, is_Report, n_ReportOrder;
						try {
							stmt = conn.createStatement();
							rs2 = stmt.executeQuery(sql2);
							int cstart = (Page - 1) * countList;
							int tot = 0;
							if (rs2.next())
								usercount = rs2.getInt(1);
							tot = rs2.getInt(1);
							rs2.close();
							String sql = "select * from report order by s_ReportDay DESC LIMIT " + cstart + "," + countList;
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								s_ReportContent = rs.getString("s_ReportContent");
								s_Reporter = rs.getString("s_Reporter");
								s_Defendant = rs.getString("s_Defendant");
								s_ReportDay = rs.getString("s_ReportDay");
								n_ForumNumber = rs.getString("n_ForumNumber");
								s_Ror = rs.getString("s_Ror");
								is_Report = rs.getString("is_Report");
								n_ReportOrder = rs.getString("n_ReportOrder");
						%>
						<tr>
							<td><%=s_ReportContent%></td>
							<td><%=s_Reporter%></td>
							<td><%=s_Defendant%></td>
							<td><%=s_ReportDay%></td>
							<td><%=n_ForumNumber%></td>
							<td><%=s_Ror%></td>
							<td><form action="process/LINC_UpdateReport.jsp"
									method="GET" name="Updateforum" style="height: 0px">
									<input name="n_ReportOrder" type="hidden"
										value="<%=n_ReportOrder%>"> <input name="is_Report"
										type="hidden" value="<%=is_Report%>"> <input
										name="cnum" type="hidden" value="<%=Page%>">
									<%
										if (Integer.parseInt(is_Report) == 0) {
									%>
									<input type="button" value="X" onclick="submit()"
										style="color: red; background: white; border: 1px solid black;">
									<%
										} else {
									%>
									<input type="button" value="O" onclick="submit()"
										style="background: white; border: 1px solid black;">
									<%
										}
									%>
								</form></td>
						</tr>
						<%
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
						%>
					</tbody>
				</table>
				<%@ include file="LINC_AdminPaging.jsp"%>
				총 신고글 :
				<%=usercount%>개
			</div>
		</div>
		<div id="adminfooter">
			<%@ include file="footer.jsp"%>
			<%@ include file="../JsLoad.jsp"%>
		</div>
	</div>
</body>
<%
	}
} catch (Exception e) {
%>
<%@ include file="process/LINC_ReturnLogin.jsp"%>
<%
	}
%>