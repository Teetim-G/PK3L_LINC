<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="LINC_Sign_Up.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%@include file="DBCONN.jsp"%>
<%@ page import="java.util.*"%>

<%

String sSQL = "select * from user_stat;";
PreparedStatement pstmt=null;
ResultSet rs = null;
int isIDial=0;
ArrayList<String> arrID = new ArrayList<String>();
ArrayList<String> arrNN = new ArrayList<String>();
ArrayList<String> arrEMail = new ArrayList<String>();

try{
	pstmt=conn.prepareStatement(sSQL);
	rs=pstmt.executeQuery();
	while(rs.next()){
		arrID.add(rs.getString("s_ID"));
		arrNN.add(rs.getString("s_NickName"));
		arrEMail.add(rs.getString("s_EMail"));
	}//배열에 넣기
}catch(SQLException e){
	out.println("<script>alert('실패');</script>");
}finally{
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}
%>


   <div class="container">
      <div class="col-md-6 mx-auto text-center">
         <div class="header-title">
            <h1 class="wv-heading--title">
               	로고 들어갈 자리
            </h1>
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 mx-auto">
            <div class="myform form ">
               <form action="SendMail.jsp" method="post" name="login">
                  <div class="form-group">
                  	<label>아이디</label>
                     <input type="text" name="idial" id="idial" class="form-control my-input" placeholder=""maxlength="20" required>
                  </div>
                  <div class="form-group">
                  	<label id="email">비밀번호</label>
                     <input type="password" name="password" id="password" class="form-control my-input" placeholder="" maxlength="16"required>
                  </div>
                  <div class="form-group">
                  	<label>비밀번호 재 입력</label>
                     <input type="password" name="cpassword" id="cpassword"  class="form-control my-input" placeholder=""maxlength="16"required>
                  </div>
                  <label>닉네임</label>
				  <div class="form-group">
                     <input type="text" name="nickname" id="nickname"  class="form-control my-input" placeholder=""maxlength="10"required>
                  </div>
                  <div class="form-group">
                  <label>이메일 주소</label>
                     <input type="email" name="to" id="to"  class="form-control my-input" placeholder=""required>
                  </div>
                  <div class="text-center ">
                     <button type="submit" class=" btn btn-block send-button tx-tfm">계정 생성</button>
                     <input type="hidden" name="from" value="powersource@naver.com"/>
                     <input type="hidden" name="subject" value="인증메일"/>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</body>
</html>