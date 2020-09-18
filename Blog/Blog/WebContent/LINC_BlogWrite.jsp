<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="BSLoad.jsp"%>
<meta charset="UTF-8">
<script type="text/javascript" src="SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="SE2/photo_uploader/plugin/hp_M_AttachQuickPhoto.js" charset="utf-8"></script>

<title>게시글 작성</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>


<script type="text/javascript">
function preview(Post){ //미리보기

	var pv_title = "미리보기";
	var url = "LINC_BlogWritePreview.jsp";
	window.open(url,"미리보기","width=850, height=600, location=no, status=no, scrollbars=yes");
	post.target = pv_title;
	post.action = url;
	post.method = "post";
	post.submit();

}

//파일 업로드
	// 파일 리스트 번호
	var fileIndex = 0;
	// 등록할 전체 파일 사이즈
	var totalFileSize = 0;
	// 파일 리스트
	var fileList = new Array();
	// 파일 사이즈 리스트
	var fileSizeList = new Array();
	// 등록 가능한 파일 사이즈 MB
	var uploadSize = 50;
	// 등록 가능한 총 파일 사이즈 MB
	var maxUploadSize = 500;

	$(function (){
			// 파일 드롭 다운
			fileDropDown();
	});

	// 파일 드롭 다운
	function fileDropDown(){
			var dropZone = $("#dropZone");
			//Drag기능
			dropZone.on('dragenter',function(e){
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color','#E3F2FC');
			});
			dropZone.on('dragleave',function(e){
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color','#FFFFFF');
			});
			dropZone.on('dragover',function(e){
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color','#E3F2FC');
			});
			dropZone.on('drop',function(e){
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color','#FFFFFF');

					var files = e.originalEvent.dataTransfer.files;
					if(files != null){
							if(files.length < 1){
									alert("폴더 업로드 불가");
									return;
							}
							selectFile(files)
					}else{
							alert("ERROR");
					}
			});
	}

		// 파일 선택시
		function selectFile(files){
				// 다중파일 등록
				if(files != null){
						for(var i = 0; i < files.length; i++){
								// 파일 이름
								var fileName = files[i].name;
								var fileNameArr = fileName.split("\.");
								// 확장자
								var ext = fileNameArr[fileNameArr.length - 1];
								// 파일 사이즈(단위 :MB)
								var fileSize = files[i].size/1024/1024;

								if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
										// 확장자 체크
										alert("등록 불가 확장자");
										break;
								}else if(fileSize > uploadSize){
										// 파일 사이즈 체크
										alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
										break;
								}else{
										// 전체 파일 사이즈
										totalFileSize += fileSize;

										// 파일 배열에 넣기
										fileList[fileIndex] = files[i];

										// 파일 사이즈 배열에 넣기
										fileSizeList[fileIndex] = fileSize;

										// 업로드 파일 목록 생성
										addFileList(fileIndex, fileName, fileSize);

										// 파일 번호 증가
										fileIndex++;
								}
						}
				}else{
						alert("ERROR");
				}
		}

		// 업로드 파일 목록 생성
		function addFileList(fIndex, fileName, fileSize){
				var html = "";
				html += "<tr id='fileTr_" + fIndex + "'>";
				html += "    <td class='left' >";
				html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"
				html += "    </td>"
				html += "</tr>"

				$('#fileTableTbody').append(html);
		}

		// 업로드 파일 삭제
		function deleteFile(fIndex){
				// 전체 파일 사이즈 수정
				totalFileSize -= fileSizeList[fIndex];

				// 파일 배열에서 삭제
				delete fileList[fIndex];

				// 파일 사이즈 배열 삭제
				delete fileSizeList[fIndex];

				// 업로드 파일 테이블 목록에서 삭제
				$("#fileTr_" + fIndex).remove();
		}

		// 파일 등록
		function uploadFile(){
				// 등록할 파일 리스트
				var uploadFileList = Object.keys(fileList);

				// 파일이 있는지 체크
				if(uploadFileList.length == 0){
						// 파일등록 경고창
						alert("파일이 없습니다.");
						return;
				}

				// 용량을 500MB를 넘을 경우 업로드 불가
				if(totalFileSize > maxUploadSize){
						// 파일 사이즈 초과 경고창
						alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
						return;
				}

				if(confirm("등록 하시겠습니까?")){
						// 등록할 파일 리스트를 formData로 데이터 입력
						var form = $('#uploadForm');
						var formData = new FormData(form);
						for(var i = 0; i < uploadFileList.length; i++){
								formData.append('files', fileList[uploadFileList[i]]);
						}

						$.ajax({
								url:"업로드 경로",
								data:formData,
								type:'POST',
								enctype:'multipart/form-data',
								processData:false,
								contentType:false,
								dataType:'json',
								cache:false,
								success:function(result){
										if(result.data.length > 0){
												alert("성공");
												location.reload();
										}else{
												alert("실패");
												location.reload();
										}
								}
						});
				}
		}

</script>

<style>
ul, li {list-style:none;}

body {
  margin: 0;
}

#wrap {
	width: 100%;
	height: 100%;
}

#main {
	width: 1200px;
	overflow: auto;
	margin: auto;
}

#menu {
	width: 200px;
	height: auto;
	float: left;
	text-align: center;
}

#contents {
	width:1000px;
	overflow: auto;
	height: 100%;
}

#conmain {
	width:100%;
	height:100%;
}

#header {
	height: 56px;
}

</style>

