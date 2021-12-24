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
	alert("로그아웃 되었습니다!");
    location.href = "s_login.jsp";       
}

</script>
</head>
<body>

	<header><p><a id="maintitle"> 서원대학교 | IT학부 </a><a id="logout" onclick="logout()">로그아웃</a></p></header>
	<p id="na">&nbsp;</p>
  <div id="container">
    <div id="nav">
      <ul>
      <br>
        <li><a class="first">IT학부 총 학생수 --------</a></li>
        <li><a class="plus">&nbsp;</a></li>
        <br><br>
        <li><a class="first">학과별 총 학생수 --------</a></li>
        <li><a class="plus">&nbsp;정보보안 : </a></li>
        <li><a class="plus">&nbsp;정보통신공학 : </a></li>
        <li><a class="plus">&nbsp;컴퓨터공학 : </a></li>
        <br><br>
        <li><a class="first">학과별 학생 목록 --------</a></li>
        <li><a class="plus1" id="de1" href="?pageChange=menuA">&nbsp;정보보안</a></li>
        <li><a class="plus1" id="de2" onclick="changeView(2)">&nbsp;정보통신공학</a></li>
        <li><a class="plus1" id="de3" onclick="changeView(2)">&nbsp;컴퓨터공학</a></li>
        <br>
      </ul>
    </div>
    <div id="content">
      <div class="text-box"><jsp:include page="StudentPrint.jsp"/></div>
    </div>
  </div>
  <footer></footer>
</body>
</html>