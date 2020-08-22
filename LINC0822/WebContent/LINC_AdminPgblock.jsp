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
<head><meta charset="UTF-8"></head>
<script src="js/popusermemanagement.js"></script>
<body>
	<%@include file="DBDB.jsp"%>
	<div id="conmain">
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="100px">아이디</th>
					<th width="100px">닉네임</th>
					<th>이메일</th>
					<th>차단 사유</th>
					<th width="170px">차단 시작</th>
					<th width="170px">차단 끝</th>
					<th width="100px">남은 날짜</th>
				</tr>
			</thead>
			<tbody>

				<%
					ResultSet rs = null, rs2, rs3,rs4;
					Statement stmt = null;
					String usercount = null;
					String sql2 = "SELECT COUNT(*) FROM user_stat";
					String sql3 = "select COUNT(*) from user_stat WHERE (s_BlockEndDay >= now());";
					String sql4 = "select DATEDIFF(s_BlockEndDay, now()) as day from user_stat WHERE (s_BlockEndDay >= now());";
					String s_ID, s_NickName, s_EMail, s_MkDay, n_CntBlock, s_BlockDetail,s_BlockEndDay,s_BlockStartDay;
					String s_day=null;
					try {
						String sql = "select * from user_stat WHERE (s_BlockEndDay >= now());";
						stmt = conn.createStatement();
						
						rs2 = stmt.executeQuery(sql2);
						int tot = 0;
						if (rs2.next())
							tot = rs2.getInt(1);
						rs2.close();
						
						rs3 = stmt.executeQuery(sql3);
						if (rs3.next())
							usercount = rs3.getInt(1) + "";
						rs3.close();
						
						rs4 = stmt.executeQuery(sql4);
						if (rs4.next())
							s_day = rs4.getInt(1) + "";
						rs4.close();
						
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							s_ID = rs.getString("s_ID");
							s_NickName = rs.getString("s_NickName");
							s_EMail = rs.getString("s_EMail");
							n_CntBlock = rs.getString("n_CntBlock");
							s_BlockDetail = rs.getString("s_BlockDetail");
							s_BlockEndDay=rs.getString("s_BlockEndDay");
							s_BlockStartDay=rs.getString("s_BlockStartDay");
				%>
				<tr>
					<td><a href="javascript://"
						onclick="popupWindow('<%=s_ID%>');"><%=s_ID%></a></td>
					<td><%=s_NickName%></td>
					<td><%=s_EMail%></td>
					<td><p style="overflow: hidden;text-overflow: ellipsis; white-space: nowrap; width: 200px;"><%=s_BlockDetail%></p></td>
					<td><%=s_BlockStartDay%></td>
					<td><%=s_BlockEndDay%></td>
					<td><%=s_day%>일</td>
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
		차단중인 회원수 : <%=usercount%>명
	</div>
</body>
