<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<script>
function submitToParent(){
opener.document.all.text1.value = document.all.text2.value;
}
</script>
<input type=text name=text2>
<input type=button value="부모창으로 전송" onClick="submitToParent()">
</body>
</html>