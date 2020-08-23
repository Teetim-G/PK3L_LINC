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
<script>
	function classt() {
		$('#apoto').attr('class',
				'list-group-item list-group-item-action active');
	}
</script>
<link rel="stylesheet" href="css/AdminPg.css">
<%@ include file="BSLoad.jsp"%>
<body onload="classt()">
	<%@include file="DBDB.jsp"%>
	<div id="wrap">
		<div id="adminheader">
			<%@ include file="header.jsp"%>
		</div>
		<div id="main">
			<%@ include file="LINC_Adminmenu.jsp"%>
			<div id="conmain">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
				<img alt="라이어어언" src="img/lino.jpg" width="190" height="190">
			</div>
		</div>
	</div>
</body>
