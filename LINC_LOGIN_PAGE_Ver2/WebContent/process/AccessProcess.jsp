<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBCONN.jsp"%>
<%
	int cnumber_ = Integer.parseInt(request.getParameter("cnumber_"));
	String id_ = request.getParameter("id_");
	
	String sSQL = "update certification set is_certification = 1 where s_UserID = ? and n_key = ?";
	PreparedStatement pstmt=null,pstmt1=null;
	ResultSet rs=null,rs1 = null;
%>
<%
try{
		
		
		pstmt=conn.prepareStatement(sSQL);
		pstmt.setString(1, id_);
		pstmt.setInt(2, cnumber_);
		int r = pstmt.executeUpdate();
		
		sSQL = "update user_stat set s_AccStat=? where  s_ID= (select s_UserID from certification where s_UserID = ? and n_key = ?);";
		pstmt1=conn.prepareStatement(sSQL);
		pstmt1.setString(1, "인증");
		pstmt1.setString(2, id_);
		pstmt1.setInt(3, cnumber_);
		r = pstmt1.executeUpdate();
		
		if (r==1){
			out.println("success");	
		}
		else{
			out.println("fail");	
		}
%>
<%		
	}catch(Exception e){
		out.println("fail");
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>