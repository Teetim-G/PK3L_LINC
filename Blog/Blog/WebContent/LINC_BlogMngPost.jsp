<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="BSLoad.jsp" %>
<%@ include file="LINC_DBConnect.jsp" %>

<style>
  body {
    margin: 0;
  }
  #conmain{
    width: 100%;
    height: 100%;
  }
</style>
</head>
<body>
	<div id="conmain">
    <table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
      <tbody>
        <tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
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
        </select> <input type="text" name="text">
        <button type="button" name="검색">검색</button>
      </div>
    </ul>
	</div>
</body>
