<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mem.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 삭제</title>
</head>
<body>
	<jsp:useBean id="dao" class="mem.MemberDAO"/>
   
    <%     
        //넘어온 ID값 받아서 삭제하는 메소드 호출
   
        int result = dao.delMemberlist(request.getParameter("id"));
       
        String message="삭제되지 않았습니다.";
        if(result > 0 ){
                       
            message = "삭제되었습니다.";
        }
    %> 
   
    <script>   
        alert("<%=message%>");
        location.href="main.jsp";  
    </script>
</body>
</html>