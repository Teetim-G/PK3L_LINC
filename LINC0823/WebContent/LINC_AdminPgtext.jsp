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
		$('#atext').attr('class',
				'list-group-item list-group-item-action active');
	}
</script>
<link rel="stylesheet" href="css/AdminPg.css">
<%@ include file="BSLoad.jsp"%>
</head>
<body onload="classt()">
	<%@include file="DBDB.jsp"%>
	<div id="wrap">
		<div id="adminheader">
			<%@ include file="header.jsp"%>
		</div>
		<div id="main">
			<%@ include file="LINC_Adminmenu.jsp"%>

			<div id="contents">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>아이디</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>차단 횟수</th>
						</tr>
					</thead>
					<tbody>
						<%
							String cnum = request.getParameter("cnum");
						int Page = 1;
						if (cnum != null) {
							Page = Integer.parseInt(cnum);
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
							int cstart = (Page - 1) * countList;
							int tot = 0;
							if (rs2.next())
								usercount = rs2.getInt(1);
							tot = rs2.getInt(1);
							rs2.close();
							String sql = "select * from user_stat LIMIT " + cstart + "," + countList;
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								s_ID = rs.getString("s_ID");
								s_NickName = rs.getString("s_NickName");
								s_EMail = rs.getString("s_EMail");
								s_MkDay = rs.getString("s_MkDay");
								n_CntBlock = rs.getString("n_CntBlock");
						%>
						<tr>
							<td><a href="javascript://"
								onclick="popupWindow('<%=s_ID%>');"><%=s_ID%></a></td>
							<td><%=s_NickName%></td>
							<td><%=s_EMail%></td>
							<td><%=s_MkDay%></td>
							<td><%=n_CntBlock%></td>
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
				<ul class="pagination">
					<div class="btn-toolbar" role="toolbar"
						aria-label="Toolbar with button groups" style="margin: auto;">
						<div class="btn-group mr-2" role="group" aria-label="First group">
							<%
								if (startPage > 1) {
								out.print("<a href=\"?cnum=1\">처음</a>");
							}
							if (Page > 1) {
								out.println("<a href=\"?cnum=" + (Page - 1) + "\">이전</a>");
							}
							for (int iCount = startPage; iCount <= endPage; iCount++) {
								if (iCount == Page) {
									out.print(" <b>" + iCount + "</b>");
								} else {

									out.println("<a href=\"?cnum=" + iCount + "\">" + iCount + "</a>");

								}
							}
							if (Page < totalPage) {
								out.println("<a href=\"?cnum=" + (Page + 1) + "\">다음</a>");
							}
							if (endPage < totalPage) {
								out.print("<a href=\"?cnum=" + totalPage + "\">끝</a>");
							}
							%>
						</div>
					</div>
				</ul>
				총 회원수 :
				<%=usercount%>명
			</div>
		</div>
		<div id="adminfooter">
			<%@ include file="footer.jsp"%>
			<%@ include file="JsLoad.jsp"%>
		</div>
	</div>
</body>
