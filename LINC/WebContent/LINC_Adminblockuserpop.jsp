<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<script>
	function UserId() {
		document.all.id.value = this.name;
	}
	function UserSearch() {
		document.getElementById('userid').innerText = this.name;
	}
	function CheckForm(){
		if(document.loginForm.id.value==""){
			alert("���̵� �Է��ϼ���");
			document.loginForm.id.focus();
		}else{
			document.loginForm.submit();
		}
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
	String s_MkDay=null;
	String n_CntBlock=null;
	String s_AccStat=null;
	String s_BlockDetail=null;
	if(sUserId!=null){
		String sSQL = "select * from user_stat where s_ID='"+sUserId+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sSQL);
			rs = pstmt.executeQuery();
			rs.next();
			s_ID = rs.getString("s_ID");
			s_NickName = rs.getString("s_NickName");
			s_EMail = rs.getString("s_EMail");
			s_MkDay = rs.getString("s_MkDay");
			n_CntBlock = rs.getString("n_CntBlock");
			s_AccStat = rs.getString("s_AccStat");
			s_BlockDetail=rs.getString("s_BlockDetail");
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

	<form action="LINC_Adminblockuserpop.jsp" method="GET" name="loginForm"><%--POST ���� ������ �Ⱥ��� --%>
		<input type="text" name="id" <%if(sUserId!=null){%>value="<%=s_ID%>"<%}%>> <input type="button" value="�˻�" onclick="CheckForm()" >
	</form>
	<br>
	<table width="100%">
		<tr>
			<td align="right" width="85px" nowrap>���̵� :</td>
			<td id="userid"><%if(sUserId!=null){%><%=s_ID%><%}%></td>
		</tr>
		<tr>
			<td align="right">�г��� :</td>
			<td id="usernickname"><%if(sUserId!=null){%><%=s_NickName%><%}%></td>
		</tr>
		<tr>
			<td align="right">�̸��� :</td>
			<td id="useremail"><%if(sUserId!=null){%><%=s_EMail%><%}%></td>
		</tr>
		<tr>
			<td align="right">������ :</td>
			<td id="userjoinday"><%if(sUserId!=null){%><%=s_MkDay%><%}%></td>
		</tr>
		<tr>
			<td align="right">�������� :</td>
			<td id="userjoinday"><%if(sUserId!=null){%><%=s_AccStat%><%}%></td>
		</tr>
		<tr>
			<td align="right">���� Ƚ�� :</td>
			<td id="blockcount"><%if(sUserId!=null){%><%=n_CntBlock%><%}%></td>
		</tr>
		<tr>
		
			<form action="LINC_UpdateUserBlock.jsp" method="post">
			<td>
				<input type ="text" name="blocknum" value=""/>
				<input type ="hidden" name="userid" value="<%=s_ID%>"/>
				</td>
				<td>
				<input type ="submit" value="�� ����"/>
				</td>
			</form>
		</tr>
		<tr>
			<td colspan="2" align="center">���� ����</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><%if(sUserId!=null){%><%=s_BlockDetail%><%}%></td>
		</tr>

	</table>
</body>
</html>