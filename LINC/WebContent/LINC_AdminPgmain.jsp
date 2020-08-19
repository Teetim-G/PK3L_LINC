<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">

<title>어드민 관리 페이지</title>

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

#adminheader {
	height: 56px;
}


.smenu:hover {
	cursor: pointer;
}
</style>
</head>

<body onload="acyncMovePage('LINC_AdminPgpoto.jsp')">



	<div id="wrap">
		<div id="adminheader">
			<%@ include file="header.jsp"%>
		</div>
		<div id="main">
			<div id="menu">
				<div class="list-group" id="list-tab" role="tablist">
			      <a class="list-group-item list-group-item-action active" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_AdminPgpoto.jsp');">사진 관리</a>
			      <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_AdminPgtext.jsp');">글 관리</a>
			      <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_AdminPgreport.jsp');">신고 리스트</a>
			      <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_AdminPgmember.jsp');">회원 관리</a>
			      <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_AdminPgblock.jsp');">차단중인 사용자</a>
			      <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_AdminPgblockEnd.jsp');">차단 됐던 사용자</a>
			      <a class="list-group-item list-group-item-action" data-toggle="list" href= "javascript://" onclick="acyncMovePage('LINC_AdminPggarbage.jsp');">휴지통</a>
			    </div>
			</div>

			<div id="contents"></div>
		</div>
		<div id="adminfooter">
			<%@ include file="footer.jsp"%>
			<%@ include file="JsLoad.jsp"%>
		</div>
	</div>

</body>
</html>