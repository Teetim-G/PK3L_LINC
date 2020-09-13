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
<title>인증번호 입력</title>
</head>
<body>
<%
String idial = request.getParameter("idial"); 
String nickname = request.getParameter("nickname"); 
String to = request.getParameter("to_");
//이거로 재전송할때 변수넣어서 다시보내면됨
%>
<form name="access"id="access" action="LINC_MAIN.jsp">
	<div class="simple-login-container">
	    <h2>인증번호 입력</h2>
	    <div class="row">
	        <div class="col-md-12 form-group">
	            <input type="number"id = "cnumber" class="form-control">
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12 form-group">
	            <input type="button" id="config"class="btn btn-primary btn-sm"value="인증번호 확인"style="margin-left:9px">
	            <input type="button" id="resend"class="btn btn-primary btn-sm"value="인증번호 재 전송"style="margin-left:55px">
	            <input type="hidden"id="idial"value="<%=idial%>">
	            <input type="hidden"id="nick"value="<%=nickname%>">
	            <input type="hidden"id="to"value="<%=to%>">
	        </div>
	    </div>
	</div>
</form>
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$("#config").click(function(){
	var cnumber = $("#cnumber").val()
	var idial = $("#idial").val()
	var nickname = $("#nick").val()
	if(cnumber==""){
		alert("인증번호를 입력해주세요");
		return;
	}
	$.ajax({
		type:"POST",
		data:{id_:idial,cnumber_:cnumber},
		url : "process/AccessProcess.jsp",
		success:function(result){
			var res = result.trim()
			if(res =="success"){
				alert(nickname+"님 환영합니다!");
				document.access.submit();
			}
			else{
				alert("인증번호가 일치하지 않습니다.");
			}
		}
	});
});
// end of AccessProcess

$("#resend").click(function(){
	var to = $("#to").val()
	var idial = $("#idial").val()
	$.ajax({
		type:"POST",
		data:{id_:idial,to_:to},
		url : "process/ReSendMail.jsp",
		success:function(result){
			var res = result.trim()
			if(res =="success"){
				alert("인증번호가 재 전송 되었습니다!");
			}
			else{
				alert("다시 시도해주세요");
			}
		}
	});
});



</script>
</body>
</html>