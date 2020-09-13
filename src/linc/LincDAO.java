package linc;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class LincDAO {

	// dao : 데이터베이스 접근 객체의 약자로서

	// 실질적으로 db에서 회원정보 불러오거나 db에 회원정보 넣을때



	private Connection conn; // connection:db에접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;
	



	// mysql에 접속해 주는 부분

	public LincDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함
		

		
	}

	// 유저목록을 불러오는 함수
	public ArrayList<UserDTO> userSelect() {
        
        ArrayList<UserDTO> dtos = new ArrayList<UserDTO>();
        this.dbConn();
        
        try {
            pstmt = conn.prepareStatement("select * from user_stat");
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                String id = rs.getString("s_ID");
                String pwd = rs.getString("s_Password");
                String nick = rs.getString("s_NickName");
                String email = rs.getString("s_EMail");
                java.sql.Timestamp mkday = rs.getTimestamp("s_MakeDay");
                String accstat = rs.getString("s_AccStat");
                int bc = rs.getInt("n_BlockCount");
                String bd = rs.getString("s_BlockDetail");
                String be = rs.getString("s_BlockEndDay");
                String tpwd = rs.getString("s_TempPassword");
                
                UserDTO dto = new UserDTO(id, pwd, nick, email,mkday,accstat,bc,bd,be,tpwd);
                dtos.add(dto);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return dtos;
    }
	
	// 게시판번호로 게시판 이름 찾는 함수
	public String catCheck(int cNum) {
		this.dbConn();
		StringBuffer sSql = new StringBuffer();
		String cName = "";
        sSql.append("select s_PostName from post_category ");
        sSql.append("where n_PostNum = ?");
        try {
            pstmt = conn.prepareStatement(sSql.toString());
            pstmt.setInt(1, cNum);
            rs = pstmt.executeQuery();
            rs.next();
            cName = rs.getString("s_PostName");
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return cName;
	}
	
	// 게시글 목록을 불러오는 함수
	public ArrayList<ForumDTO> forumSelect() {
		this.dbConn();
        
        ArrayList<ForumDTO> dtos = new ArrayList<ForumDTO>();

        
        try {
            pstmt = conn.prepareStatement("select * from forum");
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	int order = rs.getInt("n_PostOrder");
            	java.sql.Timestamp wday = rs.getTimestamp("s_WriteDay");
                String title = rs.getString("s_Title");
                String content = rs.getString("s_Content");
                String user = rs.getString("s_PostUser");
                int viewcnt = rs.getInt("n_ViewCount");
                int goodcnt = rs.getInt("n_GoodCount");
                int badcnt = rs.getInt(" n_BadCount");
                int isdelete = rs.getInt("is_Delete");
                int category = rs.getInt("n_ForumCategory"); 
                ForumDTO dto = new ForumDTO(order, wday, title, content,user,viewcnt,goodcnt,badcnt,isdelete,category);
                dtos.add(dto);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return dtos;
    }
	
	// 유저 이름 검색 함수
	
	public ArrayList<UserDTO> userSearch(String keyword){
		this.dbConn();
		
		ArrayList<UserDTO> dtos = new ArrayList<UserDTO>();
		StringBuffer sSql = new StringBuffer();
		sSql.append("select * from user_stat ");
		sSql.append("where s_NickName LIKE ?");
		try {
            pstmt = conn.prepareStatement(sSql.toString());
            pstmt.setString(1, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	String id = rs.getString("s_ID");
                String pwd = rs.getString("s_Password");
                String nick = rs.getString("s_NickName");
                String email = rs.getString("s_EMail");
                java.sql.Timestamp mkday = rs.getTimestamp("s_MakeDay");
                String accstat = rs.getString("s_AccStat");
                int bc = rs.getInt("n_BlockCount");
                String bd = rs.getString("s_BlockDetail");
                String be = rs.getString("s_BlockEndDay");
                String tpwd = rs.getString("s_TempPassword");
                
                UserDTO dto = new UserDTO(id, pwd, nick, email,mkday,accstat,bc,bd,be,tpwd);
                dtos.add(dto);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return dtos;
		
	}
	
	// 게시판 이름 검색 함수
	public ArrayList<CategoryDTO> catSearch(String keyword){
		this.dbConn();
		
		ArrayList<CategoryDTO> dtos = new ArrayList<CategoryDTO>();
		StringBuffer sSql = new StringBuffer();
		sSql.append("select * from post_category ");
		sSql.append("where s_PostName LIKE ?");
		try {
            pstmt = conn.prepareStatement(sSql.toString());
            pstmt.setString(1, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	int cNum = rs.getInt("n_PostNum");
                String cName = rs.getString("s_PostName");
                String cDetail = rs.getString("s_PostDetail");
                CategoryDTO dto = new CategoryDTO(cNum, cName, cDetail);
                dtos.add(dto);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return dtos;
		
	}
	
	// 게시글 검색 함수
		public ArrayList<ForumDTO> forumSearch(String keyword) {
			this.dbConn();
			
	        ArrayList<ForumDTO> dtos = new ArrayList<ForumDTO>();
	        StringBuffer sSql = new StringBuffer();
	        sSql.append("select * from forum ");
	        sSql.append("where is_Delete = 0 AND s_Title LIKE ? OR s_Content LIKE ? OR s_PostUser LIKE ? ");
	        

	        
	        try {
	            pstmt = conn.prepareStatement(sSql.toString());
	            pstmt.setString(1, "%" + keyword + "%");
	            pstmt.setString(2, "%" + keyword + "%");
	            pstmt.setString(3, "%" + keyword + "%");
	            rs = pstmt.executeQuery();
	            
	            while (rs.next()) {
	            	int order = rs.getInt("n_PostOrder");
	            	java.sql.Timestamp wday = rs.getTimestamp("s_WriteDay");
	                String title = rs.getString("s_Title");
	                String content = rs.getString("s_Content");
	                String user = rs.getString("s_PostUser");
	                int viewcnt = rs.getInt("n_ViewCount");
	                int goodcnt = rs.getInt("n_GoodCount");
	                int badcnt = rs.getInt("n_BadCount");
	                int isdelete = rs.getInt("is_Delete");
	                int category = rs.getInt("n_ForumCategory"); 
	                ForumDTO dto = new ForumDTO(order, wday, title, content,user,viewcnt,goodcnt,badcnt,isdelete,category);
	                dtos.add(dto);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if(rs != null) rs.close();
	                if(pstmt != null) pstmt.close();
	                if(conn != null) conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return dtos;
	    }
		// 게시판 번호로 게시글 검색
				public ArrayList<ForumDTO> forumSelectAtCat(int cNum) {
					this.dbConn();
					
			        ArrayList<ForumDTO> dtos = new ArrayList<ForumDTO>();
			        StringBuffer sSql = new StringBuffer();
			        sSql.append("select * from forum ");
			        sSql.append("where is_Delete = 0 AND n_ForumCategory = ? order by s_WriteDay desc");
			        

			        
			        try {
			            pstmt = conn.prepareStatement(sSql.toString());
			            pstmt.setInt(1, cNum);
			            rs = pstmt.executeQuery();
			            
			            while (rs.next()) {
			            	int order = rs.getInt("n_PostOrder");
			            	java.sql.Timestamp wday = rs.getTimestamp("s_WriteDay");
			                String title = rs.getString("s_Title");
			                String content = rs.getString("s_Content");
			                String user = rs.getString("s_PostUser");
			                int viewcnt = rs.getInt("n_ViewCount");
			                int goodcnt = rs.getInt("n_GoodCount");
			                int badcnt = rs.getInt("n_BadCount");
			                int isdelete = rs.getInt("is_Delete");
			                int category = rs.getInt("n_ForumCategory"); 
			                ForumDTO dto = new ForumDTO(order, wday, title, content,user,viewcnt,goodcnt,badcnt,isdelete,category);
			                dtos.add(dto);
			            }
			            
			        } catch (Exception e) {
			            e.printStackTrace();
			        } finally {
			            try {
			                if(rs != null) rs.close();
			                if(pstmt != null) pstmt.close();
			                if(conn != null) conn.close();
			            } catch (Exception e) {
			                e.printStackTrace();
			            }
			        }
			        
			        return dtos;
			    }	
	
		// db 연결
		private void dbConn() {

			
			String dbURL = "jdbc:mysql://61.84.24.210:3306/linc_c?serverTimezone=UTC"; 

			String dbID = "LINC_C";

			String dbPassword = "daelim1!";
			try {

				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		
	



}
