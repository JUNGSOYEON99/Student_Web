<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="jsp.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 수정 처리</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");
	Connection con=null;
	PreparedStatement ps=null;

	String mname=request.getParameter("name");
	String mresident=request.getParameter("resident");
	String mgender=request.getParameter("gender");
	String mdepartment=request.getParameter("department");
	String mstudentnum=request.getParameter("studentnum");
	String mzipNo=request.getParameter("zipNo");
	String maddr=request.getParameter("addr");
	String maddrDetail=request.getParameter("addrDetail");
	String mphonenum1=request.getParameter("phone1");
	String mphonenum2=request.getParameter("phone2");
	String memail=request.getParameter("mail1");
	String memail2=request.getParameter("mail2");
	int result=0;
	Class.forName("com.mysql.cj.jdbc.Driver");

	try{
		con = DBConnection.getCon(); 
		ps=con.prepareStatement("UPDATE student SET DEPARTMENT=?,ADDRESS1=?,ADDRESS2=?,ADDRESS3=?,PHONE=?,EMAIL=? WHERE STUDENT_NUM=?");
		ps.setString(1,mdepartment);
		ps.setString(2,mzipNo);
		ps.setString(3,maddr);
		ps.setString(4,maddrDetail);
		ps.setString(5,"010-"+mphonenum1+"-"+mphonenum2);
		ps.setString(6,memail+"@"+memail2);
		ps.setString(7,mstudentnum);
		ps.executeUpdate();
		result++;
	}finally{
		if(ps != null) try{ps.close();} catch(SQLException ex){}
		if(con != null) try{con.close();} catch(SQLException ex){}
		
	    if(result>0){
	    	%>
	        <script>
	        alert('수정이 완료되었습니다.');   
	        location.href='main.jsp';
	        </script>
	     <%}else{
	       
	        out.print("<script>");
	        out.print("alert('수정에 실패하였습니다!');");  
	        out.print("history.back();");          
	        out.print("</script>");
	    }
	}
%>
</body>
</html>