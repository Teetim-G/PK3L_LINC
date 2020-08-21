<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>Insert title here</title>
<%@ include file="BSLoad.jsp" %>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrp.js"></script>
    <%@ include file="header.jsp" %>
   <div class="container">
      <div class="row"> 
      <form method ="post" action="wirteaction.jsp">
      <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <td align="left"><SELECT name="combo">

                           <OPTION value="게임">게임</OPTION>

                         <OPTION value="음악">음악</OPTION>

                          <OPTION value="자유게시판">자유게시판</OPTION>
                     </SELECT><input type="text" class="form-control" placeholder="글제목" maxlength="50" style ="margin-top: 10px" >
     
                  </td>
                  
               </tr>
            </thead>
            <tbody>
               <tr>   
                  <td><textarea class="form-control" placeholder="글내용" maxlength="2048" style="height:350px;"></textarea></td>
               </tr>
            </tbody>
         </table>
         <input type="submit" class="btn btn-primary pull-right" style ="margin-left: 10px" value="등록">
         <input type="submit" class="btn btn-primary pull-right" value="취소">
      </form>         
      </div>
   </div>
   <%@ include file="footer.jsp" %>
   <%@ include file="JsLoad.jsp" %>
</body>
</html>