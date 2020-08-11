<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="Login-style.css">
</head>
<body>
<body>
        <div class="wrap">
            <div class="form-wrap">
                <form id="login" action="" class="input-group">
                  <img class="logo"src="http://placehold.it/300x100" alt="">
                    <input type="text" class="input-field" placeholder="Email" required>
                    <input type="password" class="input-field" placeholder="Password" required>
			              <input type="checkbox" id="jb-input-checkbox" class="checkbox">
                    <label for="jb-input-checkbox">자동 로그인</label>
                    <button class="submit">로그인</button>
                    <h6 class="find-id-pw">아이디 / 비밀번호 찾기</h6> <h6 class="sign-up">회원 가입</h6>

            </div>
        </div>
          </form>
</body>
</html>