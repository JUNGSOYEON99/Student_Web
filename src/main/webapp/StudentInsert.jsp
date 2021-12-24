<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mem.MemberVO" %>
<%@ page import="mem.MemberDAO" %>
    <%-- 자바빈 클래스 import --%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");%>
 
    <jsp:useBean id="vo" class="mem.MemberVO" />
    <jsp:setProperty property="*" name="vo"/>
    <jsp:useBean id="dao" class="mem.MemberDAO"/>
   
 <%
    if(dao.memberInsert(vo)>0){
        out.print("<script>");
        out.print("alert('등록이 완료되었습니다.');");  
        out.print("self.close();");   
        out.print("opener.document.location.reload();");
        out.print("</script>");
     }else{
       
        out.print("<script>");
        out.print("alert('등록에 실패하였습니다!');");  
        out.print("history.back();");          
        out.print("</script>");
    }
 %>
</body>
</html>