<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/base-layout.css">
<title>블로그 초기화 안내</title>
</head>
<body>

	<%@ include file="LINC_DBConnect.jsp" %>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	
		function popClose(){//창 닫기
			self.close();
		}
		
		function reset(){//초기화
			
			self.close();
			// window.open("#","초기화 완료","width=250, height=200, location=no, status=no, scrollbars=yes");
	
		}
	
	</script>
	
	대충 블로그 초기화 할거니 신중하라는 내용<br>

	<div style="float:left;">
		<input type="button" value="취소" onclick="popClose();">
	</div>
	
	<div style="float:right;">
		<input type="button" value="초기화" onclick="reset();">
	</div>
	
</body>
</html>