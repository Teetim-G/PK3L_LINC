<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/base-layout.css">

<title>개인 블로그(게시판2)</title>

    
</head>
<body>
	
	<%@ include file="LINC_DBConnect.jsp" %>
	<%@ include file="header.jsp" %>
	
	<div style="height:56px;">
	</div>
	
	<div style="margin:auto; height:1000px; width:1200px;">
		<div class="board">
	
			<ul class="BoardList">
				<li>
					<a href="LINC_BlogMain.jsp">블로그 메인</a>
				</li>
				<li>
					<a href="LINC_BlogUserHome.jsp">전체글보기</a>
				</li>
				<li>
					<a href="LINC_BlogBoardTest1.jsp">게시판1</a>
				</li>
				<li>
					<a href="LINC_BlogBoardTest2.jsp">게시판2</a>
				</li>
				<li>
					<a href="LINC_BlogBoardTest3.jsp">게시판3</a>
				</li>
			</ul>
				
				
			<div>
				<ul>
					<li><a href="LINC_BlogWrite.jsp">글 작성하기</a></li>
					<li><a href="LINC_BlogPostList.jsp">게시글 목록</a></li>
					<li><a href="LINC_BlogManagement.jsp">블로그 관리</a></li>
				</ul>
			</div>
		</div>
		<div class="contents" style="width:1000px;">
			<div id="conmain">
				<table class="table table-striped" border="1" align="right" style="clear:both; width:100%">
					<thead>
					<tr>
						<th style="width: 8%;">글번호</th>
						<th style="width: 59%;">제목</th>
						<th style="width: 17%;">날짜</th>
						<th style="width: 8%;">추천수</th>
						<th style="width: 8%;">조회수</th>
					</tr>
					</thead>
					<tbody>
					<%
						ResultSet rs = null;
						Statement stmt = null;
						
						int nCount = 0;
						
						try{
							String sSQL = "SELECT * FROM post_state where n_PostCode='2' order by n_PostNum desc;";
							//asc = 오름차순 || desc = 내림차순
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sSQL);
						
							while(rs.next()){
								
								int PostCode = rs.getInt("n_PostCode");
								String sPostNum = rs.getString("n_PostNum");
								String sTitle = rs.getString("s_Title");
								String sDate = rs.getString("s_MkDate");
								// String sTag = rs.getString("s_Tag");
								// String sCategory = rs.getString("s_Category");
								String sCntView = rs.getString("n_CntView");
								String sCntGood = rs.getString("n_CntGood");

								
								if(PostCode == 2){
								
					%>
					<tr>
						<td><%= sPostNum %></td>
						<td><a href="LINC_BlogPostView.jsp?myID=<%=sPostNum%>"><%= sTitle %></a></td>
						<td><%= sDate %></td>
						<td><%= sCntView %></td>
						<td><%= sCntGood %></td>
					</tr>
					
					<%
								}
								else{
					%>
					<tr>
						<td></td>
						<td>게시글이 없습니다.</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<% 				
								}
							}
						}
						catch(SQLException ex) {
							out.println("에러 발생<br>");
							out.println("SQLException : " + ex.getMessage());
						} finally {
							if(rs != null)
								rs.close();
							if(stmt != null)
								stmt.close();
							if(conn != null)
								conn.close();
						}
					
					%>
					</tbody>
				</table>
				<div class="text-center">
					<ul class="pagination">
						<li class="disabled">
							<a href="#">
								<span>이전</span>
							</a>
						</li>
						<li class="active">
							<a href="#">
								1
							</a>
						</li>
						<li class="active">
							<a href="#">
								2
							</a>
						</li>
						<li class="active">
							<a href="#">
								3
							</a>
						</li>
						<li class="active">
							<a href="#">
								4
							</a>
						</li>
						<li class="active">
							<a href="#">
								5
							</a>
						</li>
						<li>
							<a href="#">
								<span>다음</span>
							</a>
						</li>
					</ul>
				</div>
					
				<div style="margin:auto; width:100%;">
					<div style="float:right;">
						<select name="year" id="year">
							<option value="all" selected="">제목+내용</option>
							<option value="title">제목만</option>
							<option value="contents">내용만</option>
						</select>
						<input type="text" name="text">
						<button type="button" name="검색">검색</button>
					</div>
				</div>
				
			</div>
			<script src="js/bootstrap.js"></script>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
	<%@ include file="JsLoad.jsp" %>
	
	
</body>
</html>