<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<%@ include file="BSLoad.jsp" %>
<%@ include file="LINC_DBConnect.jsp" %>

<script type="text/javascript">
	function blogReset() { // 블로그초기화

		var url = "LINC_BlogMngResetPop.jsp";

		window
				.open(url, "블로그 초기화 안내",
						"width=850, height=600, location=no, status=no, scrollbars=yes");
		// pop.action = url;
		// pop.method = "post";
		// pop.submit()

	}
</script>

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
		<button
			onclick="window.open('LINC_BlogMngResetPop.jsp','reset','width=850, height=600, location=no, status=no, scrollbars=yes');"
			name="reset">블로그 초기화</button>
	</div>

</body>
</html>
