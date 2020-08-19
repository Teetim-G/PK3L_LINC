<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.security.*" %>
<%-- 현재 비밀번호 및 새로운 비밀번호를 전달받아 현재 비밀번호가 맞을 경우
새로운 비밀번호로 member 테이블에 회원정보의 비밀번호를 변경하는 페이지 --%>
<%-- 
	=> 현재 비밀번호가 맞을 경우 : memberLogoutAction.jsp 이동
	=> 현재 비밀번호가 맞지 않을 경우 : passwdModify.jsp 이동(에러메세지 공유)
--%>
<%@include file="DBCONN.jsp"%>
<%
	MessageDigest md = MessageDigest.getInstance("MD5");
	//전달받은 현재 비밀번호 및 새로운 비밀번호를 반환받아 저장
	String currPasswd=request.getParameter("password");
	String newPasswd=request.getParameter("chpassword");
	byte[] bytData = currPasswd.getBytes("utf-8");
	md.update(bytData);
	byte[] digest1 = md.digest();
	bytData = newPasswd.getBytes("utf-8");
	md.update(bytData);
	byte[] digest2 = md.digest();
	String strENCData = "";
    for(int i =0;i<digest1.length;i++)
    {
        strENCData = strENCData + Integer.toHexString(digest1[i] & 0xFF).toUpperCase();
    }
    currPasswd = strENCData;
    strENCData = "";
    for(int i =0;i<digest2.length;i++)
    {
        strENCData = strENCData + Integer.toHexString(digest2[i] & 0xFF).toUpperCase();
    }
    newPasswd = strENCData;
	try{
			String upSQL = "UPDATE user_stat set s_Pwd = ? WHERE s_ID = ? and s_Pwd = ?;";
			PreparedStatement pstmt=conn.prepareStatement(upSQL);
			
			pstmt.setString(1, newPasswd);
			pstmt.setString(2, "admin");
			pstmt.setString(3, currPasswd);
			
			int row = pstmt.executeUpdate();
			out.print("변경된 행수"+row);
			response.sendRedirect("LINC_MyPage.jsp");
				
		}catch(SQLException e){
			out.print("여기" + e);
		}finally{
			if(conn!=null)
				conn.close();
		}
	
%>