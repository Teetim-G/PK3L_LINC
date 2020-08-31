<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/LINC_Login.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="process/AccessProcess.jsp">
	<div class="simple-login-container">
	    <h2>이메일 인증</h2>
	    <div class="row">
	        <div class="col-md-12 form-group">
	            <input type="number"name = cnumber class="form-control">
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12 form-group">
	            <input type="submit" class="btn btn-block btn-login"value ="인증하기 " placeholder="dddd" >
	        </div>
	    </div>
	</div>
</form>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="jquery.validate.min.js"></script>
<script type="text/javascript" src="additional-methods.min.js"></script>
<script type="text/javascript" src="messages_ko.min.js"></script>
</body>
</html>