<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="studentinfo.css?ver=1">
<script type="text/javascript">
    function logout(){
    	location.href = "s_login.jsp";
        alert("로그아웃되었습니다!");
    };
	

</script>
</head>
<body>
<%
        String pageChange;
    %>
<p><a id="maintitle" href="?pageChange=StudentPrint.jsp"> 서원대학교 | IT학부 </a><a id="logout" onclick="logout()">로그아웃</a></p>
</body>
</html>