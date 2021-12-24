<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 자바빈 클래스 import --%>      
<%@ page import="mem.MemberVO" %>  
<%-- DAO import --%>   
<%@ page import="mem.MemberDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서원대학교 IT학부 학생등록</title>
<link rel="stylesheet" type="text/css" href="join.css">
<script type="text/javascript">
function checkValue()
{
	var form=document.studentInfo;
	
    if(!form.name.value){
        alert("이름을 입력하세요.");
        return false;
    }

    if(!form.resident1.value){
        alert("주민등록번호를 입력하세요.");
        return false;
    }
    
    if(!form.department_num.value){
        alert("학번을 입력하세요.");
        return false;
    }
    if(!form.mail1.value){
        alert("이메일을 입력하세요.");
        return false;
    }
    if(!form.phone1.value || !form.phone2.value){
        alert("휴대전화를 입력하세요.");
        return false;
    }
}
    function checkOnlyOne(a){
        var obj = document.getElementsByName ( "gender");
        for(var i=0; i<obj.length; i++){
            if(obj[i]!=a) {
                obj[i].checked = false;
            }
        }
    }
</script>

</head>
<body>
<h2> 학생등록 </h2>
    <form method = "post" action="StudentInsert.jsp" name="studentInfo" onsubmit="return checkValue()">
        <table id="joint">
            <tr>
            </tr>
                <tr>
                    <td id="title">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" name="name" maxlength="50" >
                 
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">주민번호&nbsp;&nbsp;</td>
                    <td>
                       <input type="text" name="resident1" maxlength="6"  size="6" > -
                        <input type="password" name="resident2" maxlength="7"  size="7" >
                    </td>
                </tr>
                <form name="sendForm" method="get">
                	<tr>
                    	<td id="title">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;</td>
                    	<td>
                    	<input type='checkbox' name='gender' value='여' onclick='checkOnlyOne(this)'/>여
                    	<input type='checkbox' name='gender' value='남' onclick='checkOnlyOne(this)'/>남
                    	</td>
                	</tr>
                </form>
                <tr>
                    <td id="title">전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공&nbsp;&nbsp;</td>
                    <td>
                    	<select name="department">
                            <option>정보보안</option>
                            <option>정보통신공학</option>
                            <option>컴퓨터공학</option>                       
                        </select>
                    </td>
                </tr>
                <tr>
                    <td id="title">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" name="studentnum" maxlength="9" size="9">
                 
                    </td>
                </tr>
                <tr> 
                	<td id="title">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;</td> 
                	<td> 
                		<input type="text" class="zip_code" id="zipNo" name="zipNo"readonly> 
                		<button type="button" class="zip_code_btn" onclick="javascript:goPopup();">우편번호</button><br/> 
                		<input type="text" placeholder="기본 주소를 입력해 주세요" id="addr" name="addr"><br/> 
                		<input type="text" placeholder="나머지 주소를 입력해 주세요" id="addrDetail" name="addrDetail"> 
                	</td> 
                </tr>
                <tr>
                  	<td id="title">휴대전화&nbsp;&nbsp;</td>
                    <td>
                    010 -
                        <input type="text" name="phone1" maxlength="4"  size="4" > -
                        <input type="text" name="phone2" maxlength="4"  size="4" >
                    </td>
                </tr>
                <tr>
                    <td id="title">이 메 일&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
  
            </table>
            <br>
            <div id="but">
        <input type="submit" id="joinbtn" value="등   록" />
        <input type="button" id="cancelbtn" value="취   소" onclick="self.close();"/>
        </div>
    </form>
	<script> 
	var goPopup = function(){ 
		var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	} 
	var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){ 
		document.getElementById("zipNo").value = zipNo; document.getElementById("addr").value = roadAddrPart1; 
		if(addrDetail.length>30){ alert('상세주소가 너무 길어 다시 입력해야 합니다.'); 
			return; 
		} 
		document.getElementById("addrDetail").value = addrDetail; 
	} 
	</script>
</body>
</html>