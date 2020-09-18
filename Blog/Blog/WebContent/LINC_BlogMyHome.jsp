<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<title><%=session.getAttribute("userid")%>님의 블로그</title>

<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>

<script>
  <% if(session.getAttribute("userid") == null){%>
    location.href="LINC_BlogOtherHome.jsp";
  <% }%>
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
	<%@ include file="LINC_DBConnect.jsp" %>



  <div id="wrap">
      <div id="header">
        <%@ include file="header.jsp" %>
      </div>
    	<div id="main">
        <div id="menu">
      		<div class="list-group" id="list-tab" role="tablist">
    				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMain.jsp'">블로그 메인</a>
            <a class="list-group-item list-group-item-action active" data-toggle="list" onclick="location.href='LINC_BlogMyHome.jsp'">전체글보기</a>
            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest1.jsp'">게시판1</a>
            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest2.jsp'">게시판2</a>
            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest3.jsp'">게시판3</a>
            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogWrite.jsp'">글 작성하기</a>
            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogPostList.jsp'">게시글 목록</a>
            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogManagement.jsp'">블로그 관리</a>
          </div>
        </div>

    		<div class="contents">
    			<div style="display: inline-block;">
    				<button type="button">썸네일보기</button>
    				<button type="button">바둑판보기</button>
    			</div>
    			<div id="conmain">
            <a>음악</a><br>
            <a>잡담</a><br>
            <a>영상</a><br>
    			</div>
    		</div>
     </div>
     <div id="footer">
       <%@ include file="footer.jsp"%>
     	 <%@ include file="JsLoad.jsp"%>
     </div>
   </div>



</body>

</html>
