<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="smartEditorText" method="POST" action="/text/insertText">
		<textarea rows="13" cols="80" id="smartEditor" name="smartEditor"></textarea>
		<button type="submit" onclick="submitContents()">전송</button>
	</form>



	<script type="text/javascript" src="smarteditor2/js/HuskyEZCreator.js"
		charset="utf-8"></script>


	<script type="text/javascript">
		var oEditors = [];

		// Editor Setting
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "smartEditor", // 에디터를 적용할 textarea ID에 맞게 변경
			sSkinURI : "smarteditor2/SmartEditor2Skin.html", // Editor HTML파일 위치로 변경
			fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명으로 변경하면 안된다.
			htParams : { // 툴바 사용 여부 (true/false)
				bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true/false)
				bUseVerticalResizer : true, // 모드 탭(Editor|HTML|TEXT) 사용 여부 (true/false)
				bUseModeChanger : true
			// 전송버튼 클릭이벤트
			}
		});

		function submitContents() {
			// 에디터의 내용이 textarea에 적용
			oEditors.getById["class_tutorIntroduce"].exec(
					"UPDATE_CONTENTS_FIELD", []);
		}
	</script>

</body>
</html>