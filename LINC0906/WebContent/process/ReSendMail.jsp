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
String idial = request.getParameter("id_");
String to = request.getParameter("to_"); 

String from = "powersource@naver.com";
String subject = "[인디워커즈] 인증번호 발송 메일";
int cNumber = (int)(Math.random()*99999);
String content = "인증번호 : "+cNumber;

String sSQL = "update certification set n_key = ? where s_UserID = ?";
PreparedStatement pstmt=null;
ResultSet rs=null;

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
// SMTP 서버에 접속하기 위한 정보들

try{
	
	pstmt=conn.prepareStatement(sSQL);
	pstmt.setInt(1, cNumber);
	pstmt.setString(2, idial);
	
	
	int r = pstmt.executeUpdate();

    Authenticator auth = new SMTPAuthenticatior();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject(subject); // 제목
     
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
    
    out.println("success");
 // 성공 시
}catch(Exception e){
	System.out.println(e.toString());
    out.println("fail");
    return;
}finally{
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}


%>
    