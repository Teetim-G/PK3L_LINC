<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("userid");
	session.removeAttribute("usernick");
	response.sendRedirect("LINC_MAIN.jsp");

%>
