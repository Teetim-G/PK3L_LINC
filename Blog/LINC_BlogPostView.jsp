<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/base-layout.css">
<title>게시글 목록</title>

</head>
<body>

	<%@ include file="LINC_DBConnect.jsp"%>
	<%@ include file="header.jsp"%>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javascript">
		function postDelete(Post){ //게시글 삭제
			
			pr_title = "게시글삭제"
			var url = "LINC_BlogPostDelete.jsp";
			window.open("LINC_BlogPostDelete.jsp","게시글삭제","width=200, height=100");
			post.target = pr_title;
			post.action = url;
			post.method = "post";
			post.submit();
			
			// location.href='LINC_BlogPostList.jsp';
			
		}
	</script>
	
	
	<%
		//페이지 링크 : LINC_BlogPostView.jsp?myID=글번호

	request.setCharacterEncoding("utf-8");
	String sIDX = request.getParameter("myID");

	ResultSet rs = null;

	Statement stmt = null;

	try {
		String sSQL = "SELECT * FROM linc_c.forum where is_delete='0'&&n_PostOrder=" + "'" + sIDX + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sSQL);

		// out.println(sSQL + "<br>");

		while (rs.next()) {

			// String sForumCategory = rs.getString("n_ForumCategory");
			String sPostOrder = rs.getString("n_PostOrder");
			String sTitle = rs.getString("s_Title");
			String sWriteDay = rs.getString("s_WriteDay");
			// String sTag = rs.getString("s_Tag");
			// String sCategory = rs.getString("s_Category");
			String sView = rs.getString("n_ViewCount");
			String sGood = rs.getString("n_GoodCount");
			// String sBad = rs.getString("n_BadCount");
			String sContent = rs.getString("s_Content");
	%>

	<div style="height: 56px;"></div>

	<div style="margin: auto; height: 1000px; width: 1200px;">
		<div style="width: 100%;">
			<div class="board">
				<ul class="BoardList">
					<li><a href="LINC_BlogMain.jsp">블로그 메인</a></li>
					<li><a href="LINC_BlogUserHome.jsp">전체글보기</a></li>
					<li><a href="LINC_BlogBoardTest1.jsp">게시판1</a></li>
					<li><a href="LINC_BlogBoardTest2.jsp">게시판2</a></li>
					<li><a href="LINC_BlogBoardTest3.jsp">게시판3</a></li>
				</ul>


				<div>
					<ul>
						<li><a href="LINC_BlogWrite.jsp">글 작성하기</a></li>
						<li><a href="LINC_BlogPostList.jsp">게시글 목록</a></li>
						<li><a href="LINC_BlogManagement.jsp">블로그 관리</a></li>
					</ul>
				</div>
			</div>
			<div class="contents" style="width: 1000px;">
				<form name="post" method="POST" action="LINC_BlogPostDelete.jsp">
					
					<div id="conmain" style="width: 800px">
						<table border="1" align="center" style="clear: both; width: 100%;">
							<tbody>
								<tr>
									<td width="10" align="center"><a>제목</a></td>
									<td width="50" align="center"><a><%=sTitle%></a></td>
									<td width="10" align="center"><a>글번호</a></td>
									<td width="10" align="center"><a><%=sPostOrder%></a></td>
									<td width="10" align="center"><a>조회수</a></td>
									<td width="10" align="center"><a><%=sView%></a></td>
								</tr>

								<tr>
									<td width="10" align="center"><a>작성일</a></td>
									<td width="50" align="center"><a><%=sWriteDay%></a></td>
									<td width="10" align="center"><a>추천</a></td>
									<td width="10" align="center"><a><%=sGood%></a></td>
									<td width="10" align="center"><a>비추천</a></td>
									<td width="10" align="center"><a> <!-- %= sBad %-->
									</a></td>
								</tr>

								<tr>
									<td colspan="6" width="100">
										<p style="white-space: pre-line;"><%=sContent%></p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="hidden" name="index" value="<%=sPostOrder%>">
					<div style="float: left;">
						<!--  <button type="button" onclick="postDelete(post)" name="delete">
							<a>삭제</a>
						</button> -->
						<button type="button" onclick="postDelete(post)" name="delete">
							<a>삭제</a>
						</button>
					</div>
					<div style="float: right;">
						<button type="button" onclick="location.href='LINC_BlogPostList.jsp'">
							<a>목록</a>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%
		}
	} catch (SQLException ex) {
	out.println("에러 발생<br>");
	out.println("SQLException : " + ex.getMessage());
	} finally {
	if (rs != null)
	rs.close();
	if (stmt != null)
	stmt.close();
	if (conn != null)
	conn.close();
	}
	%>

	<%@ include file="footer.jsp"%>

	<%@ include file="JsLoad.jsp"%>
</body>
</html>