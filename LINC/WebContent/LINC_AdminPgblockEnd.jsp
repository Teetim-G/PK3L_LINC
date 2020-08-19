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

a {
	text-decoration: none
}
</style>
<head>
<script src="js/popusermemanagement.js"></script>
</head>
<body>
	<%@include file="DBDB.jsp"%>
	<div id="conmain">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>차단 횟수</th>
					<th>차단 사유</th>
				</tr>
			</thead>
			<tbody>
				<%
					ResultSet rs = null, rs2,rs3;
					Statement stmt = null;
					String usercount=null;
					String sql2 = "SELECT COUNT(*) FROM user_stat";
					String sql3 = "select COUNT(*) from user_stat WHERE (`n_CntBlock` != 0);";
					String s_ID, s_NickName, s_EMail, s_MkDay, n_CntBlock,s_BlockDetail;
					try {
						String sql = "select * from user_stat WHERE (`n_CntBlock` != 0);";
						stmt = conn.createStatement();
						rs2 = stmt.executeQuery(sql2);
						int tot = 0;
						if (rs2.next())
							tot = rs2.getInt(1);
						rs2.close();
						rs3 = stmt.executeQuery(sql3);
						if (rs3.next())
							usercount=rs3.getInt(1)+"";
						rs3.close();
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							s_ID = rs.getString("s_ID");
							s_NickName = rs.getString("s_NickName");
							s_EMail = rs.getString("s_EMail");
							n_CntBlock = rs.getString("n_CntBlock");
							s_BlockDetail=rs.getString("s_BlockDetail");
				%>
				<tr>
					<td><a href="javascript://" onclick="popupWindow('<%=s_ID%>');"><%=s_ID%></a></td>
					<td><%=s_NickName%></td>
					<td><%=s_EMail%></td>
					<td><%=n_CntBlock%></td>
					<td><%=s_BlockDetail%></td>
				</tr>
				<%
					tot--;
				%>
				<%
					}
				%>
				<%
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
			</tbody>
		</table>
		<ul class="pagination">
			<div class="btn-toolbar" role="toolbar"
				aria-label="Toolbar with button groups" style="margin: auto;">
				<div class="btn-group mr-2" role="group" aria-label="First group">
					<button type="button" class="btn btn-outline-primary"><<</button>
					<button type="button" class="btn btn-primary">1</button>
					<button type="button" class="btn btn-outline-primary">2</button>
					<button type="button" class="btn btn-outline-primary">3</button>
					<button type="button" class="btn btn-outline-primary">4</button>
					<button type="button" class="btn btn-outline-primary">>></button>
				</div>
			</div>
		</ul>
		차단됐던 회원수 : <%=usercount%>명
	</div>
</body>
