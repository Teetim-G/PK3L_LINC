<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">

      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
        <div class="container">
          <a class="navbar-brand js-scroll-trigger" href="#page-top">INDIE WORKERS</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>


          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item ">
                <a class="nav-link" href="LINC_ForumMain.jsp">게시판 <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="LINC_BlogMain.jsp">블로그</a>
              </li>
              
              
            </ul>
            <form class="form-inline my-2 my-lg-0" action="LINC_Search.jsp">
              <input name="keyWord" class="form-control mr-sm-2" type="text"  placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0 mx-2" type="submit" >Search</button>
            </form>
<%      
			if(session.getAttribute("userid")==null){
%>
            <button class="btn btn-outline-primary my-2 my-sm-0 mx-2" onclick="location.href='LINC_Login.jsp'">로그인</button>
<%
			}else{
%>
			<div id="profile" class=" text-center">
     			<a href="LINC_MyPage.jsp" class="text-center text-white mx-2"><%=session.getAttribute("usernick") %></a>
		     	<button class="btn btn-sm btn-secondary " type="button" onclick="location.href='LINC_Logout.jsp'" >로그아웃</button>
		     </div>
<%
			}
%>
          </div>
        </div>

      </nav>
    <div class="mb-5">
    
    </div>

    </header>