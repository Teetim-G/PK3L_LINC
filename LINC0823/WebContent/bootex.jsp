<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
</head>

</style>



<body>
<script>
var winObject = null;

function popupWindow(){
var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=200,width=200,left=0,top=0';
winObject = window.open("test2.jsp", document.all.text1.value, settings);
}

function submitToWindow(){
winObject.document.all.text2.value = document.all.text1.value;
}
</script>
<input type=text name="text1">
<input type=button value="새창띄우기" onClick="popupWindow();">
<input type=button value="팝업창으로전송" onClick="submitToWindow();">
</body>
