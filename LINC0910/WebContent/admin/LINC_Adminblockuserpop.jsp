<%try{ %>
<%if(session.getAttribute("userid").equals("admin")){%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script>
	function UserId() {
		document.all.id.value = this.name;
	}
	function UserSearch() {
		document.getElementById('userid').innerText = this.name;
	}
	function CheckForm(){
		if(document.loginForm.id.value==""){
			alert("아이디 입력하세요");
			document.loginForm.id.focus();
		}else{
			document.loginForm.submit();
		}
	}
	function reload() {
		location.reload(true);
	}
	function popupWindow2() {
		let popHeight = 200; // 팝업사이즈 높이
		let popWidth  = 350; // 파업사이즈 너비
	     
	    let winWidth  = document.body.clientWidth;  // 현재창의 너비
	    let winHeight = document.body.clientHeight; // 현재창의 높이

	    let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
	    let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표

	    let left = winX + (winWidth - popWidth) / 2;
	    let top = winY + (winHeight - popHeight) / 2;

		var uid = document.form.mem_uid.value;
		var url = "LINC_UserBlockpop.jsp?uid=" + uid;
		var settings = 'toolbar=0,directories=0,status=no,menubar=no,scrollbars=auto,height='+popHeight+',width='+popWidth+',left='+left+',top='+top;
		winObject = window.open(url, "idcheck", settings);
		}
		
		
	function popupWindow3() {
		let popHeight = 10; // 팝업사이즈 높이
		let popWidth  = 200; // 파업사이즈 너비
	     
	    let winWidth  = document.body.clientWidth;  // 현재창의 너비
	    let winHeight = document.body.clientHeight; // 현재창의 높이

	    let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
	    let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표

	    let left = winX + (winWidth - popWidth) / 2;
	    let top = winY + (winHeight - popHeight) / 2;

		var uid = document.form.mem_uid.value;
		var url = "process/LINC_UpdateUserBlockEnd.jsp?uid=" + uid;
		var settings = 'toolbar=0,directories=0,status=no,menubar=no,location=no,scrollbars=auto,height='+popHeight+',width='+popWidth+',left='+left+',top='+top;
		winObject = window.open(url, "idcheck", settings);
		}
</script>

</head>
<% request.setCharacterEncoding("utf-8");
	String sUserId = request.getParameter("id");
	%>
<body <%if(sUserId==null){%>onload="UserId(),CheckForm();"<%}%>>

	<%@include file="DBDB.jsp"%>
	<%
		
	%>
	<%
	String s_ID=null;
	String s_NickName=null;
	String s_EMail=null;
	String s_MakeDay=null;
	String n_BlockCount=null;
	String s_AccStat=null;
	String s_BlockDetail=null;
	int s_Blockday=0;
	String s_BlockStartDay=null;
	String s_BlockEndDay=null;
	if(sUserId!=null){
		String sSQL = "select * from user_stat where s_ID='"+sUserId+"'";
		String sSQL2 = "select DATEDIFF(s_BlockEndDay, now()) as day from user_stat WHERE s_ID='"+sUserId+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null,rs2;
		try {
			pstmt = conn.prepareStatement(sSQL);
			
			rs2 = pstmt.executeQuery(sSQL2);
			if (rs2.next())
				s_Blockday = rs2.getInt(1);
			rs2.close();
			
			rs = pstmt.executeQuery();
			rs.next();
			s_ID = rs.getString("s_ID");
			s_NickName = rs.getString("s_NickName");
			s_EMail = rs.getString("s_EMail");
			s_MakeDay = rs.getString("s_MakeDay");
			n_BlockCount = rs.getString("n_BlockCount");
			s_AccStat = rs.getString("s_AccStat");
			s_BlockDetail=rs.getString("s_BlockDetail");
			s_BlockStartDay=rs.getString("s_BlockStartDay");
			s_BlockEndDay=rs.getString("s_BlockEndDay");
		} catch (SQLException e) {
			out.print(e);
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	%>

	<form action="LINC_Adminblockuserpop.jsp" method="GET" name="loginForm"><%--POST 쓰면 쿼리문 안보임 --%>
	<div style="display:inline">
		<input type="text" name="id" <%if(sUserId!=null){%>value="<%=s_ID%>"<%}%> style="border-color: DodgerBlue;border-style: solid;">
	</div>
	<div style="display:inline;">
		<input type="button" value="검색" onclick="CheckForm()" style="background-color:white;border-color: DodgerBlue;border-style: solid;">
	</div>
	</form>
	<table width="100%">
		<tr>
			<th  width="100px" nowrap>아이디 :</th>
			<td id="userid"><%if(sUserId!=null){%><%=s_ID%><%}%></td>
		</tr>
		<tr>
			<th >닉네임 :</th>
			<td id="usernickname"><%if(sUserId!=null){%><%=s_NickName%><%}%></td>
		</tr>
		<tr>
			<th >이메일 :</th>
			<td id="useremail"><%if(sUserId!=null){%><%=s_EMail%><%}%></td>
		</tr>
		<tr>
			<th >가입일 :</th>
			<td id="userjoinday"><%if(sUserId!=null){%><%=s_MakeDay%><%}%></td>
		</tr>
		<tr>
			<th>계정상태 :</th>
			<td id="userjoinday"><%if(sUserId!=null){%><%=s_AccStat%><%}%></td>
		</tr>
		<tr>
			<th >차단 횟수 :</th>
			<td id="blockcount"><%if(sUserId!=null){%><%=n_BlockCount%><%}%></td>
		</tr>
		<%if(s_Blockday>0){%>
		<tr>
			<td colspan="2" align="center" style="color: red;font-weight: bold;">차단중</td>
		</tr>
		<tr>
			<th >차단 시작일 :</th>
			<td id="blockcount"><%if(sUserId!=null){%><%=s_BlockStartDay%><%}%></td>
		</tr>
		<tr>
			<th >차단 끝 :</th>
			<td id="blockcount"><%if(sUserId!=null){%><%=s_BlockEndDay%><%}%></td>
		</tr>
		<tr>
			<th >남은 날짜 :</th>
			<td id="blockcount"><%if(sUserId!=null){%><%=s_Blockday%>일<%}%></td>
		</tr>
		<%} %>
		
		<tr>
			<form name="form" method="post">
			<td>
				<input type="hidden" name="mem_uid" value="<%=s_ID%>">
				<input name="button" type="button" value="차단" onClick="popupWindow2();" style="background-color:white;border-color: DodgerBlue;border-style: solid;">
				</td>
				<td>
				<%if(s_Blockday>0){%>
				<input type="hidden" name="mem_uid2" value="<%=s_ID%>">
				<input name="button" type="button" value="차단해제" onClick="popupWindow3();" style="background-color:white;border-color: DodgerBlue;border-style: solid;">
				<%} %>
				</td>
			</form>
		</tr>
		<tr>
			<td colspan="2" align="center">차단 사유</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><%if(s_BlockDetail!=null){%><%
				String[] array2 = s_BlockDetail.split("/");
				for(int i=0;i<array2.length;i++) {out.println(array2[i]);%><br><%}
			%><%}%></td>
		</tr>

	</table>
</body>
</html>
<%}}catch(Exception e){%>
<%@ include file="process/LINC_ReturnLogin.jsp"%>
<%}%>