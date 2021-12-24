<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.util.DBConnection" %> 
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 정보 확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pw");

	

		if(id.equals("admin")&&pass.equals("admin")){
			response.sendRedirect("main.jsp");
		}
		else{
			out.println("<script>");
			out.println("alert('로그인 실패! 다시 입력해주세요.')");
			out.println("history.go(-1);");
			out.println("</script>");

		}
%>
</body>
</html>