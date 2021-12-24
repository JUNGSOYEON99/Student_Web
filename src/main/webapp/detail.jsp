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
<title>학생 정보 상세보기</title>
<link rel="stylesheet" type="text/css" href="join.css">

</head>
<body>
<jsp:useBean id="dao" class="mem.MemberDAO"/>
<%
	String detailID=request.getParameter("detailID");
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
	String mphonenum=null;
	String memail=null;
	
	try {
		con = DBConnection.getCon(); 
		ps=con.prepareStatement("select * from student where STUDENT_NUM = ?");
		ps.setString(1,detailID);
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
			mphonenum=rs.getString(9);
			memail=rs.getString(10);
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
<h2> 상세정보 </h2>
        <table id="joint">
            <tr>
            </tr>
                <tr>
                    <td id="title">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;</td>
                    <td>
                        <%=mname%>
                    </td>
                </tr>
                 <tr></tr>      
                <tr>
                    <td id="title">주민번호&nbsp;&nbsp;</td>
                    <td>
                       <%=mresident%>
                    </td>
                </tr>
                <tr></tr> 
                	<tr>
                    	<td id="title" name="gender">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;</td>
                    	<td>
                    		<%=mgender%>
                    	</td>
                	</tr>
                	<tr></tr> 
                <tr>
                    <td id="title">전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공&nbsp;&nbsp;</td>
                    <td>
                    	<%=mdepartment%>
                    </td>
                </tr>
                <tr></tr> 
                <tr>
                    <td id="title">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;</td>
                    <td>
                        <%=mstudentnum%>
                    </td>
                </tr>
                <tr></tr> 
                <tr> 
                	<td id="title">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;</td> 
                	<td> 
                		(<%=mzipNo%>)
                		<%=maddr%>
                		<%=maddrDetail%>
                	</td> 
                </tr>
                <tr></tr> 
                <tr>
                  	<td id="title">휴대전화&nbsp;&nbsp;</td>
                    <td>
         				<%=mphonenum%>
                    </td>
                </tr>
                <tr></tr> 
                <tr>
                    <td id="title">이 메 일&nbsp;&nbsp;</td>
                    <td>
                        <%=memail%>
                    </td>
                </tr>
            </table>
            <br>
            <div id="but">
        <input type="button" id="cancelbtn" value="닫    기" onclick="location.href='main.jsp'"/>
        </div>
</body>
</html>