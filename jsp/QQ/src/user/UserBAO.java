package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserBAO {
   private Connection conn;
   private ResultSet rs;
   
   public UserBAO() {
      try {
         String dbURL = "jdbc:mysql://61.84.24.210:3306/linc_?serverTimezone=UTC";
         String dbID = "LINC_C";
         String dbPassword = "daelim1!";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public String getDate() {
      String SQL = "SELECT NOW()";
            try{
               PreparedStatement pstmt = conn.prepareStatement(SQL);
               rs = pstmt.executeQuery();
               if (rs.next()) {
                  return rs.getNString(1);
               }
            } catch(Exception e) {
               e.printStackTrace();
            }
            return "";
   }
   public int getNext() {
      String SQL = "SELECT n_PostNum FROM post_state ORDER BY n_PostNum DESC";
            try{
               PreparedStatement pstmt = conn.prepareStatement(SQL);
               rs = pstmt.executeQuery();
               if (rs.next()) {
                  return rs.getInt(1) + 1;
               }
               return 1;
            } catch(Exception e) {
               e.printStackTrace();
            }
            return -1;
   }
   public int write(String bbsTitle, String userID, String bbsContent) {
      String SQL = "INSERT INTO post_state VALUES (?,?,?,?,?,?)";
      try{
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext());
         pstmt.setString(2, bbsTitle);
         pstmt.setString(3, userID);
         pstmt.setString(4, getDate());
         pstmt.setString(5, bbsContent);
         pstmt.setInt(6, 1);
         return pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
}

