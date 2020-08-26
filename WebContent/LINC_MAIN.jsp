<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  
  <title>WELCOME!! MAINPAGE</title>

  <%@ include file="BSLoad.jsp" %>
  <%@include file="DBCONN.jsp"%>
</head>




<body id="page-top">
  <%@ include file="header.jsp" %>
  <div id="wrap" class="container p-3">
    <div id="content" class="row py-1 px-3"> 
      <div class="	row col-12 col-md-8" id="M_Left">
        <div class="M_Top_con w-100">
        <h5>사진이 있는 게시판</h5><hr>
          <div id="M_list_top ">
            <ul class="list_content position-relative overflow-hidden">
              <li class="list_content_pic float-left mx-2 w-45"><a><img class="mb-2 img-thumbnail" src="https://via.placeholder.com/150x150.png" />
                  <p>안녕</p>
                </a></li>
              <li class="list_content_pic float-left mx-2 w-45"><a><img class="mb-2 img-thumbnail" src="https://via.placeholder.com/150x150.png" />
                  <p>하세요</p>
                </a></li>
              <li class="list_content_pic float-left mx-2 w-45 d-none d-lg-block"><a><img class="mb-2 img-thumbnail" src="https://via.placeholder.com/150x150.png" />
                  <p>제목</p>
                </a></li>
              <li class="list_content_pic float-left mx-2 w-45 d-none d-xl-block"><a><img class="mb-2 img-thumbnail" src="https://via.placeholder.com/150x150.png" />
                  <p>입니다.</p>
                </a></li>
            </ul>
          </div>
        </div>

        <div class="M_con row">
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>자유</h5><hr>
            <ul class="list_content">
<%
String postSQL = "select s_Title, s_MkDate from post_state where Post_Category_n_PostNum = 0 order by s_MkDate;";
PreparedStatement pstmt=null;
ResultSet rs = null;
try{
		pstmt=conn.prepareStatement(postSQL);
		rs=pstmt.executeQuery();
		String postTitle = null;
		int cnt = 0;
		while(rs.next()){
			postTitle = rs.getString("s_Title");
%>
				<li class="text-truncate w-100 "><%=postTitle%></li>
<%
			cnt++;
			if(cnt == 5){
				break;
			}
			
			
		}
		while(cnt<5){
%>
			<li class="text-truncate">글제목.<%=cnt+1%></li>
<%	
		cnt++;
		}
%>
            </ul>
          </div>

<%		
	}catch(SQLException e){
		out.print(e);
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
          <div id="M_list"class="col-lg-6 col-md-12 col-sm-12 col-12">
            <h5>게시판 제목</h5><hr>
            <ul class="list_content">
              <li>요소 1</li>
              <li>요소 2</li>
              <li>요소 3</li>
              <li>요소 4</li>
              <li>요소 5</li>
            </ul>
          </div>
        </div>



      </div>
      <div class="column_right d-none d-md-block col-4" id="M_Right">
<%
	if(session.getAttribute("userid")==null){
%>
		<div id="account" class="px-3 py-4 border text-center align-middle">
          <button id="btn_login" type="button" class="btn btn-secondary btn-lg mb-2 w-100 " onclick="location.href='LINC_Login.jsp'"> 로그인 </button>
          <div class="font-weight-light float-none  "> 
          	
			<a class="float-left text-reset" href="LINC_Sign_Up.jsp">
			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			</svg>
			회원가입</a>
			<div class="float-right">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-lock" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M11.5 8h-7a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1zm-7-1a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-7zm0-3a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z"/>
				</svg>
				<a >아이디</a>
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-dot" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
				</svg>
				<a>비밀번호 찾기</a>
			</div>
          </div>
        </div>

<%
	}else{
		
	

%>
     <div id="profile" class="px-3 py-4 border text-center">
     			<a href="LINC_MyPage.jsp" class="text-reset"><%=session.getAttribute("usernick") %></a>님 반갑습니다.
     	<button class="btn btn-sm btn-secondary" type="button" onclick="location.href='LINC_Logout.jsp'" >로그아웃</button>
     </div>
     
<%
	}
%>
        <div id="banner" class="my-3 w-100">
          <img src="https://via.placeholder.com/345x345.png" class="img-fluid" alt="Responsive image">
        </div>
        <div id="Rank">
          <div id="Rank_title">
            <h5>인기 순위</h6><hr>
          </div>
          <ol class="p-2">
            <li>1위</li>
            <li>2위</li>
            <li>3위</li>
            <li>4위</li>
            <li>5위</li>
            <li>6위</li>
            <li>7위</li>
            <li>8위</li>
            <li>9위</li>
            <li>10위</li>
          </ol>
        </div>
      </div>
    </div>
    </div>
    <%@ include file="footer.jsp" %>
    <%@ include file="JsLoad.jsp" %>
</body>
</html>