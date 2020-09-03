<%@page import="java.util.UUID" %>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>
<%

String temp_password = UUID.randomUUID().toString().replace("-","").substring(0,10);
String findID = request.getParameter("InputID_");
String findEmail = request.getParameter("Inputemail_");
String sSQL = "update user_stat set s_TempPassword = md5(?) where s_ID = ? and s_EMail = ?;"; 
PreparedStatement pstmt=null;
ResultSet rs = null;

class SMTPAuthenticatior extends Authenticator{
	 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("powersource@naver.com","gltmrldi");
    }
}

Properties p = new Properties(); // 정보를 담을 객체
 
p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
 
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
%>
<%
try{
	pstmt=conn.prepareStatement(sSQL);
	pstmt.setString(1, temp_password);
	pstmt.setString(2, findID);
	pstmt.setString(3, findEmail);
	int r = pstmt.executeUpdate();
	
	
	Authenticator auth = new SMTPAuthenticatior();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject("[인디즈] 임시 비밀번호 발급 안내"); // 제목
     
    Address fromAddr = new InternetAddress("powersource@naver.com");
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(findEmail);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent("임시 비밀번호 : "+temp_password, "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
    
    out.println("success");
%>

<%		
}catch(SQLException e){
	System.out.println(e.toString());
	out.println("fail");
}finally{
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}

%>