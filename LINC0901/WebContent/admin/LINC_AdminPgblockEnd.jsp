<%if(session.getAttribute("userid").equals("admin")){%>
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
		$('#ablockend').attr('class',
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

			<div id="contents">
				<table class="table table-striped">
					<thead>
						<tr>
							<th width="100px">아이디</th>
							<th width="100px">닉네임</th>
							<th>이메일</th>
							<th width="100px">차단 횟수</th>
							<th>차단 사유</th>
						</tr>
					</thead>
					<tbody>
						<%
							String cnum = request.getParameter("cnum");
						int Page = 1;
						if (cnum != null) {
							Page = Integer.parseInt(cnum);
						}
						int countList = 10;
						ResultSet rs = null, rs2, rs3;
						Statement stmt = null;
						int usercount = 0;
						String sql2 = "SELECT COUNT(*) FROM user_stat";
						String sql3 = "select COUNT(*) from user_stat WHERE (`n_BlockCount` != 0);";
						String s_ID, s_NickName, s_EMail, s_MakeDay, n_BlockCount, s_BlockDetail;
						try {
							stmt = conn.createStatement();
							rs2 = stmt.executeQuery(sql2);
							int cstart = (Page - 1) * countList;
							int tot = 0;
							if (rs2.next())
								usercount = rs2.getInt(1);
							tot = rs2.getInt(1);
							rs2.close();
							rs3 = stmt.executeQuery(sql3);
							if (rs3.next())
								usercount = rs3.getInt(1);
							rs3.close();
							String sql = "select * from user_stat WHERE (`n_BlockCount` != 0) LIMIT " + cstart + "," + countList;
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								s_ID = rs.getString("s_ID");
								s_NickName = rs.getString("s_NickName");
								s_EMail = rs.getString("s_EMail");
								n_BlockCount = rs.getString("n_BlockCount");
								s_BlockDetail = rs.getString("s_BlockDetail");
						%>
						<tr>
							<td><a href="javascript://"
								onclick="popupWindow('<%=s_ID%>');"><%=s_ID%></a></td>
							<td><%=s_NickName%></td>
							<td><%=s_EMail%></td>
							<td><%=n_BlockCount%></td>
							<td><p
									style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 350px;"><%=s_BlockDetail%></p></td>
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
				차단 됐던 회원수 :
				<%=usercount%>명
			</div>
		</div>
		<div id="adminfooter">
			<%@ include file="footer.jsp"%>
			<%@ include file="../JsLoad.jsp"%>
		</div>
	</div>
</body>
<%}%>