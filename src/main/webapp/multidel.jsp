<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mem.MemberDAO" %>
<%@ page import="mem.MemberVO" %>  
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="jsp.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
<meta charset="UTF-8">
<title>체크된 정보 삭제</title>
<link rel="stylesheet" type="text/css" href="studentinfo.css?ver=2">
</head>
<body>
<%request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String[] bd_no=request.getParameterValues("chk_list");

	MemberDAO dao=new MemberDAO();
	
	int res=dao.multiDelete(bd_no);
	if(res==10){
		%>
		<script type="text/javascript">
		alert("1개 이상을 체크해주세요!"); 
		location.href="main.jsp";
	</script>
<% }
	else if(res==0){
		System.out.print(res);
%>
	<script type="text/javascript">
		alert("선택 삭제 완료!"); 
		location.href="main.jsp";
	</script>
<%
	}else { 
		System.out.print(res);
	%>
	<script type="text/javascript">
		alert("선택 삭제 실패!");
		location.href="main.jsp";
	</script>
<% 
	}
%>
</body>
</html>