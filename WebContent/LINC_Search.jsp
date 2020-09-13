<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="linc.CategoryDTO"%>
<%@page import="linc.UserDTO"%>
<%@page import="linc.ForumDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="linc.LincDAO"%>
<!doctype html>
<html lang="kr">
  <head>
   
   	<title>Search Result</title>
	<%@ include file="BSLoad.jsp" %>

<%LincDAO lincDAO = new LincDAO();
int rsCount = 0;
int pLimit;
String word = request.getParameter("keyWord");%>
  </head>
  <body>
  <%@ include file="header.jsp" %>
    <div id="wrap"class="container">
      <div id="content" class="row profile py-3">
        <div class="col-lg-9 p-5 border">
          <div class="tab-content">
            <div class="tab-pane fade show active" id="list-all" role="tabpanel" aria-labelledby="list-all-list">
              <div class="d-flex flex-column flex-md-row justify-content-between border-bottom pb-3 col-12">

                <h4 id="rsCount">개의 검색 결과..</h4>
                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle btn-sm" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	정렬
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <h6 class="dropdown-header">정렬 </h6>
                    <a class="dropdown-item" href="#">정확순</a>
                    <a class="dropdown-item" href="#">최신순</a>
                  </div>
                </div>
              </div>

              <div class="p-3">
                <ul class="p-3 border-bottom overflow-hidden">
                  <h5>게시판 제목 검색결과</h5>
                  <%
			            ArrayList<CategoryDTO> catDtos = lincDAO.catSearch(word);
                  		rsCount += catDtos.size();
			            if(catDtos.size() < 3){
			            	pLimit = catDtos.size();
			            }else{
			            	pLimit = 3;
			            }
			            if(pLimit == 0){
			            	%>
			            	<p>검색 결과가 없습니다.</p>
			            	
			            	<%
			            	
			            }else{
			            	for(int i=0; i<pLimit; i++) {
			            		CategoryDTO catDto = catDtos.get(i);
				                int num = catDto.getcNum();
				                String name = catDto.getcName();
				                String detail = catDto.getcDetail();
				                
				                %>
				                	<li>
				                      <div class="my-3 border p-2 text-truncate">
				                        <h6><a href="#"><span><%=name %></span></a></h6>
				                        <span><%=detail %></span>
				                      </div>
				
				                	</li>
				                <%
				                
				            }
			            }
			            
			    %>
                  
                  
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
                <ul class="p-3 border-bottom overflow-hidden">
                  <h5>게시물 검색결과</h5>
                  <%
			            ArrayList<ForumDTO> postDtos = lincDAO.forumSearch(word);
                  		rsCount += postDtos.size();
			            if(postDtos.size() < 3){
			            	pLimit = postDtos.size();
			            }else{
			            	pLimit = 3;
			            }
			            if(pLimit == 0){
			            	%>
			            	<span>검색 결과가 없습니다.</span>
			            	
			            	<%
			            	
			            }else{
			            	for(int i=0; i<pLimit; i++) {
				            	ForumDTO postDto = postDtos.get(i);
				                String title = postDto.getfTitle();
				                String content = postDto.getfContent();
				                String cat = lincDAO.catCheck(postDto.getfForumCategory());
				                String user = postDto.getfPostUser();
				                
				                %>
				                <li>
				                    <div class="my-3 border p-2 text-truncate">
				                      <h6><a href="#"><span><%=title %></span></a></h6>
				                      <span class="contents"><%=content %></span>
				                      <div class="font-weight-light w-100">
				                        	<span>게시판 | <%=cat %></span>
				                        	<span class="float-right">작성자 : <%=user %></span>
				                        
				                      </div>
				                    </div>
				
				                </li>
				                
				                <%
				            }
			            }
			            
			    %>
                  
                  
                  
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
                <ul class="p-3 border-bottom overflow-hidden">
                  <h5>사용자 검색결과</h5>
                  <%
			            ArrayList<UserDTO> userDtos = lincDAO.userSearch(word);
                  		rsCount += userDtos.size();
			            if(userDtos.size() < 3){
			            	pLimit = userDtos.size();
			            }else{
			            	pLimit = 3;
			            }
			            if(pLimit == 0){
			            	%>
			            	<span>검색 결과가 없습니다.</span>
			            	
			            	<%
			            	
			            }else{
			            	for(int i=0; i<pLimit; i++) {
				            	UserDTO userDto = userDtos.get(i);
				                String user = userDto.getuNick();
				                
				                %>
				                  <li>

				                    <div class="my-3 border p-2 text-truncate">
				                      <h6><a href="#"><p><%=user %></p></a></h6>
				                      <p>사용자에 대한 설명이 들어갈 공간임니다.</p>
				                    </div>
				
				                  </li>
				                
				                <%
				            }
			            }
			            
			    %>
                  
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
                
              </div>

            </div>
            
            <div class="tab-pane fade show" id="list-post" role="tabpanel" aria-labelledby="list-post-list">
            	<ul class="p-3 border-bottom overflow-hidden">
                  <h5>게시물 검색결과</h5>
                  <%
		            	for(int i=0; i<postDtos.size(); i++) {
			            	ForumDTO postDto = postDtos.get(i);
			                String title = postDto.getfTitle();
			                String content = postDto.getfContent();
			                String cat = lincDAO.catCheck(postDto.getfForumCategory());
			                String user = postDto.getfPostUser();
			                
			                %>
			                <li>
			                    <div class="my-3 border p-2">
			                      <h6><a href="#"><span><%=title %></span></a></h6>
			                      <span name="cont"><%=content %></span>
			                      <div class="font-weight-light w-100">
			                        	<span>게시판 | <%=cat %></span>
			                        	<span class="float-right">작성자 : <%=user %></span>
			                        
			                      </div>
			                    </div>
			
			                </li>
			                
			                <%
			            
			            }
			            
			    %>
                  
                  
                  
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
            
            </div>
            

          </div>
        </div>
        <div class="col-lg-3 p-3">
          <div class="list-group my-2 " id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-secondary list-group-item-action active d-flex justify-content-between align-items-center py-2" id="list-all-list" data-toggle="list" href="#list-all" role="tab" aria-controls="all">
              전체<span class="badge badge-primary badge-pill"><%=rsCount %></span>
            </a>
            <a class="list-group-item list-group-item-secondary list-group-item-action d-flex justify-content-between align-items-center py-2" id="list-post-list" data-toggle="list" href="#list-post" role="tab" aria-controls="post">
              게시판<span class="badge badge-primary badge-pill"><%=catDtos.size()+postDtos.size() %></span>
            </a>
            <a class="list-group-item list-group-item-secondary list-group-item-action d-flex justify-content-between align-items-center py-2" id="list-blog-list" data-toggle="list" href="#list-blog" role="tab" aria-controls="blog">
              사용자<span class="badge badge-primary badge-pill"><%=userDtos.size() %></span>
            </a>

          </div>
          <div class="border p-3 my-2">
            <h5>인기 검색어</h5><hr>
            <ul class="p-2 overflow-hidden">
              <li class="float-left w-50 mb-1">검색어</li>
              <li class="float-left w-50 mb-1">검색어</li>
              <li class="float-left w-50 mb-1">검색어</li>
              <li class="float-left w-50 mb-1">검색어</li>
              <li class="float-left w-50 mb-1">검색어</li>
              <li class="float-left w-50 mb-1">검색어</li>
              <li class="float-left w-50 mb-1">검색어</li>
              <li class="float-left w-50 mb-1">검색어</li>
            </ul>
          </div>
          <div class="border p-3 my-2">
            <h5>검색어 순위</h5><hr>
            <ul class="pl-2">
              <li>1위 ~~</li>
              <li>2위 ~~</li>
              <li>3위 ~~</li>
              <li>4위 ~~</li>
              <li>5위 ~~</li>
              <li>6위 ~~</li>
              <li>7위 ~~</li>
              <li>8위 ~~</li>
              <li>9위 ~~</li>
              <li>10위 ~~</li>
            </ul>
          </div>
        </div>
      </div>

    </div>
	<%@ include file="footer.jsp" %>
	<%@ include file="JsLoad.jsp" %>
  </body>
  
	<script> 
	
		var word = "<%=word%>";
		var rsCount = "<%=rsCount%>";
		$( document ).ready( function() {
	        $( 'span:contains("'+word +'")' ).each(function () {
	            var regex = new RegExp(word,'gi');
	            $(this).html( $(this).text().replace(regex, "<span class='font-weight-bold'>"+word+"</span>") );
	            $('#rsCount').html(rsCount + "개의 검색 결과..");
	        });
	        $('span').text($('span').replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n"," "));
	        
	        
	      } );
		
		
	</script>
</html>