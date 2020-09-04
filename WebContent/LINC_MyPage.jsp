<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
  <head>
    
    <title>This is MyPage</title>


	<%@ include file="BSLoad.jsp" %>
	<%@include file="DBCONN.jsp"%>
  </head>
 <%
 
	String uID = (String)session.getAttribute("userid"); 
 	if(uID == null){
 		response.sendRedirect("LINC_Login.jsp");
 	}
	String sSQL = "select * from user_stat where s_ID= ?";
	PreparedStatement pstmt=null;
	ResultSet rs = null;
%>
<%
try{
		pstmt=conn.prepareStatement(sSQL);
		pstmt.setString(1, uID);
		rs=pstmt.executeQuery();
		rs.next();
		String myName = rs.getString("s_ID");
		String myNick = rs.getString("s_NickName");
		String myPwd = rs.getString("s_Password");
		String myEmail = rs.getString("s_EMail");
		
		
%>
   <body><!-- 바디 시작 -->
    <div id="wrap"class="container">
    	<%@ include file="header.jsp" %>
    	
      <a href="LINC_MyPage.jsp" class="text-reset"><h2 class="py-3">MY PAGE</h2></a>
      
      <div id="content" class="row profile mb-5">
      
        <div class="col-lg-9 p-5 border" id="leftContent">
        
          <div class="tab-content" id="nav-tabContent">
          
            <div class="tab-pane fade show active" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list"><!-- 회원 정보 시작 -->
            
              <h5 class="pb-3">회원 정보</h5>
              <hr>

              <div>
                <label for="InputId">아이디</label>
                <div class="form-group form-inline">
                  <input type="text" class="form-control mx-sm-3 mb-2" id="InputId" placeholder="<%=myName%>" readonly>
                </div>


                <label for="InputNick">닉네임</label>
                <div class="form-group form-inline mb-2"method="post" name="chNickform" " >
                  <input type="text" class="form-control mx-sm-3 mb-2" id="InputNick" placeholder="<%=myNick%>">
                  <button id="modifyNick"type="button" class="btn btn-primary mb-2 form-control"  >변경</button>
                </div>
                <div id="nickSucs" class="alert alert-primary d-none" role="alert">
					  닉네임 변경에 성공했습니다!!
				  </div>
				  <div id="nickFail" class="alert alert-danger  d-none" role="alert">
					  중복된 닉네임이 존재합니다!!
				  </div>
                
				  
                <label for="InputEmail">이메일</label>
                <div class="form-group form-inline mb-2">
                  <input type="email" class="form-control mx-sm-3 mb-2" id="InputEmail" placeholder="<%=myEmail%>">
                  <button id="btnEmailRecert" type="button" class="btn btn-primary mb-2 form-control" data-toggle="modal" data-target="#EmailRecertModal">이메일 재인증</button>
                  
                  <div class="modal fade" id="EmailRecertModal" tabindex="-1" aria-labelledby="EmailRecertModalLabel" aria-hidden="true">
					   <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">이메일 재인증</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form>
					          <div class="form-group">
					            <label for="Input_Cert_Num" class="col-form-label mx-auto">인증번호 :</label>
					            <input type="text" class="form-control mx-auto" id="Input_Cert_Num">
					          </div>
					        </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary" id="CertCheck">인증번호 확인</button>
					      </div>
					    </div>
					  </div>
					</div>
                  
                </div>
				
				
				
              </div>
              
              
              
              
            </div><!-- 회원 정보 끝 -->
            
            
            
            <div class="tab-pane fade" id="list-chpwd" role="tabpanel" aria-labelledby="list-chpwd-list"><!-- 비밀번호 변경 시작 -->
            
              <div id="passform">
              
                <h5 class="pb-3">비밀번호 변경</h5>
                
                <hr>
                
                <div class="float-left col-4 col-sm-3">
                  <label for="input_pwd" class="mr-2">비밀번호  설정</label>
                </div>
                
                <div class="float-left form-group form-inline col-7">
                	<input id="input_pwd" class="form-control mb-3"type="password" name="password" value=""><label for="input_pwd" class="ml-2 mb-3">현재 비밀번호 입력</label>
                  
                	<div id="wrpwd" class="alert alert-danger d-none" role="alert">
					  현재 비밀번호가 일치하지 않습니다!
					</div>
				  
					<div id="copwd" class="alert alert-primary d-none" role="alert">
					  현재 비밀번호와 일치합니다!
					</div>
				  
                  	<input id="input_chpwd" class="form-control mb-3"type="password" name="chpassword" value=""><label for="input_chpwd" class="ml-2 mb-3">변경할 비밀번호 입력</label>
                  
                  	<input id="input_chpwdch" class="form-control mb-3"type="password" name="passwordch" value=""><label for="input_chpwdch" class="ml-2 mb-3">변경할 비밀번호 확인</label>
                 
                	<div id="wrChpwd" class="alert alert-danger d-none" role="alert">
				  		변경할 비밀번호가 일치하지 않습니다!
					</div>
					
					<div id="coChpwd" class="alert alert-primary d-none" role="alert">
					 	변경할 비밀번호와 일치합니다!
					</div>
				
                </div>
                
                <button id="pwdChange" type="button" name="btnChpwd"class="btn btn-xl btn-primary float-right" >비밀번호 변경</button>
                
                <div id="sucsModal" class="modal" tabindex="-1"> <!-- 변경 성공 알림 -->
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body">
				        <p>비밀번호 변경에 성공했습니다!!!</p>
				      </div>
				      <div class="modal-footer">
				        <button id="pwdChanged"type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<div id="failModal"class="modal" tabindex="-1"> <!-- 변경 실패 알림 -->
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body">
				        <p>비밀번호 변경에 실패했습니다..</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
              </div>
              
              
              
            </div><!-- 비밀번호 변경 끝 -->
            
            
            
            
            <div class="tab-pane fade" id="list-post" role="tabpanel" aria-labelledby="list-post-list"><!-- 작성글 관리 시작 -->
              <div class="">
                <h5 class="pb-3">작성글 관리</h5>
                <hr>

              </div><%-- sSQL = "select * from post_state where User_Stat_s_ID = " + session.getAttribute("userid") ; --%>
<%
				sSQL = "select * from forum where s_PostUser = ? and is_Delete = 0 " ;
                
                pstmt=conn.prepareStatement(sSQL);
                pstmt.setString(1, uID);
                rs=pstmt.executeQuery();
                String Title;
                String Date;
                int Board;
                int PostNum;
                int cntPost=0;
%>
              <div class="list-group list-group-horizontal flex-fill" id="list-tab_post" role="tablist">
                <a class="list-group-item list-group-item-action active py-2" id="list-mypost-list" data-toggle="list" href="#list-mypost" role="tab" aria-controls="mypost">게시글 관리</a>
                <a class="list-group-item list-group-item-action py-2" id="list-mycomment-list"  data-toggle="list" href="#list-mycomment" role="tab" aria-controls="mycomment">댓글 관리</a>
              </div>
              <div class="tab-content">
                <div class="tab-pane fade show active" id="list-mypost" role="tabpanel" aria-labelledby="list-mypost-list">
                  <table id="tblPost"class="table table-hover">
                    <thead>
                      <tr>
                      
                        <th scope="col"><input type="checkbox" class="pchk" id="post_chk_all"></th>
                        <th scope="col">게시판번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%
                    while(rs.next()){
                    	Title = rs.getString("s_Title");
                    	Date = rs.getString("s_WriteDay");
                    	Board = rs.getInt("n_ForumCategory");
                    	PostNum = rs.getInt("n_PostOrder");
                    	cntPost++;
                    	%>
                    	<tr>
                        <td ><input type="checkbox" class="pchk" name="pchk" value="<%=PostNum %>"onclick="event.cancelBubble=true"></td>
                        <td><%=Board %></td>
                        <td><%=Title %></td>
                        <td><%=Date %></td>
                      	</tr>
                    	<%
                    }
                    
                    %>
                    <input id="cntPost" type="hidden" value=<%=cntPost %>>
                    </tbody>
                  </table>
                  <div class="">
                    <button type="button" name="button"class="btn btn-outline-secondary float-left"id="btn_dltPost">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                      </svg>
                     	 삭제
                    </button>
                  </div>
                </div>
                <div class="tab-pane fade" id="list-mycomment" role="tabpanel" aria-labelledby="list-mycomment-list">
                  <table id="tblComt" class="table table-hover ">
                    <thead>
                      <tr>
                        <th scope="col"><input type="checkbox" class="cchk" id="comt_chk_all"></th>
                        <th scope="col">게시글번호</th>
                        <th scope="col">댓글내용</th>
                        <th scope="col">작성일</th>
                      </tr>
                    </thead>
                    <%
                    sSQL = "select * from comment where s_CommentWriter = ? and is_Delete = 0" ;
                    pstmt=conn.prepareStatement(sSQL);
                    pstmt.setString(1, uID);
                    rs=pstmt.executeQuery();
                    String cmt;
                    int cntCmt=0, ComtNum;
                    %>
                    <tbody>
                    <%
                    while(rs.next()){
                    	cmt = rs.getString("s_Comment");
                    	Date = rs.getString("s_WriteDay");
                    	Board = rs.getInt("n_ForumNum");
                    	ComtNum = rs.getInt("n_CommentOrder");
                    	cntCmt++;
                    	%>
                    	<tr>
                        <td><input type="checkbox" class="cchk" name="cchk" id="cchk1" value="<%=ComtNum %>"onclick="event.cancelBubble=true"></th>
                        <td><%=Board %></td>
                        <td><%=cmt %></td>
                        <td><%=Date %></td>
                      </tr>
                    	<%
                    }
                    
                    %>
                    <input id="cntCmt" type="hidden" value=<%=cntCmt %>>
					</tbody>
                  </table>

                  <div class="">
                    <button type="button" name="button"class="btn btn-outline-secondary float-left" id="btn_dltComt">
                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                      </svg>
                    	  삭제
                    </button>
                  </div>
                </div>
              </div>
              <div id="dltPostModal" class="modal" tabindex="-1"> <!-- 게시글 삭제 확인 -->
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body">
				        <p>선택한 항목을 삭제합니다. 진행하시겠습니까?</p>
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button id="dltPostOK"type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				<div id="dltComtModal" class="modal" tabindex="-1"> <!-- 댓글 삭제 확인 -->
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body">
				        <p>선택한 항목을 삭제합니다. 진행하시겠습니까?</p>
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button id="dltComtOK"type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>

            </div><!-- 작성글 관리 끝 -->
            
            <div class="tab-pane fade" id="list-withdrawal" role="tabpanel" aria-labelledby="list-withdrawal-list"><!-- 회원 탈퇴 시작 -->
              <h5 class="pb-3">회원 탈퇴</h5>
              <hr>
              <form class="text-center">
                <label for="input_curPwd_wd">현재 비밀번호 입력</label>

                <div class="form-group form-inline">
                  <input id="input_curPwd_wd" class="form-control mx-auto"type="password" name="input_curPwd_wd" value=""><br>
                </div>
                  <label for="input_wd"class="text-danger">"회원 탈퇴"를 입력해 주세요.</label>

                <div class="form-group form-inline">
                  <input id="input_wd" class="form-control mx-auto"type="text" name="input_wd" value=""><br>
                </div>
                <button id="btn_wd" type="button" name="button"class="btn btn-danger">회원 탈퇴</button>
              </form>
              
              <div id="wdModal" class="modal" tabindex="-1"> <!-- 회원 탈퇴 알림 -->
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body">
				        <p>회원 탈퇴하면 되돌릴 수 없습니다. 정말로 진행하시겠습니까?</p>
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button id="wdOK"type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
            </div><!-- 회원 탈퇴 끝 -->
            
          </div>
        </div><!-- 왼쪽 콘텐츠 끝 -->
        
        <div class="col-lg-3 p-5"><!-- 선택 탭 시작 -->
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active py-4" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">회원정보 관리</a>
            <a class="list-group-item list-group-item-action py-4" id="list-chpwd-list" data-toggle="list" href="#list-chpwd" role="tab" aria-controls="chpwd">비밀번호 변경</a>
            <a class="list-group-item list-group-item-action py-4" id="list-post-list" data-toggle="list" href="#list-post" role="tab" aria-controls="post">작성글 관리</a>
            <a class="list-group-item list-group-item-action py-4" id="list-withdrawal-list" data-toggle="list" href="#list-withdrawal" role="tab" aria-controls="withdrawal">회원 탈퇴</a>
          </div>
        </div>
        
      </div><!-- 콘텐츠 끝 -->
      
    </div>
	
	
	
  </body><!-- 바디 끝 -->
    
	<%@ include file="footer.jsp" %>
	<%@ include file="JsLoad.jsp" %>
  <script type="text/javascript">		// 자바스크립트
		
  
  		
  
  
		// 체크박스 전체선택 및 전체해제
		var CertNum;
  		var uID = "<%=uID%>";
		$("#post_chk_all").click(function(){
		    if($("#post_chk_all").is(":checked")){
		        $(".pchk").prop("checked", true);
		    }
		    else{
		        $(".pchk").prop("checked", false);
		    }
		});
		// 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
		$(".pchk").click(function(){
		    if($("input[name='pchk']:checked").length == $("#cntPost").val()){
		        $("#post_chk_all").prop("checked", true);
		    }else{
		        $("#post_chk_all").prop("checked", false);
		    }
		});
		// 체크박스 전체선택 및 전체해제
		$("#comt_chk_all").click(function(){
		    if($("#comt_chk_all").is(":checked")){
		        $(".cchk").prop("checked", true);
		    }
		    else{
		        $(".cchk").prop("checked", false);
		    }
		});
		// 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
		$(".cchk").click(function(){
		    if($("input[name='cchk']:checked").length == $("#cntCmt").val()){
		        $("#comt_chk_all").prop("checked", true);
		    }else{
		        $("#comt_chk_all").prop("checked", false);
		    }
		});
		
		$(".list-group-item").click(function(){// 탭 변경시 체크박스값 초기화
			$(".pchk").prop("checked", false);
			$(".cchk").prop("checked", false);
		});
		
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

		
		$("#pwdChange").click(function(){// 비밀번호 변경 이벤트
			
			
			var curPwd = $('#input_pwd').val();
			var chPwd = $('#input_chpwd').val();
			var chPwdch = $('#input_chpwdch').val();
			var realpwd = "<%=myPwd%>";
			if(!curPwd || !chPwd || !chPwdch){
				alert("입력값을 다시 확인해주세요!");
				return;
			}else if(curPwd == chPwd){
				alert("현재 비밀번호와 변경할 비밀번호가 일치합니다!!");
				return;
			}
			if(md5(curPwd) == realpwd) {
				
		    	if(chPwd == chPwdch){
		    		$.ajax({
				        type:"POST",
				        url:"process/pwdModify.jsp",
				        data : {newPwd : chPwd},
				        success: function(data){ // 
				        	data = $.trim(data)
				        	if(data == "1"){
				        		$('#sucsModal').modal('show')
				        	}else if(data == "0"){
				        		$('#failModal').modal('show')
				        	}else{
				        		alert(data);
				        	}
				        },
				        error: function(xhr, status, error) {
				            alert(error);
				        }  
				    });
		    		return;
		    	}else{
		    		alert("변경할 비밀번호를 다시 확인해주세요!!");
		    		return;
		    	}
		    	
		    }
			alert("현재 비밀번호가 일치하지 않습니다!!");
		});
		$("#btn_wd").click(function(){// 회원탈퇴 버튼 클릭
			var curPwd = $('#input_curPwd_wd').val();
			var realpwd = "<%=myPwd%>";
			var wdCheck = $('#input_wd').val();
			if(md5(curPwd) == realpwd && wdCheck == "회원 탈퇴" ){
				$('#wdModal').modal('show');
				return;
			}else if(md5(curPwd) != realpwd){
				alert("현재 비밀번호가 일치하지 않습니다!");
				return;
			}else if(wdCheck != "회원 탈퇴"){
				alert("회원 탈퇴를 정확하게 입력해주세요!!");
				return;
			}
		});
		$("#btn_dltPost").click(function(){// 게시글 삭제 버튼 클릭
			$('#dltPostModal').modal('show');
		});
		$("#dltPostOK").click(function(){// 게시글 삭제 확인 버튼 클릭
			var values = document.getElementsByName("pchk");
			var checkRows = $("[name='pchk']:checked");
			
			

			for(var i=0;i<values.length;i++){
				if(values[i].checked){
					$.ajax({
				        type:"POST",
				        url:"process/Delete_Post.jsp",
				        data : {Num : values[i].value},
				        success: function(data){
				        	for(var i=checkRows.length-1;i>-1;i--){
				        		checkRows.eq(i).closest('tr').remove();
								
				        	}
				        	$("#cntPost").val($("#cntPost").val() - 1);
				        	
				        },
				        error: function(xhr, status, error) {
				            alert(error);
				        }  
				    });
				}
			}
			
		
		});
		$("#btn_dltComt").click(function(){// 댓글 삭제 버튼 클릭
			$('#dltComtModal').modal('show');
		});
		$("#dltComtOK").click(function(){// 댓글 삭제 확인 버튼 클릭
			var values = document.getElementsByName("cchk");
			var checkRows = $("[name='cchk']:checked");
			
			
			for(var i=0;i<values.length;i++){
				if(values[i].checked){
					$.ajax({
				        type:"POST",
				        url:"process/Delete_Comt.jsp",
				        data : {Num : values[i].value},
				        success: function(data){
				        	for(var i=checkRows.length-1;i>-1;i--){
				        		checkRows.eq(i).closest('tr').remove();
				        	}

			        		$("#cntCmt").val($("#cntCmt").val() - 1);
				        },
				        error: function(xhr, status, error) {
				            alert(error);
				        }  
				    });
					
				}
			}
			
		
		});
		$("#wdOK").click(function(){// 회원탈퇴 확인
			$.ajax({
		        type:"POST",
		        url:"process/Delete_User.jsp",
		        success: function(data){ // 성공시 data 0 반환, 중복된 닉네임 존재시 data 1 반환
					data = $.trim(data)
		        	if(data == "0"){
		        		alert("삭제되었습니다!");
		        	}else if(data == "1"){
		        		
		        	}else{
		        		alert(data);
		        	}
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    });
			location.href = "LINC_Logout.jsp";
		});
		
		$("#pwdChanged").click(function(){// 비밀번호 변경 완료시 부분 새로고침
			location.reload();
		});
		
		$("#modifyNick").click(function(){ // 닉네임 변경 중복확인
			var inputNick = $("#InputNick").val();
			if(inputNick == ""){
        		alert("변경값을 입력해주세요!");
        		$('#nickSucs').addClass('d-none');
		    	$('#nickFail').addClass('d-none');
		    	return;
        	}
			$.ajax({
		        type:"POST",
		        url:"process/dupCheck_Nick.jsp",
		        data : {Nick : inputNick},
		        success: function(data){ // 성공시 data 0 반환, 중복된 닉네임 존재시 data 1 반환
					data = $.trim(data);
		        	if(data == "0"){
			        	$('#nickSucs').removeClass('d-none');
				    	$('#nickFail').addClass('d-none');
		        		
		        	}else if(data == "1"){
		        		$('#nickSucs').addClass('d-none');
				    	$('#nickFail').removeClass('d-none');
		        	}else{
		        		alert(data);
		        	}
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    });

		});
		$("#btnEmailRecert").click(function(){// 이메일 재인증
			var NewEMail = $("#InputEmail").val();
			$.ajax({
		        type:"POST",
		        url:"process/ReSendMail.jsp",
		        data : {idial : uID,
		        		to : NewEMail},
		        success: function(Number){ // 
		        	Number = $.trim(Number)
		        	CertNum = Number;

		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    });
		});
		$("#CertCheck").click(function(){// 이메일 인증번호 확인
			var NewEMail = $("#InputEmail").val();
			var CertCheck = $("#Input_Cert_Num").val();
			if(CertNum == CertCheck){
				$.ajax({
			        type:"POST",
			        url:"process/AccessProcess.jsp",
			        data : {cnumber : CertNum},
			        success: function(Number){ 
			        	CertNum = null;
			        	alert("이메일 재인증에 성공했습니다!!");
			        	$.ajax({
					        type:"POST",
					        url:"process/Update_EMail.jsp",
					        data : {idial : uID,
					        		to : NewEMail},
					        success: function(Number){ // 

					        	$('#EmailRecertModal').modal('hide');

					        },
					        error: function(xhr, status, error) {
					            alert(error);
					        }  
					    });
						
			        },
			        error: function(xhr, status, error) {
			            alert(error);
			        }  
			    });
			}
		});
		$("#tblPost tr").click(function(){ // 테이블 행 클릭시 체크박스 선택
			var checkbox =  $(this).find('input[type="checkbox"]');
			
			if(checkbox.is(':checked')){
		        checkbox.prop('checked', false);
		    }else{
		    	checkbox.prop('checked', true);
		    }
			if($("input[name='pchk']:checked").length == $("#cntPost").val()){
		        $("#post_chk_all").prop("checked", true);
		    }else{
		        $("#post_chk_all").prop("checked", false);
		    }	
		});
		$("#tblComt tr").click(function(){ // 테이블 행 클릭시 체크박스 선택
			var checkbox =  $(this).find('input[type="checkbox"]');
			
			if(checkbox.is(':checked')){
		        checkbox.prop('checked', false);
		    }else{
		    	checkbox.prop('checked', true);
		    }
			if($("input[name='cchk']:checked").length == $("#cntCmt").val()){
		        $("#comt_chk_all").prop("checked", true);
		    }else{
		        $("#comt_chk_all").prop("checked", false);
		    }	
		});
		$('#list-tab a').click(function(e) {//새로고침시 탭 유지
			  e.preventDefault();
			  $(this).tab('show');
			});

			// store the currently selected tab in the hash value
		$(".list-group > a").on("shown.bs.tab", function(e) {
			  var id = $(e.target).attr("href").substr(1);
			  window.location.hash = id;
		});

			// on load of the page: switch to the currently selected tab
		var hash = window.location.hash;
		$('#list-tab a[href="' + hash + '"]').tab('show');

		
		
		
		
	</script>
<%		
	}catch(SQLException e){
		out.print(e);
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
</html>
