package mem;

import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import javax.naming.NamingException;

import jsp.util.DBConnection;
import mem.MemberVO;

/* Data Access Object
 * 테이블 당 한개의 DAO를 작성한다.
 * 
 * JSP_MEMBER 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 */
public class MemberDAO {
	 
    /**
     * 필요한 property 선언
     */
    Connection con;
    Statement st;
    PreparedStatement ps;
    ResultSet rs;
   

    String driverName="com.mysql.cj.jdbc.Driver";
    /**
     * 로드와 연결을 위한 생성자 작성
     */
    public MemberDAO() throws ClassNotFoundException{
       
        try {
            //연결
        	Class.forName(driverName);
            con = DBConnection.getCon();      
           
        } catch (SQLException e) {
           
            System.out.println(e+"=> 연결 실패");
        }
    }//JDBC_memberDAO()
   
    /**
     * DB닫기 기능 메소드 작성
     */
    public void db_close(){
       
        try {
           
            if (rs != null ) rs.close();
            if (ps != null ) ps.close();      
            if (st != null ) st.close();
       
        } catch (SQLException e) {
            System.out.println(e+"=> 닫기 오류");
        }      
       
    } //db_close
   
    /**
     * member테이블에 insert하는 메소드 작성
     */
    public int memberInsert(MemberVO vo){
        int result = 0;
       
        try{
        //실행
            String sql = "insert into student values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, vo.getName());
            ps.setString(2, vo.getResident1()+"-"+ vo.getResident2());
            ps.setString(3, vo.getGender());
            ps.setString(4, vo.getDepartment());
            ps.setString(5, vo.getStudentnum());
            ps.setString(6, vo.getZipNo());
            ps.setString(7, vo.getAddr());
            ps.setString(8, vo.getAddrDetail());
            ps.setString(9, "010-"+vo.getPhone1()+"-"+vo.getPhone2());
            ps.setString(10, vo.getMail1()+"@"+vo.getMail2());
			result = ps.executeUpdate();
			
        }catch (Exception e){
        	System.out.println(vo.getName());
        	System.out.println(vo.getResident1()+"-"+ vo.getResident2());
        	System.out.println(vo.getGender());
        	System.out.println(vo.getDepartment());
        	System.out.println(vo.getStudentnum());
        	System.out.println(vo.getZipNo());
        	System.out.println(vo.getAddr());
        	System.out.println(vo.getAddrDetail());
        	System.out.println("010-"+vo.getPhone1()+"-"+vo.getPhone2());
        	System.out.println(vo.getMail1()+"@"+vo.getMail2());
            System.out.println(e + "=> memberInsert fail");
           
        }finally{
            db_close();
        }
       
        return result;
    }//memberInsert
   
    /**
     * member테이블의 모든 레코드 검색하(Select)는 메서드 작성
     */   
    public ArrayList<MemberVO> getMemberlist(String keyField, String keyWord){
       
        ArrayList<MemberVO> list = new ArrayList<MemberVO>();
       
        try{//실행
        	 String sql ="select * from student ";
             
             if(keyWord != null && !keyWord.equals("") ){
                 sql +="WHERE "+keyField.trim()+" LIKE '%"+keyWord.trim()+"%' order by name";
             }else{//모든 레코드 검색
                 sql +="order by name";
             }
             System.out.println("sql = " + sql);
             st = con.createStatement();
             rs = st.executeQuery(sql);

            while(rs.next()){
                MemberVO vo = new MemberVO();
               
                vo.setName(rs.getString(1));
                vo.setResident(rs.getString(2));
                vo.setGender(rs.getString(3));
                vo.setDepartment(rs.getString(4));
                vo.setStudentnum(rs.getString(5));
                vo.setZipNo(rs.getString(6));
                vo.setAddr(rs.getString(7));
                vo.setAddrDetail(rs.getString(8));
                vo.setPhonenum(rs.getString(9));
                vo.setEmail(rs.getString(10));
                
               
                list.add(vo);
            }
        }catch(Exception e){          
            System.out.println(e+"=> getMemberlist fail");        
        }finally{          
            db_close();
        }      
        return list;
    }//getMemberlist
    public int delMemberlist(String id){
        int result = 0;
        try{//실행
           
            ps = con.prepareStatement("delete from student where STUDENT_NUM = ?");
            //?개수만큼 값 지정
            ps.setString(1, id.trim());
            result = ps.executeUpdate(); //쿼리실행으로 삭제된 레코드 수 반환       
               
        }catch(Exception e){           
            System.out.println(e+"=> delMemberlist fail");         
        }finally{          
            db_close();
        }      
       
        return result;
    }  
  
}