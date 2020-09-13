<%try{%>
<%if (session.getAttribute("userid").equals("admin")) {%>
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
				session.setAttribute("textlistnum", listnum);
			}
			%>
			<div id="contents">
				<form action="LINC_AdminPgtext.jsp" method="GET"
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
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>삭제 유무</th>
							<th>게시판 분류</th>
							<th>관리</th>
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
						if (session.getAttribute("textlistnum") != null) {
							countList = Integer.parseInt((String) session.getAttribute("textlistnum"));
						}
						ResultSet rs = null, rs2;
						Statement stmt = null;
						int usercount = 0;
						String sql2 = "SELECT COUNT(*) FROM forum";
						String n_PostOrder, s_Title = null, s_PostUser, is_Delete, n_ForumCategory;
						try {
							stmt = conn.createStatement();
							rs2 = stmt.executeQuery(sql2);
							int cstart = (Page - 1) * countList;
							int tot = 0;
							if (rs2.next())
								usercount = rs2.getInt(1);
							tot = rs2.getInt(1);
							rs2.close();
							String sql = "select * from forum order by n_PostOrder DESC LIMIT " + cstart + "," + countList;
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								n_PostOrder = rs.getString("n_PostOrder");
								s_Title = rs.getString("s_Title");
								s_PostUser = rs.getString("s_PostUser");
								is_Delete = rs.getString("is_Delete");
								n_ForumCategory = rs.getString("n_ForumCategory");
						%>
						<tr>
							<td><%=n_PostOrder%></td>
							<td><div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px;"><%=s_Title%></div></td>
							<td><a href="javascript://"
								onclick="popupWindow('<%=s_PostUser%>');" style="color: blue;font-weight: 700;"><%=s_PostUser%></a></td>
							<%if (Integer.parseInt(is_Delete) == 0) {%><td>정상
							<%} else { %><td style="color:red">삭제<%}%>
							</td>
							<td><%=n_ForumCategory%></td>
							<td><form action="process/LINC_Updateforum.jsp" method="GET" name="Updateforum" style="height: 0px">
									<input name="n_PostOrder" type="hidden" value="<%=n_PostOrder%>">
									<input name="his_Delete" type="hidden" value="<%=is_Delete%>">
									<input name="cnum" type="hidden" value="<%=Page%>">
									<%if (Integer.parseInt(is_Delete) == 0) {%>
									<input type="button" value="삭제" onclick="submit()" style="color: red; background: white; border: 1px solid black;">
									<% } else {%>
									<input type="button" value="복구" onclick="submit()" style="background: white; border: 1px solid black;">
									<%}%>
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
				총 글수 :
				<%=usercount%>개
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