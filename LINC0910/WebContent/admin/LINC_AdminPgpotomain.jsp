
<%
	try {
%>
<%
	if (session.getAttribute("userid").equals("admin")) {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
   function classt() {
      $('#apoto').attr('class',
            'list-group-item list-group-item-action active');
   }
</script>
<link rel="stylesheet" href="css/AdminPg.css">

<%@ include file="../BSLoad.jsp"%>
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
				session.setAttribute("potolistnum", listnum);
			}
			%>
			<div id="contents">
				<form action="LINC_AdminPgpotomain.jsp" method="GET"
					style="height: 9px; width: 100%; text-align: right;">
					페이지에 표시할 개수 <select name='listnum' size='1' onchange=submit()>
						<option value='' selected>-- 선택 --</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>
				</form>
				<div>
					<%
						String cnum = request.getParameter("cnum");
					int Page = 1;
					if (cnum != null) {
						Page = Integer.parseInt(cnum);
					}
					int countList = 20;
					if (session.getAttribute("potolistnum") != null) {
						countList = Integer.parseInt((String) session.getAttribute("potolistnum"));
					}
					ResultSet rs = null, rs2;
					Statement stmt = null;
					int usercount = 0;
					String sql2 = "SELECT COUNT(*) FROM image";
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
						String sql = "select * from image LIMIT " + cstart + "," + countList;
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							n_PostOrder = rs.getString("n_PostNum");
							s_Title = rs.getString("s_Directory");
					%>
					<a href=""><img
						src="http://61.84.24.210:8080/LINC_C/img/<%=s_Title%>"
						width="190px" height="190px" style="margin-top: 4px"
						alt="<%=s_Title%>"></a>
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
				</div>
				<%@ include file="LINC_AdminPaging.jsp"%>
				총 사진 수 :
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