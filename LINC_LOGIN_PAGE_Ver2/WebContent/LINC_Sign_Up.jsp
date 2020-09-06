<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/LINC_Sign_Up.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*"%>
<div class="container">
      <div class="col-md-6 mx-auto text-center">
         <div class="header-title">
            <a href="LINC_MAIN.jsp"><img src="http://placehold.it/320x100?text=sample" /></a>
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 mx-auto">
               <form action="Access.jsp" method="post" name="login"id="login">
                  <div class="form-group">
                  	<table>
                  		<tr>
                  			<td><label for="idial">아이디</label></td>
                  		</tr>
                  		<tr>
                  			<td><input type="text" name="idial"id="idial"class="form-control" style="IME-MODE: disabled"placeholder="8~20자리"maxlength="20"require>
                  			<td><input type="button"id="idVal" class="btn btn-primary" value="중복체크"></td>
                  		</tr>
                  		<tr>
                  			<td><label for="password">비밀번호</label></td>
                  		</tr>
                  		<tr>
                  			<td><input type="password"name="password"id="password"class="form-control"placeholder="8~16자리"maxlength="16"></td>
                  		</tr>
                  		<tr>
                  			<td><label for="cpassword">비밀번호 재 입력</label></td>
                  		</tr>
                  		<tr>
                  			<td><input type="password"name="cpassword"id="cpassword"class="form-control"placeholder="8~16자리"maxlength="16"></td>
                  		</tr>
                  		<tr>
                  			<td><label for="nickname">닉네임</label></td>
                  		</tr>
                  		<tr>
                  			<td><input type="text"name="nickname"id="nickname"class="form-control"placeholder="최대 10자리"></td>
                  			<td><input type="button"id="nicknameVal" class="btn btn-primary" value="중복체크"maxlength="10"></td>
                  		</tr>
                  		<tr>
                  			<td><label for="to">이메일</label></td>
                  		</tr>
                  		<tr>
                  			<td><input type="email"name="to_"id="to_"class="form-control"></td>
                  			<td><input type="button"id="eMailVal" class="btn btn-primary"  value="중복체크"></td>
                  		</tr>
                  	
                  	</table>
                  </div>
                     <button type="button" id="acc_create" class="btn btn-primary btn-lg btn-block">계정 생성</button>
                     <input type="hidden"id="id_check" value="0"/>
                     <input type="hidden"id="nickname_check" value="0"/>
                     <input type="hidden"id="email_check" value="0"/>
               </form>
         </div>
      </div>
   </div>
   
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" language="javascript">

	$("#idVal").click(function(){
		function checkSpace(str) { if(str.search(/\s/) != -1) { return true; } else { return false; } }
		function checkSpecial(str) { var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		if(special_pattern.test(str) == true) { return true; } else { return false; } }
		
		var id_input = $("#idial").val()
		
		
		if(id_input==""){
			alert("아이디를 입력해주세요");
			document.getElementById("id_check").value = 0
			return;
		}
		if(id_input.length>20 || id_input.length<8){
			alert("아이디는 8~20자리 입니다.");
			document.getElementById("id_check").value = 0
			return;
		}
		if(checkSpace(id_input)||checkSpecial(id_input)){
			alert("공백 또는 특수문자가 포함되면 안됩니다.");
			document.getElementById("id_check").value = 0
			return;
		}
		$.ajax({
			type:"POST",
			data:{id_input_:id_input},
			url : "process/idVal.jsp",
			success:function(result){
				var count = parseInt(result)
				if (count == 0){
					alert("사용 가능한 아이디 입니다");
					document.getElementById("id_check").value = 1
				}
				else{
					alert("이미 존재하는 아이디 입니다");
					document.getElementById("id_check").value = 0
				}
			}
		});
	});
	// end of ID Vildation
	
	$("#nicknameVal").click(function(){
		function checkSpecial(str) { var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		if(special_pattern.test(str) == true) { return true; } else { return false; } }
		
		var nick_input = $("#nickname").val()
		if(nick_input==""){
			alert("닉네임을 입력해주세요");
			document.getElementById("nickname_check").value = 0;
			return;
		}
		if(checkSpecial(nick_input)){
			alert("닉네임에 특수문자가 포함되면 안됩니다");
			document.getElementById("nickname_check").value = 0;
			return;
		}
	
		$.ajax({
			type:"POST",
			data:{nick_input_:nick_input},
			url : "process/nickNameVal.jsp",
			success:function(result){
				var count = parseInt(result)
				if (count == 0){
					alert("사용 가능한 닉네임 입니다");
					document.getElementById("nickname_check").value = 1
				}
				else{
					alert("이미 존재하는 닉네임 입니다");
					document.getElementById("nickname_check").value = 0
				}
			}
		});
	});
		
	// end of NickName Vildation
	
		$("#eMailVal").click(function(){
		var email_input = $("#to_").val()
		if(email_input==""){
			alert("이메일을 입력해주세요");
			document.getElementById("email_check").value = 0
			return;
		}
		function chkEmail(str) {

		    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		    if (regExp.test(str)) return true;

		    else return false;

		}
		if(!chkEmail(email_input)){
			alert("정확한 이메일을 입력해 주세요");
			document.getElementById("email_check").value = 0
			return;
		}
		$.ajax({
			type:"POST",
			data:{email_input_:email_input},
			url : "process/mailVal.jsp",
			success:function(result){
				var count = parseInt(result)
				if (count == 0){
					alert("사용 가능한 이메일 입니다");
					document.getElementById("email_check").value = 1
				}
				else{
					alert("이미 등록된 이메일입니다");
					document.getElementById("email_check").value = 0
				}
			}
		});
	});
		// end of EMail Vildation
		
		$("#acc_create").click(function(){
		var id = $("#idial").val()
		var pw = $("#password").val()
		var nick = $("#nickname").val()
		var email = $("#to").val()
		
		if(document.getElementById("id_check").value==0){
			alert("아이디 중복확인이 필요합니다");
			return;
		}
		if(document.getElementById("nickname_check").value==0){
			alert("닉네임 중복확인이 필요합니다");
			return;
		}
		if(document.getElementById("email_check").value==0){
			alert("이메일  중복확인이 필요합니다");
			return;
		}
		if($("#password").val()!=$("#cpassword").val()){
			alert("비밀번호가 일치하지 않습니다");
			return; 
		}
		$.ajax({
			type:"POST",
			data:{id_:id,pw_:pw,nick_:nick,email_:email},
			url : "process/SendMail.jsp",
			success:function(result){
				var res = result.trim()
				if(res =="success"){
					alert("입력하신 이메일로 인증번호가 발송되었습니다.");
					document.login.submit();
				}
				
			}
		});
	});
</script>
   
</body>
</html>