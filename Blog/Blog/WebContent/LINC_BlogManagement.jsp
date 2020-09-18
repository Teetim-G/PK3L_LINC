<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp" %>
<meta charset="UTF-8">

<title>개인 블로그 관리</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>

<script>
	function acyncMovePage(url) {
		// ajax option
		var ajaxOption = {
			url : url,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};

		$.ajax(ajaxOption).done(function(data) {
			// Contents 영역 삭제
			$('#contents').children().remove();
			// Contents 영역 교체
			$('#contents').html(data);
		});
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
<%@ include file="LINC_DBConnect.jsp" %>
<body onload="acyncMovePage('LINC_BlogMngPost.jsp')">


  <div id="wrap">
    <div id="header">
      <%@ include file="header.jsp" %>
    </div>
  	<div id="main">
      <div id="menu">
    		<div class="list-group" id="list-tab" role="tablist">
          <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMyHome.jsp'">내 블로그 가기</a>
          <a class="list-group-item list-group-item-action active" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_BlogMngPost.jsp');">게시글 관리</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_BlogMngComment.jsp');">댓글 관리</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_BlogMngCg.jsp');">카테고리 설정</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_BlogMngTm.jsp');">테마 변경</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_BlogMngIf.jsp');">통계</a>
          <a class="list-group-item list-group-item-action" data-toggle="list" href="javascript://" onclick="acyncMovePage('LINC_BlogMngReset.jsp');">블로그 초기화</a>
        </div>
      </div>

  		<div class="contents"></div>
    </div>
    <div id="footer">
      <%@ include file="footer.jsp"%>
      <%@ include file="JsLoad.jsp"%>
    </div>
  </div>

</body>
</html>
