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
					<th>가입일</th>
					<th>차단 횟수</th>
				</tr>
			</thead>
			<tbody>
				<%
					ResultSet rs = null, rs2;
					Statement stmt = null;
					String usercount=null;
					String sql2 = "SELECT COUNT(*) FROM user_stat";
					String s_ID, s_NickName, s_EMail, s_MkDay, n_CntBlock;
					try {
						String sql = "select * from user_stat";
						stmt = conn.createStatement();
						rs2 = stmt.executeQuery(sql2);
						int tot = 0;
						if (rs2.next())
							usercount=rs2.getInt(1)+"";
							tot = rs2.getInt(1);
						rs2.close();
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							s_ID = rs.getString("s_ID");
							s_NickName = rs.getString("s_NickName");
							s_EMail = rs.getString("s_EMail");
							s_MkDay = rs.getString("s_MkDay");
							n_CntBlock = rs.getString("n_CntBlock");
				%>
				<tr>
					<td><a href="javascript://" onclick="popupWindow('<%=s_ID%>');"><%=s_ID%></a></td>
					<td><%=s_NickName%></td>
					<td><%=s_EMail%></td>
					<td><%=s_MkDay%></td>
					<td><%=n_CntBlock%></td>
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
					<button type="button" class="btn btn-outline-primary">>></button>
				</div>
			</div>
		</ul>
		총 회원수 : <%=usercount%>명
	</div>
</body>
