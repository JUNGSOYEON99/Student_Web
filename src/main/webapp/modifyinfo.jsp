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
<meta charset="UTF-8">
<title>학생 정보 수정</title>
<link rel="stylesheet" type="text/css" href="join.css">
<script type="text/javascript">
function checkValue()
{
	var form=document.studentInfo;
	
    if(!form.zipNo.value){
        alert("우편번호를 입력하세요.");
        return false;
    }

    if(!form.addr.value){
        alert("기본주소를 입력하세요.");
        return false;
    }
    
    if(!form.addrDetail.value){
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
</script>


</head>
<body>
<jsp:useBean id="dao" class="mem.MemberDAO"/>
<%
	String modiID=request.getParameter("modiID");
	Connection con=null;
	Statement st;
	PreparedStatement ps=null;
	ResultSet rs;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String mname=null;
	String mresident=null;
	String mgender=null;
	String mstudentnum=null;
	String mdepartment=null;
	String mzipNo=null;
	String maddr=null;
	String maddrDetail=null;
	String mphonenum1=null;
	String mphonenum2=null;
	String memail=null;
	String memail2=null;
	String[] token;
	String[] to;
	
	try {
		con = DBConnection.getCon(); 
		ps=con.prepareStatement("select * from student where STUDENT_NUM = ?");
		ps.setString(1,modiID);
		rs=ps.executeQuery();
		if(rs.next()){
			mname=rs.getString(1);
			mresident=rs.getString(2);
			mgender=rs.getString(3);
			mdepartment=rs.getString(4);
			mstudentnum=rs.getString(5);
			mzipNo=rs.getString(6);
			maddr=rs.getString(7);
			maddrDetail=rs.getString(8);
			token=new String[5];
			token=rs.getString(9).split("-");
			mphonenum1=token[1];
			mphonenum2=token[2];
			to=new String[5];
			to=rs.getString(10).split("@");
			memail=to[0];
			memail2=to[1];
		}
	} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
	} finally {
		// Connection, PreparedStatement를 닫는다.
		try{
			if ( ps != null ){ ps.close(); ps=null; }
			if ( con != null ){ con.close(); con=null;	}
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
		}
} // end try~catch 
%>
<h2> 학생 정보 수정 </h2>
<form method = "post" action="modipro.jsp" name="studentInfo" onsubmit="return checkValue()">
        <table id="joint">
            <tr>
            </tr>
                <tr>
                    <td id="title">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;</td>
                    <td>
                    	<input type="hidden" name="name" size="50" value="<%= mname %>">
                        <%=mname%>
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">주민번호&nbsp;&nbsp;</td>
                    <td>
                    	<input type="hidden" name="resident" size="50" value="<%= mresident %>">
                       <%=mresident%>
                    </td>
                </tr>
                	<tr>
                    	<td id="title" name="gender">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;</td>
                    	<td>
                    		<%=mgender%>
                    	</td>
                	</tr>
                <tr>
                    <td id="title">전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공&nbsp;&nbsp;</td>
                    <td>
                    	<select name="department">
                    	<option selected><%=mdepartment%></option>
                            <option>정보보안</option>
                            <option>정보통신공학</option>
                            <option>컴퓨터공학</option>                       
                        </select>
                    </td>
                </tr>
                <tr>
                    <td id="title">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;</td>
                    <td>
                    	<input type="hidden" name="studentnum" size="50" value="<%= mstudentnum %>">
                        <%=mstudentnum%>
                    </td>
                </tr>
                <tr> 
                	<td id="title">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;</td> 
                	<td> 
                		<input type="text" class="zip_code" value="<%=mzipNo%>" id="zipNo" name="zipNo"readonly> 
                		<button type="button" class="zip_code_btn" onclick="javascript:goPopup();">우편번호</button><br/> 
                		<input type="text" value="<%=maddr%>" id="addr" name="addr"><br/> 
                		<input type="text" value="<%=maddrDetail%>" id="addrDetail" name="addrDetail"> 
                	</td> 
                </tr>
                <tr>
                  	<td id="title">휴대전화&nbsp;&nbsp;</td>
                    <td>
                    010 -
                        <input type="text" name="phone1" maxlength="4"  size="4" value="<%=mphonenum1%>"> -
                        <input type="text" name="phone2" maxlength="4"  size="4" value="<%=mphonenum2%>">
                    </td>
                </tr>
                <tr>
                    <td id="title">이 메 일&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50" value="<%=memail%>">@
                        <select name="mail2" >
                        	<option selected><%=memail2%></option>
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
        <input type="submit" id="joinbtn" value="수    정" />
        <input type="button" id="cancelbtn" value="취   소" onclick="location.href='main.jsp'"/>
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