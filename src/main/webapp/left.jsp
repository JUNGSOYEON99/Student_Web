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
<link rel="stylesheet" type="text/css" href="studentinfo.css?ver=2">
<meta charset="UTF-8">

</head>
<body>
<jsp:useBean id="dao" class="mem.MemberDAO"/>
<%
	Connection con=null;
	Statement st;
	PreparedStatement ps=null;
	ResultSet rs;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	int depart=0;
	int de1=0;
	int de2=0;
	int de3=0;
	String sql="select count(*) from student where DEPARTMENT='정보보안'";

	try {
		con = DBConnection.getCon(); 
		ps=con.prepareStatement("select count(*) from student");
		
		rs=ps.executeQuery();
		if(rs.next()){
			depart=rs.getInt(1);
		}
	} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
	} finally {
		// Connection, PreparedStatement를 닫는다.
		try{
			con = DBConnection.getCon(); 
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			if(rs.next()){
				de1=rs.getInt(1);
			}
			if ( ps != null ){ ps.close(); ps=null; }
			if ( con != null ){ con.close(); con=null;	}
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
		}
} // end try~catch 
%>
<%

	Class.forName("com.mysql.cj.jdbc.Driver");

	String sql2="select count(*) from student where DEPARTMENT='정보통신공학'";
	String sql3="select count(*) from student where DEPARTMENT='컴퓨터공학'";
	try {
		con = DBConnection.getCon(); 
		ps=con.prepareStatement(sql2);
		
		rs=ps.executeQuery();
		if(rs.next()){
			de2=rs.getInt(1);
		}
	} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
	} finally {
		// Connection, PreparedStatement를 닫는다.
		try{
			con = DBConnection.getCon(); 
			ps=con.prepareStatement(sql3);
			
			rs=ps.executeQuery();
			if(rs.next()){
				de3=rs.getInt(1);
			}
			if ( ps != null ){ ps.close(); ps=null; }
			if ( con != null ){ con.close(); con=null;	}
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
		}
} // end try~catch 
%>
	<%
        String pageChange;
    %>

      <ul>
      <br>
        <li><a class="first">IT학부 총 학생수 --------</a></li>
        <li><a class="plus">&nbsp;<%=depart %>명</a></li>
        <br><br>
        <li><a class="first">학과별 총 학생수 --------</a></li>
        <li><a class="plus">&nbsp;정보보안 : <%=de1 %>명</a></li>
        <li><a class="plus">&nbsp;정보통신공학 : <%=de2 %>명</a></li>
        <li><a class="plus">&nbsp;컴퓨터공학 : <%=de3 %>명</a></li>
        <br><br>
        <li><a class="first">학과별 학생 목록 --------</a></li>
        <li><a class="plus1" id="de3" href="?pageChange=menuA.jsp">&nbsp;정보보안</a></li>
        <li><a class="plus1" id="de3" href="?pageChange=menuB.jsp">&nbsp;정보통신공학</a></li>
        <li><a class="plus1" id="de3" href="?pageChange=menuC.jsp">&nbsp;컴퓨터공학</a></li>
        <br>
      </ul>

</body>
</html>