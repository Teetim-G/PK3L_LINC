<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
  <head>
   
   	<title>Search Result</title>
	<%@ include file="BSLoad.jsp" %>


  </head>
  <body>
  <%@ include file="header.jsp" %>
    <div id="wrap"class="container">
      <div id="content" class="row profile py-3">
        <div class="col-lg-9 p-5 border">
          <div class="tab-content">
            <div class="tab-pane fade show active" id="list-all" role="tabpanel" aria-labelledby="list-all-list">
              <div class="d-flex flex-column flex-md-row justify-content-between border-bottom pb-3 col-12">

                <h4>14 개 의 검색 결과 . . .</h4>
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
                  <li>
                    <div class="my-3">
                      <a href="#">게시판이름</a>
                      <p>게시판에 대한 설명이 들어갈 공간임니다.</p>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">게시판이름</a>
                      <p>게시판에 대한 설명이 들어갈 공간임니다.</p>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">게시판이름</a>
                      <p>게시판에 대한 설명이 들어갈 공간임니다.</p>
                    </div>

                  </li>
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
                <ul class="p-3 border-bottom overflow-hidden">
                  <h5>게시물 검색결과</h5>
                  <li>
                    <div class="my-3">
                      <a href="#">게시글 제목</a>
                      <p>게시글의 내용이 들어갈 공간임니다.</p>
                      <div class="font-weight-light">
                        게시판 | 게시판분류 > 게시판이름
                      </div>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">게시글 제목</a>
                      <p>게시글의 내용이 들어갈 공간임니다.</p>
                      <div class="font-weight-light">
                        게시판 | 게시판분류 > 게시판이름
                      </div>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">게시글 제목</a>
                      <p>게시글의 내용이 들어갈 공간임니다.</p>
                      <div class="font-weight-light">
                        게시판 | 게시판분류 > 게시판이름
                      </div>
                    </div>

                  </li>
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
                <ul class="p-3 border-bottom overflow-hidden">
                  <h5>블로그 검색결과</h5>
                  <li>

                    <div class="my-3">
                      <a href="#">블로그이름</a>
                      <p>블로그에 대한 설명이 들어갈 공간임니다.</p>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">블로그이름</a>
                      <p>블로그에 대한 설명이 들어갈 공간임니다.</p>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">블로그이름</a>
                      <p>블로그에 대한 설명이 들어갈 공간임니다.</p>
                    </div>

                  </li>
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
                <ul class="p-3 border-bottom overflow-hidden">
                  <h5>블로그 게시물 검색결과</h5>
                  <li>
                    <div class="my-3">
                      <a href="#">게시글 제목</a>
                      <p>게시글의 내용이 들어갈 공간임니다.</p>
                      <div class="">
                        <span class="badge badge-pill badge-secondary">#태그도</span>
                        <span class="badge badge-pill badge-secondary">#있으면</span>
                        <span class="badge badge-pill badge-secondary">#좋을듯</span>
                      </div>
                      <div class="font-weight-light">
                        블로그 | 블로그이름 > 블로그 게시판 이름
                      </div>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">게시글 제목</a>
                      <p>게시글의 내용이 들어갈 공간임니다.</p>
                      <div class="">
                        <span class="badge badge-pill badge-secondary">#태그도</span>
                        <span class="badge badge-pill badge-secondary">#있으면</span>
                        <span class="badge badge-pill badge-secondary">#좋을듯</span>
                      </div>
                      <div class="font-weight-light">
                        블로그 | 블로그이름 > 블로그 게시판 이름
                      </div>
                    </div>

                  </li>
                  <li>
                    <div class="my-3">
                      <a href="#">게시글 제목</a>
                      <p>게시글의 내용이 들어갈 공간임니다.</p>
                      <div class="">
                        <span class="badge badge-pill badge-secondary">#태그도</span>
                        <span class="badge badge-pill badge-secondary">#있으면</span>
                        <span class="badge badge-pill badge-secondary">#좋을듯</span>
                      </div>
                      <div class="font-weight-light">
                        블로그 | 블로그이름 > 블로그 게시판 이름
                      </div>
                    </div>

                  </li>
                  <button type="button" name="button"class="btn btn-sm btn-bd-light float-right">더 보기></button>
                </ul>
              </div>

            </div>

          </div>
        </div>
        <div class="col-lg-3 p-3">
          <div class="list-group my-2 " id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-secondary list-group-item-action active d-flex justify-content-between align-items-center py-2" id="list-all-list" data-toggle="list" href="#list-all" role="tab" aria-controls="all">
              전체<span class="badge badge-primary badge-pill">14</span>
            </a>
            <a class="list-group-item list-group-item-secondary list-group-item-action d-flex justify-content-between align-items-center py-2" id="list-board-list" data-toggle="list" href="#list-board" role="tab" aria-controls="board">
              게시판<span class="badge badge-primary badge-pill">5</span>
            </a>
            <a class="list-group-item list-group-item-secondary list-group-item-action d-flex justify-content-between align-items-center py-2" id="list-blog-list" data-toggle="list" href="#list-blog" role="tab" aria-controls="blog">
              블로그<span class="badge badge-primary badge-pill">9</span>
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
            <h5>아니면 순위</h5><hr>
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
</html>
tml>