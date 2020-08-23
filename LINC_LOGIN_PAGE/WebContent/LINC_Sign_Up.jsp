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
                     <input type="text" name="idial" id="name" class="form-control my-input" placeholder="ID">
                  </div>
                  <div class="form-group">
                     <input type="password" name="password" id="email" class="form-control my-input" placeholder="PassWord">
                  </div>
                  <div class="form-group">
                     <input type="password" name="cpassword" id="phone"  class="form-control my-input" placeholder="cPassWord">
                  </div>
				  <div class="form-group">
                     <input type="text" name="nickname" id="phone"  class="form-control my-input" placeholder="NickName">
                  </div>
                  <div class="form-group">
                     <input type="email" name="to" id="phone"  class="form-control my-input" placeholder="E-Mail">
                  </div>
                  <div class="form-group">
                     <input type="text" name="phone" id="phone"  class="form-control my-input" placeholder="PhoneNum(Choose)">
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