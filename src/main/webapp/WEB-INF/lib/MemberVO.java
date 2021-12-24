package mem;
import java.sql.Timestamp;

// 데이터의 전달을 담당하는 클래스 - DTO
public class MemberVO 
{
	private String name;			// 이름
	private String resident1; 	// 주민번호 앞
	private String resident2; 	// 주민번호 뒤
	private String resident; 	// 주민번호 뒤
	private String gender;		// 성별
	private String department;		// 전공
	private String studentnum;		// 학번
	private String zipNo;		// 우편번호
	private String addr;		// 기본주소
	private String addrDetail;		// 상세주소
	private String phone1;		// 전화(중간번호)
	private String phone2;		// 전화(끝번호)
	private String phonenum;
	private String mail1;		// 이메일 - @ 앞부분
	private String mail2;		// 이메일 - @ 뒷부분
	private String email;
	
	public MemberVO() {}
	public MemberVO(String name, String resident1, String resident2, String gender, String department, String studentnum, String zipNo,String addr,
			String addrDetail, String phone1, String phone2, String mail1, String mail2 ){
	       
        this.name = name;
        this.resident1 = resident1;
        this.resident2 = resident2;
       
        this.gender = gender;
        this.department = department;
        this.studentnum = studentnum;
       
        this.zipNo = zipNo;
        this.addr=addr;
        this.addrDetail = addrDetail;
        this.phone1=phone1;
        this.phone2=phone2;
        this.mail1=mail1;
        this.mail2=mail2;
    }

	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	public String getResident1() {return resident1;}
	public void setResident1(String resident1) {this.resident1 = resident1;}
	
	public String getResident2() {return resident2;}
	public void setResident2(String resident2) {this.resident2 = resident2;}
	
	public String getGender() {return gender;}
	public void setGender(String gender) {this.gender = gender;}

	public String getDepartment() {return department;}
	public void setDepartment(String department) {this.department = department;}
	
	public String getStudentnum() {return student_num;}
	public void setStudentnum(String student_num) {this.student_num = student_num;}
	
	public String getZipNo() {return zipNo;}
	public void setZipNo(String zipNo) {this.zipNo = zipNo;}
	public String getAddr() {return addr;}
	public void setAddr(String addr) {this.addr = addr;}
	public String getAddrDetail() {return addrDetail;}
	public void setAddrDetail(String addrDetail) {this.addrDetail = addrDetail;}
	
	public String getPhone1() {return phone1;}
	public void setPhone1(String phone1) {this.phone1 = phone1;}
	public String getPhone2() {return phone2;}
	public void setPhone2(String phone2) {this.phone2 = phone2;}
	
	public String getMail1() {return mail1;}
	public void setMail1(String mail1) {this.mail1 = mail1;}
	public String getMail2() {return mail2;}
	public void setMail2(String mail2) {this.mail2 = mail2;}
	
	public String getResident() {return resident;}
	public void setResident(String resident) {this.resident = resident;}
	
	public String getPhonenum() {return phonenum;}
	public void setPhonenum(String phonenum) {this.phonenum = phonenum;}
	
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
}
