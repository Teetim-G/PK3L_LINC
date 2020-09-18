<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<title>게시글 목록</title>
<%@ include file="LINC_DBConnect.jsp"%>
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

<style>
body {
  margin: 0;
}

#wrap {
	width: 100%;
	height: 100%;
}

#main {
	width: 1200px;
	margin: auto;
}

#menu {
	width: 200px;
	height: auto;
	float: left;
	text-align: center;
}

#contents {
  width: 900px;
	height: 100%;
}

#conmain {
  height: 1000px;
	overflow:auto;
}

#header {
	height: 56px;
}

.smenu:hover {
	cursor: pointer;
}



</style>

</head>
<body>

	<%
		//페이지 링크 : LINC_BlogPostView.jsp?myID=글번호

	request.setCharacterEncoding("utf-8");
	String sIDX = request.getParameter("myID");

	ResultSet rs = null;
	Statement stmt = null;

	try {
		// String sSQL = "UPDATE forum SET n_ViewCount = n_ViewCount + 1 WHERE n_PostOrder="+ "'" + sIDX +"';"+ "SELECT * FROM linc_c.forum where is_delete='0'&&n_PostOrder="+ "'"+ sIDX +"';";
		String sSQL = "SELECT * FROM linc_c.forum where is_delete='0'&&n_PostOrder="+ "'"+ sIDX +"'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sSQL);

		while (rs.next()) {

			// String sForumCategory = rs.getString("n_ForumCategory");
			String sPostOrder = rs.getString("n_PostOrder");
			String sTitle = rs.getString("s_Title");
			String sWriteDay = rs.getString("s_WriteDay");
			// String sTag = rs.getString("s_Tag");
			String sView = rs.getString("n_ViewCount");
			String sGood = rs.getString("n_GoodCount");
			// String sBad = rs.getString("n_BadCount");
			String sContent = rs.getString("s_Content");
	%>

	<div id="wrap">
	    <div id="header">
		     <%@ include file="header.jsp" %>
	    </div>
 		 <div id="main">
		<div id="menu">
			<div class="list-group" id="list-tab" role="tablist">
				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMain.jsp'">블로그 메인</a>
				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMyHome.jsp'">전체글보기</a>
				<a class="list-group-item list-group-item-action active" data-toggle="list" onclick="location.href='LINC_BlogBoardTest1.jsp'">게시판1</a>
				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest2.jsp'">게시판2</a>
				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest3.jsp'">게시판3</a>
				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogWrite.jsp'">글 작성하기</a>
				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogPostList.jsp'">게시글 목록</a>
				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogManagement.jsp'">블로그 관리</a>
			</div>
		</div>
			<div class="contents">
				<form name="post" method="POST" action="LINC_BlogPostDelete.jsp">

					<div id="conmain">
						<table border="1" align="center" style="width: 1000px;">
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
						<div style="float: left;">
							<button class="btn btn-primary pull-right" type="button" onclick="postDelete(post)" name="delete">
								<a>삭제</a>
							</button>
						</div>
						<div style="float: right;">
							<button class="btn btn-primary pull-right" type="button" onclick="location.href='LINC_BlogPostList.jsp'">
								<a>목록</a>
							</button>
						</div>
					</div>
					<input type="hidden" name="index" value="<%=sPostOrder%>">
				</form>
			</div>

			<div id="comment">

			</div>
		</div>
		<div id="footer">
	  	<%@ include file="footer.jsp" %>
	  	<%@ include file="JsLoad.jsp" %>
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
</body>
</html>
