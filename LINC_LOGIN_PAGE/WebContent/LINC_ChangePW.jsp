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
    <h2>비밀번호 변경</h2>
    <form action=""id="passform"method="post">
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="text"id="wrpwd" class="form-control">
        </div>
        <div class="col-md-12 form-group">
            <input type="text"id="copwd" class="form-control">
            
        <div id="wrChpwd" class="alert alert-danger d-none" role="alert">
				  변경할 비밀번호가 일치하지 않습니다!
		</div>
		<div id="coChpwd" class="alert alert-primary d-none" role="alert">
				  변경할 비밀번호와 일치합니다!
		</div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="submit" id="pwdChange"class="btn btn-block btn-login"value ="변경하기 " placeholder="dddd" >
        </div>
    </div>
    </form>
</div>
	<script>
	$("#input_pwd").on("propertychange change keyup paste input", function() {// 텍스트값이 변경되었을때를 감지하여 발생하는 이벤트
	    var inputPwd = $(this).val();
	    $('#wrpwd').removeClass('d-none');
		$('#copwd').addClass('d-none');
		var realpwd = "<%=myPwd%>";
	    if(md5(inputPwd) == realpwd) {
	    	$('#copwd').removeClass('d-none');
	    	$('#wrpwd').addClass('d-none');
	        return;
	    }
	});
	$("#input_chpwdch").on("propertychange change keyup paste input", function() {// 텍스트값이 변경되었을때를 감지하여 발생하는 이벤트
	    var chPwdch = $(this).val();
	    var chPwd = $('#input_chpwd').val();
	    $('#wrChpwd').removeClass('d-none');
		$('#coChpwd').addClass('d-none');
	    if(chPwdch == chPwd) {
	    	$('#coChpwd').removeClass('d-none');
	    	$('#wrChpwd').addClass('d-none');
	        return;
	    }
	});
	
	$("#pwdChange").click(function(){
		var chPwd = $('#input_chpwd').val();
		var chPwdch = $('#input_chpwdch').val();
		var realpwd = "<%=myPwd%>";
		if(!curPwd || !chPwd || !chPwdch){
			alert("입력값을 다시 확인해주세요!");
			return;
		}
		if(md5(curPwd) == realpwd) {
	    	if(chPwd == chPwdch){
	    		$("#passform").attr("method", "POST");
	    		$("#passform").attr("action", "passwdModifyAction.jsp");
	    		$("#passform").submit();
	    		return;
	    	}else{
	    		alert("변경할 비밀번호를 다시 확인해주세요!!");
	    		return;
	    	}
	    	
	    }
		alert("현재 비밀번호가 일치하지 않습니다!!");
	});
	
	</script>
</body>
</html>