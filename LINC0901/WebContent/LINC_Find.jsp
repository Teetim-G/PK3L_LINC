<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="BSLoad.jsp" %>
<div id="wrap"class="container">
    	
      <h2 class="py-3">ID찾기 /PW 변경</h2>
      <div id="content" class="row profile mb-5">
        <div class="col-lg-9 p-5 border">
          <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
              <h5 class="pb-3">ID찾기</h5>
              <hr>
              <form action="process/FindID.jsp">
                <label for="InputNick">이메일 주소</label>
                <div class="form-group form-inline mb-2">
                  <input type="text" class="form-control mx-sm-3 mb-2" name="Inputemail" placeholder="">
                  <button type="submit" class="btn btn-primary mb-2 form-control">아이디 찾기</button>
                </div>
              </form>
            </div>
            <div class="tab-pane fade" id="list-chpwd" role="tabpanel" aria-labelledby="list-chpwd-list">
            <h5 class="pb-3">비밀번호 재발급</h5>
              <hr>
              <form id="passform" action = "process/FindPW.jsp">
                <label for="InputNick">아이디</label>
                <div class="form-group form-inline mb-2">
                  <input type="text" class="form-control mx-sm-3 mb-2" name="InputID" placeholder="">
                </div>
                <label for="InputEmail">이메일 주소</label>
                <div class="form-group form-inline mb-2">
                  <input type="email" class="form-control mx-sm-3 mb-2" name="InputEmail" placeholder="">
                  <button type="submit" class="btn btn-primary mb-2 form-control">임시 비밀번호 발급</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="col-lg-3 p-5">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active py-4" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">아이디 찾기</a>
            <a class="list-group-item list-group-item-action py-4" id="list-chpwd-list" data-toggle="list" href="#list-chpwd" role="tab" aria-controls="chpwd">비밀번호 변경</a>
          </div>
        </div>
      </div>
    </div>
	<%@ include file="JsLoad.jsp" %>

	
</body>
</html>