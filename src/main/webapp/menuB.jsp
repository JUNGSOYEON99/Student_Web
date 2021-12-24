<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mem.MemberVO" %>
<%@ page import="mem.MemberDAO" %>
<%@page import="java.util.ArrayList"%>
<%-- 자바빈 클래스 import --%>       

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  table {border: 2px black; width:1220px}
  th{ text-align: center; padding:5px; font-size:15px; background-color:#c5c5c5;}
  td{ text-align: center; padding:4px; font-size:14px;}
  #insertstudent{
  	margin-left:700px;
  	margin-bottom:10px; 
	width:100px;
    background-color: #777777;
    border-radius:7px;
    border: none;
    color:#ffffff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    cursor: pointer;}
  #deletebtn, #modifybtn, #detailbtn{
    width:50px;
    background-color: #777777;
    border-radius:7px;
    border: none;
    color:#ffffff;
    padding: 5px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    cursor: pointer;
    }
   #modifybtn{
    width:50px;
    background-color: #777777;
    border-radius:7px;
    border: none;
    color:#ffffff;
    padding: 5px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    cursor: pointer;
    }
   #detailbtn{
    width:65px;
    background-color: #a3a3a3;
    border-radius:7px;
    border: none;
    color:#ffffff;
    padding: 5px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    cursor: pointer;
    }
    #pagenum{
    	margin-left:500px;
    }


</style>
<script type="text/javascript">
    function searchCheck(frm){
        //검색
        if(frm.keyWord.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        
        frm.submit();      
    };
	function inpopup(){
		window.open("StudentForm.jsp", "학생 등록", "width=540, height=550, left=100, top=50");
	};
	$(document).ready(function(){ 
		$('#de1').click(function(e){
		e.preventDefault();
		$("#content").load($(this).attr('href'));
		});
		 
		$('#de2').click(function(e){
		    var href = '';
		    e.preventDefault();
		 $("#content").load(href);
		});		 
	});
	function idDelete(delID){
        location.href = "delete.jsp?id=" + delID;   //get방식으로 삭제할 학번을 넘김           
    };
	
    $(window).load(function(){
        $("input[name='chk_all']").click(function () {
            var chk_listArr = $("input[name='chk_list']");
            for (var i=0; i < chk_listArr.length; i++) {
                chk_listArr[i].checked = this.checked;
            }
        });
       
        $("input[name='chk_list']").click(function () { //리스트 항목이 모두 선택되면 전체 선택 체크
            if ($("input[name='chk_list']:checked").length == 5) {
                $("input[name='chk_all']")[0].checked = true;
            } else  {                                                //리스트 항목 선택 시 전체 선택 체크를 해제함
                $("input[name='chk_all']")[0].checked = false;
            }
        });   
       
    });



</script>
</head>
<body>
<jsp:useBean id="dao" class="mem.MemberDAO" />
    <%
    request.setCharacterEncoding("UTF-8");
    String keyField = request.getParameter("keyField");
    String keyWord = request.getParameter("keyWord");

    int count=dao.selectCnt();//전체행 개수
    String pageStart=request.getParameter("page");
    //현재 페이지를 받아옴
    int startPage=0;
    int onePageCnt=9; //한 페이지에 출력할 행의 개수
    String de="정보통신공학";
    count=(int)Math.ceil((double)count/(double)onePageCnt);
    //페이지 수 저장
    if(pageStart != null){
    	startPage=(Integer.parseInt(pageStart)-1)*onePageCnt;
    }
    ArrayList<MemberVO> v = dao.selectPageA(startPage, onePageCnt, keyField, keyWord, de);
    %>

	<form name="serach" method ="post">
	<b>* 검색조건 : </b>
        <select name="keyField">
           <option value="0"> ----선택----</option>
           <option value="NAME">이름</option>
           <option value="STUDENT_NUM">학번</option>
           <option value="PHONE">휴대전화</option>  
         </select>
         <input type="text" name="keyWord" />
         <input type="button" value="검색" onclick="searchCheck(form)" />
         <input type="button" id="insertstudent" value="학생등록" onclick="inpopup()"/>
    </form>
   
   <form action="multidel.jsp" method="post" id="multidelete">
    <table id="infot">
        <tr>
        <th><input type="checkbox" name="chk_all"></th><th>이름</th><th>성별</th><th>전공</th><th>학번</th><th>휴대전화</th><th>이메일</th><th>수정</th><th>삭제</th><th>상세보기</th>
        </tr>
    <%
    for(int i=0; i<v.size();i++){
    %> 
        <tr>
        	<td><input type="checkbox" id="chk_list" name="chk_list" value="<%=v.get(i).getStudentnum()%>"></td>
            <td><%=v.get(i).getName() %></td>
            <td><%=v.get(i).getGender() %></td>
            <td><%=v.get(i).getDepartment() %></td>
            <td><%=v.get(i).getStudentnum() %></td>
            <td><%=v.get(i).getPhonenum()%></td>
            <td><%=v.get(i).getEmail()%></td>
            <td><input type="button" value="수정" id="modifybtn" onclick="location.href='<%=request.getContextPath()%>/modifyinfo.jsp?modiID=<%=v.get(i).getStudentnum()%>';"></td>
            <td><input type="button" value="삭제" id="deletebtn" onclick="idDelete('<%=v.get(i).getStudentnum() %>');"></td>
            <td><input type="button" value="상세보기" id="detailbtn" onclick="location.href='<%=request.getContextPath()%>/detail.jsp?detailID=<%=v.get(i).getStudentnum()%>';"></td>
        </tr>
               
    <%
    }
     %>
    </table><br>
    <input type="submit" id="deletecheck" value="선택삭제" />
    <a id="pagenum">&nbsp;</a>
    <% for(int i=1; i<=count; i++) {%>
    	<a id="pn" href="main.jsp?page=<%=i %>">[<%=i %>]</a>
    <%}; %>
    </form>
</body>
</html>