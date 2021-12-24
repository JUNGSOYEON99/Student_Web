 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서원대학교 IT학부 학생 관리</title>
<link rel="stylesheet" type="text/css" href="login.css?ver=2">

</head>
<body>
<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
        	var form=document.userInfo;
        	
            if(!form.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!form.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
    </script>
<section>
	<div id="wrap">
        <br><br>
        <b><font size="14" color="gray">서원대학교 IT학부</font></b>
        <br><br><br>
         <form action="loginCheck.jsp" method="post" name="userInfo" onsubmit="checkValue()">
			<input type="text" placeholder="아이디" name="id" id="id" class="logintext"/> <br />
            <input type="password" placeholder="비밀번호" name="pw" id="pw" class="logintext"/> <br />
            <input type="hidden" name="hid" value="hid" /> <br />
            <button id="loginbtn" >로그인</button>
		</form>
	</div>
</section>
</body>
</html>
