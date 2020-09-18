<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<!--%@ page import="forum.ForumBAO" %-->
<!--%@ page import="forum.Forum" %-->
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<title>게시글 목록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="LINC_DBConnect.jsp" %>

<script>
	setTimeout(function(){window.location.reload();},100000);
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
	overflow: auto;
	margin: auto;
}

#menu {
	width: 200px;
	height: auto;
	float: left;
	text-align: center;
}

#contents {
	overflow: auto;
	height: 100%;
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

	<div id="wrap">
		<div id="header">
			<%@ include file="header.jsp"%>
		</div>
		<div id="main">
			<div id="menu">
    		<div class="list-group" id="list-tab" role="tablist">
  				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMain.jsp'">블로그 메인</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMyHome.jsp'">전체글보기</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest1.jsp'">게시판1</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest2.jsp'">게시판2</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest3.jsp'">게시판3</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogWrite.jsp'">글 작성하기</a>
          <a class="list-group-item list-group-item-action active" data-toggle="list" onclick="location.href='LINC_BlogPostList.jsp'">게시글 목록</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogManagement.jsp'">블로그 관리</a>
        </div>
      </div>

		<div class="contents">
				<table class="table table-striped" border="1" style="width:1000px;">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>추천수</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%ResultSet rs = null;
							Statement stmt = null;
							int nCount = 0;
							try{
								String sSQL = "SELECT * FROM linc_c.forum where is_delete='0' order by n_PostOrder desc;";
								//asc = 오름차순 || desc = 내림차순
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sSQL);
								while(rs.next()){//next는 DB기준 맨위부터 포인터가 훑고 previous를 사용하면 아래부터 훑는다.
									String sPostOrder = rs.getString("n_PostOrder");
									String sTitle = rs.getString("s_Title");
									String sDate = rs.getString("s_WriteDay");
									// String sTag = rs.getString("s_Tag");
									// String sCategory = rs.getString("s_Category");
									String sView = rs.getString("n_ViewCount");
									String sGood = rs.getString("n_GoodCount");
									// String sBad = rs.getString("n_BadCount");
									nCount = nCount + 1;%>
						<tr>
							<td><%= sPostOrder %></td>
							<td><a href="LINC_BlogPostView.jsp?myID=<%=sPostOrder%>"><%= sTitle %></a></td>
							<td><%= sDate %></td>
							<td><%= sView %></td>
							<td><%= sGood %></td>
						</tr>
						<%}
							}
							catch(SQLException ex) {
								out.println("SQLException : " + ex.getMessage());
							} finally {
								if(rs != null)
									rs.close();
								if(stmt != null)
									stmt.close();
								if(conn != null)
									conn.close();
							}%>
					</tbody>
				</table>
				<ul class="pagination">
          <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="margin: auto;">
						<div class="btn-group mr-2" role="group" aria-label="First group">
              <button type="button" class="btn btn-outline-primary">이전</button>
              <button type="button" class="btn btn-primary">1</button>
              <button type="button" class="btn btn-outline-primary">2</button>
              <button type="button" class="btn btn-outline-primary">3</button>
              <button type="button" class="btn btn-outline-primary">4</button>
              <button type="button" class="btn btn-outline-primary">5</button>
              <button type="button" class="btn btn-outline-primary">다음</button>
            </div>
          </div>
          <div style="float: right;">
  					<select name="year" id="year">
  						<option value="all" selected="">제목+내용</option>
  						<option value="title">제목만</option>
  						<option value="contents">내용만</option>
  					</select>
						<input type="text" name="text">
  					<button type="button" name="검색">검색</button>
  				</div>
				</ul>
			</div>
		</div>
		<div id="footer">
			<%@ include file="footer.jsp"%>
			<%@ include file="JsLoad.jsp"%>
		</div>
	</div>

</body>
</html>
