<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="BSLoad.jsp" %>
<meta charset="UTF-8">

<title>전체 블로그 메인</title>

<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>

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
	<%@ include file="LINC_DBConnect.jsp" %>

  <div id="wrap">
    <div id="header">
      <%@ include file="header.jsp" %>
    </div>
  	<div id="main">
      <div id="menu">
    		<div class="list-group" id="list-tab" role="tablist">
    			<a class="list-group-item list-group-item-action active" data-toggle="list" onclick="location.href='LINC_BlogMain.jsp'">블로그 메인</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMyHome.jsp'">내 블로그 가기</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogOtherHome.jsp'">랜덤 블로그 방문</a>
    		</div>
      </div>

  		<div class="contents">
				<input class="submit" type="button" value="오름차순">
				<input class="submit" type="button" value="내림차순">
  		</div>
	   </div>
     <div id="footer">
       <%@ include file="footer.jsp" %>
     	 <%@ include file="JsLoad.jsp" %>
     </div>
   </div>

</body>

</html>
