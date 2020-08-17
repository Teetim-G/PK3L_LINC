<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
  <head>
    
    <title>This is MyPage</title>


	<%@ include file="BSLoad.jsp" %>
	
  </head>
   <body>
    <div id="wrap"class="container">
    	<%@ include file="header.jsp" %>
    	
      <h2 class="py-3">MY PAGE</h2>
      <div id="content" class="row profile mb-5">
        <div class="col-lg-9 p-5 border">
          <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
              <h5 class="pb-3">회원 정보</h5>
              <hr>
              <form>
                <label for="InputId">아이디</label>
                <div class="form-group form-inline">
                  <input type="text" class="form-control mx-sm-3 mb-2" id="InputId" placeholder="아이디" readonly>
                </div>


                <label for="InputNick">닉네임</label>
                <div class="form-group form-inline mb-2">
                  <input type="text" class="form-control mx-sm-3 mb-2" id="InputNick" placeholder="닉네임">
                  <button type="submit" class="btn btn-primary mb-2 form-control">변경</button>
                </div>
                <label for="InputEmail">이메일</label>
                <div class="form-group form-inline mb-2">
                  <input type="email" class="form-control mx-sm-3 mb-2" id="InputEmail" placeholder="example@email.com">
                  <button type="submit" class="btn btn-primary mb-2 form-control">이메일 재인증</button>
                </div>

              </form>
            </div>
            <div class="tab-pane fade" id="list-chpwd" role="tabpanel" aria-labelledby="list-chpwd-list">
              <div class="">
                <h5 class="pb-3">비밀번호 변경</h5>
                <hr>
                <div class="float-left col-4 col-sm-3">
                  <label for="input_pwd" class="mr-2">비밀번호  설정</label>
                </div>
                <div class="float-left form-group form-inline col-7">
                  <input id="input_pwd" class="form-control"type="text" name="password" value=""><label for="input_pwd" class="ml-2">현재 비밀번호 입력</label><br><br>
                  <input id="input_chpwd" class="form-control"type="text" name="chpassword" value=""><label for="input_chpwd" class="ml-2">변경할 비밀번호 입력</label><br><br>
                  <input id="input_chpwdch" class="form-control"type="text" name="password" value=""><label for="input_chpwdch" class="ml-2">변경할 비밀번호 확인</label><br><br>
                </div>
                <button type="button" name="btnChpwd"class="btn btn-xl btn-primary float-right">비밀번호 변경</button>

              </div>
            </div>
            <div class="tab-pane fade" id="list-post" role="tabpanel" aria-labelledby="list-post-list">
              <div class="">
                <h5 class="pb-3">작성글 관리</h5>
                <hr>

              </div>
              <div class="list-group list-group-horizontal flex-fill" id="list-tab_post" role="tablist">
                <a class="list-group-item list-group-item-action active py-2" id="list-mypost-list" data-toggle="list" href="#list-mypost" role="tab" aria-controls="mypost">게시글 관리</a>
                <a class="list-group-item list-group-item-action py-2" id="list-mycomment-list" data-toggle="list" href="#list-mycomment" role="tab" aria-controls="mycomment">댓글 관리</a>
              </div>
              <div class="tab-content">
                <div class="tab-pane fade show active" id="list-mypost" role="tabpanel" aria-labelledby="list-mypost-list">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col"><input type="checkbox"></th>
                        <th scope="col">게시판</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><input type="checkbox"></th>
                        <td>자유</td>
                        <td>글제목1</td>
                        <td>20.08.14</td>
                      </tr>
                      <tr>
                        <th scope="row"><input type="checkbox"></th>
                        <td>자유</td>
                        <td>글제목2</td>
                        <td>20.08.13</td>
                      </tr>
                      <tr>
                        <th scope="row"><input type="checkbox"></th>
                        <td>게임</td>
                        <td>글제목3</td>
                        <td>20.08.10</td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="">
                    <button type="button" name="button"class="btn btn-outline-secondary float-left">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                      </svg>
                     	 삭제
                    </button>
                    <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#">다음</a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                </div>
                <div class="tab-pane fade" id="list-mycomment" role="tabpanel" aria-labelledby="list-mycomment-list">
                  <table class="table table-hover ">
                    <thead>
                      <tr>
                        <th scope="col"><input type="checkbox"></th>
                        <th scope="col">게시판</th>
                        <th scope="col">댓글내용</th>
                        <th scope="col">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><input type="checkbox"></th>
                        <td>자유</td>
                        <td>글내용</td>
                        <td>20.08.14</td>
                      </tr>
                      <tr>
                        <th scope="row"><input type="checkbox"></th>
                        <td>자유</td>
                        <td>글내용</td>
                        <td>20.08.13</td>
                      </tr>
                      <tr>
                        <th scope="row"><input type="checkbox"></th>
                        <td>게임</td>
                        <td>글내용</td>
                        <td>20.08.10</td>
                      </tr>
                    </tbody>
                  </table>

                  <div class="">
                    <button type="button" name="button"class="btn btn-outline-secondary float-left">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                      </svg>
                    	  삭제
                    </button>
                    <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#">다음</a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>

            </div>
            <div class="tab-pane fade" id="list-withdrawal" role="tabpanel" aria-labelledby="list-withdrawal-list">
              <h5 class="pb-3">회원 탈퇴</h5>
              <hr>
              <form class="text-center">
                <label for="InputId">현재 비밀번호 입력</label>

                <div class="form-group form-inline">
                  <input id="curpwd" class="form-control mx-auto"type="text" name="curpwd" value=""><br>
                </div>
                  <label for="InputId"class="text-danger">"회원 탈퇴"를 입력해 주세요.</label>

                <div class="form-group form-inline">
                  <input id="curpwd" class="form-control mx-auto"type="text" name="curpwd" value=""><br>
                </div>
                <button type="button" name="button"class="btn btn-danger">회원 탈퇴</button>
              </form>
            </div>
          </div>
        </div>
        <div class="col-lg-3 p-5">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active py-4" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">회원정보 관리</a>
            <a class="list-group-item list-group-item-action py-4" id="list-chpwd-list" data-toggle="list" href="#list-chpwd" role="tab" aria-controls="chpwd">비밀번호 변경</a>
            <a class="list-group-item list-group-item-action py-4" id="list-post-list" data-toggle="list" href="#list-post" role="tab" aria-controls="post">작성글 관리</a>
            <a class="list-group-item list-group-item-action py-4" id="list-withdrawal-list" data-toggle="list" href="#list-withdrawal" role="tab" aria-controls="withdrawal">회원 탈퇴</a>
          </div>
        </div>
      </div>
    </div>
    
	<%@ include file="footer.jsp" %>
	<%@ include file="JsLoad.jsp" %>
  </body>
</html>
