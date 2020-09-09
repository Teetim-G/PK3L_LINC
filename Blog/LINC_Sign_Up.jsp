<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/LINC_Sign_Up.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*"%>

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
               <form action="process/SendMail.jsp" method="post" name="login"id="login">
                  <div class="form-group">
                  	<label for ="idial">아이디</label>
                     <input type="text" name="idial" id="idial" class="form-control my-input" maxlength="20" required>
                     <label for="password">비밀번호</label>
                     <input type="password" name="password" id="password" class="form-control my-input" maxlength="16"required>
                     <label for="cpassword">비밀번호 재 입력</label>
                     <input type="password" name="cpassword" id="cpassword"  class="form-control my-input" maxlength="16"required>
                     <label for ="nickname">닉네임</label>
                     <input type="text" name="nickname" id="nickname"  class="form-control my-input" maxlength="10"required>
                     <label for="to">이메일 주소</label>
                     <input type="email" name="to" id="to"  class="form-control my-input"required>
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
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script>
   $(function(){
		$("form").validate({
		  rules: {
		    idial : {
		      required: true,
		      minlength: 8,
			  remote : "process/checkID.jsp"			
		    },   
		    password: {
		      required: true,
		      minlength: 8
		    },
		    cpassword: {
		      required: true,
		      minlength: 8,
		      equalTo: password
		    }
		  },
			nickname:{
				required:true,
				minlength:2
			},
			to: {
			  required: true,
			  email:true
				    },
			messages:{
				idial : {
					required:"필수 항목입니다",
					minlength:"8~20자리",
					remote:"존재하는 아이디 입니다"
				},
				password : {
					required:"필수 항목입니다",
					minlength:"8~20자리",
				},
				cpassword:{
					equalTo="일치하지 않습니다"
				},
				nickname:{
					required:"필수 항목입니다",
					minlength:"8~20자리"
				}
			}
		});	
	})
   </script>
   
</body>
</html>