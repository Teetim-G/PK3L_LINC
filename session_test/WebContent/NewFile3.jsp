<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String setattr=(String)session.getAttribute("first");
%>
<%=setattr %>
<a href="NewFile1.jsp">아이디/비밀번호 찾기</a>
</body>
</html>