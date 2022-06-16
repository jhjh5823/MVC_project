package member;
import java.sql.*; //Connection,Statement,PreparedStatement,ResultSet

import javax.sql.*; //DataSource
import javax.naming.*; //lookup

import java.util.*;
//DAO:비지니스로직
//DAO:CRUD 처리
public class MemberDAO {
	
	//싱글톤 객체사용(객체 하나만 사용하여 처리), 메모리 절약 효과
	private static MemberDAO instance=new MemberDAO();//객체생성
	//생성자 private->외부에서 객체생성 못하게 막음 
	private MemberDAO(){}
	public static MemberDAO getDao(){ //JSP에서 객체얻기, MemberDAO.getDao()
		return instance;
	}
	//-------------------
	// 커넥션 풀 사용
	//-------------------
	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getCon-end
	//-------------------
	// id중복체크
	//-------------------
	public int confirmID(String id){
		int x=-100;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getCon();
			pstmt=con.prepareStatement("select id from member where id=?");
			//?값채우기
			pstmt.setString(1,id);
			rs=pstmt.executeQuery(); //쿼리 수행
			if(rs.next()){
				x=1; //사용중인 ID
			}else{
				x=-1; //사용가능한 ID
			}
		}catch(Exception ex){
			System.out.println("confirmID()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return x;
	}//confirmID()-end
	//-------------------
	// 회원가입
	//-------------------
	public void insertMember(MemberDTO dto){
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getCon();
			pstmt=con.prepareStatement("insert into member values(?,?,?,?,?,?,?,?,NOW())");
			//?값 채우기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddr());
			pstmt.setString(8, dto.getAddr2());
			
			pstmt.executeUpdate(); //쿼리수행
		}catch(Exception ex){
			System.out.println("insertMember()예외:"+ex);
		}finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//insertMember-end
	//-------------------
	// 로그인,인증
	//-------------------
	public int userCheck(String id,String pw){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbpw="";
		int x=-100;
		try{
			con=getCon();
			pstmt=con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery(); //쿼리수행
			if(rs.next()){
				dbpw=rs.getString("pw");
				if(dbpw.equals(pw)){
					//암호가 일치하면 -> 인증성공
					x=1;
				}else{ //암호가 틀린경우
					x=0;
				}//inner-else-end
			}else{ 
				x=-1; //없는id
			}//outer-else-end
		}catch(Exception ex){
			System.out.println("userCheck()예외:"+ex);
		}finally{
			try{				
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return x;
	}//userCheck-end
	//-------------------
	// 내 정보 수정 폼
	//-------------------
	public MemberDTO getMember(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO dto=null;
		try{
			con=getCon();
			pstmt=con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery(); //쿼리수행
			if(rs.next()){
				dto=new MemberDTO();
				//rs내용을 dto에 넣는다, return dto해준다
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddr(rs.getString("addr"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setRegdate(rs.getString("regdate"));
			}//if-end
		}catch(Exception ex){
			System.out.println("getMember()예외:"+ex);
		}finally{
			try{				
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return dto;
	}//getMember-end
	//-------------------
	// DB내용 수정
	//-------------------
	public void updateMember(MemberDTO dto){
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getCon();
			String sql="update member set pw=?,name=?,email=?,tel=?,zipcode=?,addr=?,addr2=? where id=?";
			pstmt=con.prepareStatement(sql); //생성시 인자들어간다
			//?값 채우기
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getAddr());
			pstmt.setString(7, dto.getAddr2());
			pstmt.setString(8, dto.getId());
			pstmt.executeUpdate(); //쿼리수행
		}catch(Exception ex){
			System.out.println("updateMember()예외:"+ex);
		}finally{
			try{				
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//updateMember-end
	//-------------------
	// 회원탈퇴
	//-------------------
	public int deleteMember(String id,String pw){
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		
		int x= -100;
		try{
			con=getCon();
			pstmt=con.prepareStatement("select pw from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery(); //쿼리수행
			if(rs.next()){ //id가 있을때
				String dbpw=rs.getString("pw");
				if(dbpw.equals(pw)){ //암호가 일치하면 삭제
					pstmt2=con.prepareStatement("delete from member where id=?");
					pstmt2.setString(1, id);
					pstmt2.executeUpdate(); //쿼리수행
					x=1; //삭제성공
				}else{ //암호가 일치하지않으면
					x=-1;
				}
			}else{ //id가 없을때
				x=0;
			}
		}catch(Exception ex){
			System.out.println("deleteMember()예외:"+ex);
		}finally{
			try{				
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(pstmt2!=null){pstmt2.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return x;
	}//deleteMember-end
}//class-end
