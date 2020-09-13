<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/LINC_Login.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="simple-login-container">
    <h2>로고 들어갈 자리</h2>
    <form action="LINC_MAIN.jsp" name="login_form"id="login_form"method="post">
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="text"id="idial"name="idial" class="form-control" placeholder="ID">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="password"id="userpwd"name="userpwd" placeholder="Password" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="button"id="btn_login"name="btn_login" class="btn btn-block btn-login"value ="로그인" placeholder="dddd" >
            <input type="hidden"id="to_"name="to_"value="">
            <input type="hidden"id="nickname"name="nickname"value="">
        </div>
    </div>
    </form>
    <div class="row">
        <a style="margin-left:50px;"href="LINC_Sign_Up.jsp">회원가입</a>
        <a href="LINC_Find.jsp">아이디/비밀번호 찾기</a>
    </div>
</div>

<%@ include file="JsLoad.jsp" %>
<script type="text/javascript">
$("#btn_login").click(function(){
		var InputID = $("#idial").val()
		var InputPW = $("#userpwd").val()
		if(InputID==""){
			alert("아이디를 입력해주세요");
			return;
		}
		if(InputPW==""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		$.ajax({
			type:"POST",
			data:{InputID_:InputID,InputPW_:InputPW},
			url : "process/LoginProcess.jsp",
			success:function(result){
				var res = result.trim().split('/');
				if(res[0]=="인증"){
					document.login_form.submit()
				}
				else if (res[0]=="차단"){
					alert("현재 차단된 계정입니다.");
				}
				else if (res[0]=="미인증"){
					alert("이메일 인증이 필요한 계정입니다.");
					document.getElementById("to_").value= res[1]
					document.getElementById("nickname").value= res[2]
					document.login_form.action ='Access.jsp';
					document.login_form.submit();
				}
				else if(res[0]=="관리자"){
					location.href='LINC_AdminPgmain.jsp';
				}
				
				else{
					alert(result.trim());
				}
			}
		});
	});
</script>
</body>
</html>