<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>

/* 퀵메뉴 창닫기 기능 */ 

function WinClose()
{
	opener.parent.location.reload();
	window.open('','_self').close();     
}

</script>
</head>
<body onload="WinClose()">
<%@include file="DBDB.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		String sblocknum = request.getParameter("blocknum");
		String suserid = request.getParameter("userid");
		String BlockDetail = request.getParameter("BlockDetail");
		Statement stmt = null;
		try{
			String sSQL = "update user_stat set s_BlockEndDay = DATE_ADD(NOW(), INTERVAL "+sblocknum+" DAY),s_BlockStartDay=NOW(),n_CntBlock=n_CntBlock+1,s_BlockDetail=CONCAT(s_BlockDetail,now(),' - "+BlockDetail+"/') where s_ID ='"+suserid+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(sSQL);
		}catch(SQLException ex){
			out.println("SQLException:" + ex.getMessage());
		}finally{
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}
	%>
</body>
</html>