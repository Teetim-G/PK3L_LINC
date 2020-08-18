<%@ page import = "java.sql.*"%>
<%
	Connection conn = null;
	String url = "jdbc:mysql://222.112.124.14:3306/linc_?serverTimezone=UTC";
	String user = "Test_User";
	String password = "daelim1!";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);
%>