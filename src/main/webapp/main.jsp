<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
<meta charset="UTF-8">
<title>서원대학교 IT학부 학생 관리</title>
<link rel="stylesheet" type="text/css" href="studentinfo.css?ver=2">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
        String select = request.getParameter("pageChange");
 
        if (select == null) {
            select = "StudentPrint.jsp";
        }
    %>
    <header><jsp:include page="hearder.jsp" flush="false"/></header>
	<p id="na">&nbsp;</p>
  <div id="container">
    <div id="nav">
      <jsp:include page="left.jsp" flush="false"/>
    </div>
    <div id="content">
      <div class="text-box"><jsp:include page="<%=select%>" flush="false" /></div>
    </div>
  </div>
  <footer></footer>
</body>
</html>