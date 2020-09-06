<%try{%>
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
		$('#ablock').attr('class',
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
				session.setAttribute("blocklistnum", listnum);
			}
			%>
			<div id="contents">
			<form action="LINC_AdminPgblock.jsp" method="GET"
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
							<th width="100px">아이디</th>
							<th width="100px">닉네임</th>
							<th>차단 사유</th>
							<th width="180px">차단 시작</th>
							<th width="180px">차단 끝</th>
							<th width="100px">남은 날짜</th>
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
						if (session.getAttribute("blocklistnum") != null) {
							countList = Integer.parseInt((String) session.getAttribute("garbagelistnum"));
						}
						ResultSet rs = null, rs2, rs3, rs4;
						Statement stmt = null;
						int usercount = 0;
						String sql2 = "SELECT COUNT(*) FROM user_stat";
						String sql3 = "select COUNT(*) from user_stat WHERE (s_BlockEndDay >= now());";
						String sql4 = "select DATEDIFF(s_BlockEndDay, now()) as day from user_stat WHERE (s_BlockEndDay >= now());";
						String s_ID, s_NickName, s_EMail, s_MakeDay, n_BlockCount, s_BlockDetail, s_BlockEndDay, s_BlockStartDay;
						String s_day = null;
						try {
							stmt = conn.createStatement();
							int cstart = (Page - 1) * countList;
							rs2 = stmt.executeQuery(sql2);
							int tot = 0;
							if (rs2.next())
								tot = rs2.getInt(1);
							rs2.close();

							rs3 = stmt.executeQuery(sql3);
							if (rs3.next())
								usercount = rs3.getInt(1);
							rs3.close();

							rs4 = stmt.executeQuery(sql4);
							if (rs4.next())
								s_day = rs4.getInt(1) + "";
							rs4.close();
							String sql = "select * from user_stat WHERE (s_BlockEndDay >= now()) LIMIT " + cstart + "," + countList;
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								s_ID = rs.getString("s_ID");
								s_NickName = rs.getString("s_NickName");
								n_BlockCount = rs.getString("n_BlockCount");
								s_BlockDetail = rs.getString("s_BlockDetail");
								s_BlockEndDay = rs.getString("s_BlockEndDay");
								s_BlockStartDay = rs.getString("s_BlockStartDay");
						%>
						<tr>
							<td><a href="javascript://"
								onclick="popupWindow('<%=s_ID%>');"><%=s_ID%></a></td>
							<td><%=s_NickName%></td>
							<%String[] array2 = s_BlockDetail.split("/");%>
							<td><%=array2[array2.length-1]%></td>
							<td><%=s_BlockStartDay%></td>
							<td><%=s_BlockEndDay%></td>
							<td><%=s_day%>일</td>
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
				차단중인 회원수 :
				<%=usercount%>명
			</div>
		</div>
		<div id="adminfooter">
			<%@ include file="footer.jsp"%>
			<%@ include file="../JsLoad.jsp"%>
		</div>
	</div>
</body>
<%}}catch(Exception e){%>
<%@ include file="process/LINC_ReturnLogin.jsp"%>
<%}%>