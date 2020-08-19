<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>
<%
request.setCharacterEncoding("utf-8");
 
String idial = request.getParameter("idial");
String password_ = request.getParameter("password");
String nickname = request.getParameter("nickname");

String from = request.getParameter("from");
String to = request.getParameter("to");
String subject = request.getParameter("subject");
String content = "인증번호 : "+(int)(Math.random()*99999);

String sSQL = "insert into user_stat(s_ID,s_Pwd,s_NickName,s_EMail,s_MkDay,s_AccStat)values(?,md5(?),?,?,now(),?)";
PreparedStatement pstmt=null;
ResultSet rs = null;
// 입력값 받음
 
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
	pstmt.setString(1, idial);
	pstmt.setString(2, password_);
	pstmt.setString(3, nickname);
	pstmt.setString(4, to);
	pstmt.setString(5, "미인증");
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
}catch (SQLException e){
	System.out.println("[SQL Error : " + e.getMessage() + "]");
}catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('인증메일 전송에 실패했습니다. 정확한 이메일을 입력해주세요');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}finally{
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}

 
out.println("<script>alert('메일 인증번호를 입력해 주세요');location.href='Access.jsp';</script>");
// 성공 시
%>