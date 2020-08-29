<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="LINC_Login.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="simple-login-container">
    <h2>로고 들어갈 자리</h2>
    <form action="LoginProcess.jsp" method="post">
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="text"name="userid" class="form-control" placeholder="ID">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="password"name="userpwd" placeholder="Password" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="submit" class="btn btn-block btn-login"value ="로그인" placeholder="dddd" >
        </div>
    </div>
    </form>
    <div class="row">
        <a style="margin-left:50px;"href="LINC_Sign_Up.jsp">회원가입</a>
        <a href="LINC_Find.jsp">아이디/비밀번호 찾기</a>
    </div>
</div>
</body>
</html>