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
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>삭제 유무</th>
							<th>개시판 분류</th>
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
						int countList = 5;
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
							<td><p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px;"><%=s_Title%></p></td>
							<td><%=s_PostUser%></td>
							<td>
								<%
									if (Integer.parseInt(is_Delete) == 0) {
								%>정상<%
									} else {
								%><p style="color: red">삭제</p> <%
 	}
 %>
							</td>
							<td><%=n_ForumCategory%></td>
							<td><form action="LINC_Updateforum.jsp" method="GET"
									name="Updateforum">
									<input name="n_PostOrder" type="hidden"
										value="<%=n_PostOrder%>"><input name="his_Delete"
										type="hidden" value="<%=is_Delete%>"><input
										name="cnum" type="hidden" value="<%=Page%>">
									<%
										if (Integer.parseInt(is_Delete) == 0) {
									%><input type="button" value="삭제" onclick="submit()" style="color: red; background: white; border: 1px solid black;">
									<%
										} else {
									%><input type="button" value="복구" onclick="submit()" style="background: white; border: 1px solid black;">
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
				총 글수 :
				<%=usercount%>개
			</div>
		</div>
		<div id="adminfooter">
			<%@ include file="footer.jsp"%>
			<%@ include file="JsLoad.jsp"%>
		</div>
	</div>
</body>