</head>
<body>
	<%@ include file="LINC_DBConnect.jsp"%>
	<% request.setCharacterEncoding("utf-8"); %>

	<div id="wrap">
		<div id="header">
			<%@ include file="header.jsp" %>
  	</div>
			<div id="main">
	        <div id="menu">
	      		<div class="list-group" id="list-tab" role="tablist">
	    				<a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMain.jsp'">블로그 메인</a>
	            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogMyHome.jsp'">전체글보기</a>
	            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest1.jsp'">게시판1</a>
	            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest2.jsp'">게시판2</a>
	            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogBoardTest3.jsp'">게시판3</a>
	            <a class="list-group-item list-group-item-action active" data-toggle="list" onclick="location.href='LINC_BlogWrite.jsp'">글 작성하기</a>
	            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogPostList.jsp'">게시글 목록</a>
	            <a class="list-group-item list-group-item-action" data-toggle="list" onclick="location.href='LINC_BlogManagement.jsp'">블로그 관리</a>
	          </div>
	        </div>
				<div class="contents">
					<form name="post" method="POST">
						<div id="conmain">
							<table border="1" align="center" style="width:800px; height:100%;">
								<tbody>
									<tr>
										<td width="100" align="center"><select
											name="PostCode">
												<option value="선택" selected>선택</option>
												<option value="1">게시판1</option>
												<option value="2">게시판2</option>
												<option value="3">게시판3</option>
										</select></td>
										<td width="100" align="center"><a>제목</a></td>
										<td width="600"><input type="text"
											name="PostTitle" style="width:600px;"></td>
									</tr>
									<tr>
									<td width="100" align="center"><select name="PostSubject">
										<%
											ResultSet rs = null;
											Statement stmt = null;
											int nCount = 0;
											try{
												String sSQL = "SELECT * FROM post_category;";
												stmt = conn.createStatement();
												rs = stmt.executeQuery(sSQL);
												while(rs.next()){
													int nPostNum = rs.getInt("n_PostNum");
													String sPostName = rs.getString("s_PostName");
													nCount = nCount + 1;
										%>

												<option value="<%=nPostNum%>"><%=sPostName%></option>
										<%
												}
											}
											catch(SQLException ex) {
												out.println("에러 발생<br>");
												out.println("SQLException : " + ex.getMessage());
											} finally {
												if(rs != null)
													rs.close();
												if(stmt != null)
													stmt.close();
												if(conn != null)
													conn.close();
											}

										%>
									</select></td>
									<td width="100" align="center">태그</td>
									<td width="600"><input type="text" name="PostTag" style="width:600px;"></td>
									</tr>
									<tr>
									<td colspan="3" align="center"><textarea id="smartEditor" name="PostContents"
											style="width:100%; height: 500px;"></textarea>
										<!-- 스마트에디터 사용을 위한 코드, 파일 디렉터리 위치에 맞게 변경 -->
										<script type="text/javascript">
											var oEditors = [];
											// Editor Setting
											nhn.husky.EZCreator.createInIFrame({
												oAppRef : oEditors,
												elPlaceHolder : "smartEditor", // 에디터를 적용할 textarea ID에 맞게 변경
												// Editor HTML파일 위치로 변경
												sSkinURI : "SE2/SmartEditor2Skin.html",
												fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명으로 변경하면 안된다.
												htParams : { // 툴바 사용 여부 (true/false)
													bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true/false)
													bUseVerticalResizer : true, // 모드 탭(Editor|HTML|TEXT) 사용 여부 (true/false)
													bUseModeChanger : true
												// 전송버튼 클릭이벤트
												}
											});
											function submitContents(POST) {
												// 에디터의 내용이 textarea에 적용
												oEditors.getById["smartEditor"].exec(
														"UPDATE_CONTENTS_FIELD", []);
													pr_title = "작성완료"
													var url = "LINC_BlogWriteReg.jsp";
													window.open("LINC_BlogWriteReg.jsp","작성완료","width=400, height=300");
													post.target = pr_title;
													post.action = url;
													post.method = "post";
													post.submit();
													location.href="LINC_BlogPostList.jsp";
											}
											// textArea에 이미지 첨부
											function pasteHTML(filepath){
											    var sHTML = '<img src="/WebContent/SE2/upload/'+filepath+'">';
											    oEditors.getById["smartEditor"].exec("PASTE_HTML", [sHTML]);
											}
										</script>
									</td>
								</tr>
							</tbody>
						</table>
						<!--form name="uploadForm" id="uploadForm"
							enctype="multipart/form-data" method="post">
							<table style="width:800px;" border="1px;" align="center">
								<tbody id="fileTableTbody">
									<tr>
										<td id="dropZone" align="center">업로드할 파일을 드래그 하세요</td>
									</tr>
								</tbody>
							</table>
						</form-->
						<div style="width:100%; float: left;">
							<ul>
								<li><input type="checkbox" name="link" value="link">이전글
									연동</li>
								<!-- li>카테고리 선택<br> <input type="radio" name="category"
									value="game">게임 <input type="radio" name="category"
									value="music">음악 <input type="radio" name="category"
									value="hobby">취미
								</li -->
							</ul>
						</div>
						<div style="float: left;">
								<button class="btn btn-outline-primary" type="button" name="save">임시저장</button>
								<button class="btn btn-outline-primary" type="button" name="load">불러오기</button>
								<button class="btn btn-outline-primary" onclick="preview(post);" name="preview">미리보기</button>
								<!-- a href="#" onclick="uploadFile(); return false;"
									class="btn bg_01">파일 업로드</a -->
								<!--button class="btn btn-outline-primary" type="button" name="upload"
									onclick="uploadFile(); return false;">파일 업로드</button-->
						</div>
						<div style="float: right;">
							<button class="btn btn-outline-primary" type="button" onclick="submitContents(post)" name="register">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<%@ include file="footer.jsp"%>
			<%@ include file="JsLoad.jsp"%>
		</div>
	</div>



</body>
</html>
