<%@ page import = "java.sql.*"%>

<%
	Connection conn = null;
	String url = "jdbc:mysql://61.84.24.210:3306/linc_?serverTimezone=UTC";
	String user = "LINC_C";
	String password = "daelim1!";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
%>