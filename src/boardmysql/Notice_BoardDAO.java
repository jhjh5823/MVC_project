package boardmysql;
import java.sql.*; //Connection,Statement,PreparedStatement,ResultSet

import javax.sql.*; //DataSource
import javax.naming.*; //lookup

import java.util.*;
//DAO:CRUD작업,비지니스 로직
public class Notice_BoardDAO {
	//전역변수
	Connection con=null;
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
	String sql="";
	//----------------------
	private Notice_BoardDAO(){} //생성자, 외부에서 객체생성 못하게한다, 메모리 절약 효과
	private static Notice_BoardDAO instance=new Notice_BoardDAO(); //싱글톤 객체사용
	public static Notice_BoardDAO getDao(){ //JSP에서 사용할 메서드
		return instance;
	}//getDAO-end
	//----------------------
	// 커넥션 얻기
	//----------------------
	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}//getCon-end
	//----------------------
	// 글쓰기, 답글쓰기
	//----------------------
	public void insertBoard(Notice_BoardDTO dto){
		int num=dto.getNum();
		int ref=dto.getRef();
		int re_step=dto.getRe_step();
		int re_level=dto.getRe_level();
		
		int number=0; //글 그룹처리하려고
		try{
			con=getCon();
			pstmt=con.prepareStatement("select max(num) from notice_board"); //최대 글번호 얻기
			rs=pstmt.executeQuery();
			if(rs.next()){ //글이존재하면
				number=rs.getInt(1)+1; //최대글번호+1  ref=number;
			}else{ //처음글일때
				number=1; //ref=1
			}//else-end
			if(num!=0){ //답글이면
				//답글 끼워넣기 위치 확보
				sql="update notice_board set re_step=re_step+1 where ref=? and re_step>?";
				pstmt=con.prepareStatement(sql); //생성시 인자들어감
				//?값 채우기
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate(); //쿼리수행
				re_step=re_step+1;
				re_level=re_level+1;
			}else{ //원글이면
				ref=number;
				re_step=0;
				re_level=0;
			}//else-end
			//insert
			sql="insert into notice_board(writer,subject,content,pw,regdate,ref,re_step,re_level,ip) values(?,?,?,?,NOW(),?,?,?,?)";
			//mysql : NOW()
			//mysql : curdate()
			//oracle : sysdate
			pstmt=con.prepareStatement(sql); //생성시 인자들어감
			//?값 채우기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPw());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, dto.getIp());
			pstmt.executeUpdate(); //쿼리수행
		}catch(Exception ex){
			System.out.println("insertBoard()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
	}//insertBoard-end
	//----------------------
	// 글 갯수
	//----------------------
	public int getCount(){
		int cnt=0;
		try{
			con=getCon();
			pstmt=con.prepareStatement("select count(*) from notice_board");
			rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt(1); //1번필드
			}
		}catch(Exception ex){
			System.out.println("getCount()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return cnt;
	}//getCount()-end
	//----------------------
	// 리스트
	//----------------------
	public List getList(String keyField,String keyWord,int start,int cnt){
		List<Notice_BoardDTO> list=null;
		try{
			con=getCon();
			if(keyWord.equals(null) || keyWord.equals("")){
				//전체글목록
				sql="select * from notice_board order by ref desc,re_step asc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, cnt);
			}else{
				//검색
				sql="select * from notice_board where "+keyField+" like '%"+keyWord+"%' order by ref desc,re_step asc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, cnt);
			}//else-end
			//limit 시작위치,갯수
			//pstmt=con.prepareStatement(sql); 
			rs=pstmt.executeQuery(); //쿼리 수행
			if(rs.next()){
				list=new ArrayList<Notice_BoardDTO>();
				do{
					Notice_BoardDTO dto=new Notice_BoardDTO();
					//rs를 dto넣고, dto를 list넣는다
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setPw(rs.getString("pw"));
					dto.setRegdate(rs.getTimestamp("regdate")); //***년월일 시분초
					
					//System.out.println("날짜:"+rs.getString("regdate")); //년월일 시분초
					//System.out.println("날짜:"+rs.getDate("regdate"));  //년월일
					//System.out.println("날짜:"+rs.getTimestamp("regdate")); //년월일 시분초
					
					dto.setReadcount(rs.getInt("readcount"));
					dto.setRef(rs.getInt("ref")); //글그룹
					dto.setRe_step(rs.getInt("re_step")); //글순서
					dto.setRe_level(rs.getInt("re_level")); //답글 깊이 
					dto.setIp(rs.getString("ip"));
					list.add(dto); //리스트에 넣기
				}while(rs.next());
			}//if-end
		}catch(Exception ex){
			System.out.println("getList()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return list;
	}//getList-end
	//----------------------
	//  조회수, 글내용보기
	//----------------------
	public Notice_BoardDTO getBoard(int num){
		Notice_BoardDTO dto=null;
		try{
			con=getCon();
			//조회수 증가
			sql="update notice_board set readcount=readcount+1 where num="+num;
			pstmt=con.prepareStatement(sql); //생성시 인자들어간다
			pstmt.executeUpdate(); //쿼리수행
			//----------------------
			//  글내용보기를 하기 위한 쿼리 작업
			//----------------------
			pstmt=con.prepareStatement("select * from notice_board where num="+num);
			rs=pstmt.executeQuery(); //쿼리수행
			if(rs.next()){
				//rs내용을 dto에 담는다, dto를 front-end로 보낸다
				dto=new Notice_BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getTimestamp("regdate")); //***년월일 시분초
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref")); //글그룹
				dto.setRe_step(rs.getInt("re_step")); //글순서
				dto.setRe_level(rs.getInt("re_level")); //답글 깊이 
				dto.setIp(rs.getString("ip"));
			}//if-end
		}catch(Exception ex){
			System.out.println("getBoard()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return dto; //클라이언트로 리턴
	}//getBoard-end
	//----------------------
	// 글 수정 폼
	//----------------------
	public Notice_BoardDTO getUpdate(int num){
		Notice_BoardDTO dto=null;
		try{
			con=getCon();
			pstmt=con.prepareStatement("select * from notice_board where num="+num); //생성시 인자들어간다
			rs=pstmt.executeQuery(); //쿼리 수행
			if(rs.next()){
				//rs내용을 dto에 담기
				dto=new Notice_BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getTimestamp("regdate")); //***년월일 시분초
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref")); //글그룹
				dto.setRe_step(rs.getInt("re_step")); //글순서
				dto.setRe_level(rs.getInt("re_level")); //답글 깊이 
				dto.setIp(rs.getString("ip"));
			}//if-end
		}catch(Exception ex){
			System.out.println("getUpdate()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return dto;
	}//getUpdate-end
	//----------------------
	// DB글 수정
	//----------------------
	public int updateBoard(Notice_BoardDTO dto){
		int x=-100;
		String dbpw="";
		try{
			con=getCon();
			pstmt=con.prepareStatement("select pw from notice_board where num=?");
			//?값 채우기
			pstmt.setInt(1, dto.getNum());
			rs=pstmt.executeQuery(); //쿼리수행
			if(rs.next()){
				dbpw=rs.getString("pw");
				if(dbpw.equals(dto.getPw())){ //암호가 일치하면 글수정
					sql="update notice_board set writer=?,subject=?,content=? where num=?";
					pstmt=con.prepareStatement(sql); //생성시 인자 들어간다
					//?값 채우기
					pstmt.setString(1, dto.getWriter());
					pstmt.setString(2, dto.getSubject());
					pstmt.setString(3, dto.getContent());
					pstmt.setInt(4, dto.getNum());
					pstmt.executeUpdate(); //쿼리수행
					x=1; //정상적으로 수정
				}else{ //암호가 틀리면
					x=0;
				}
			}//if-end
		}catch(Exception ex){
			System.out.println("updateBoard()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return x;
	}//updateBoard-end
	//----------------------
	//  DB글삭제
	//----------------------
	public int deleteBoard(int num,String inpw){
		int x=-100;
		String dbpw="";
		try{
			con=getCon(); //커넥션 얻기
			pstmt=con.prepareStatement("select pw from notice_board where num="+num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dbpw=rs.getString("pw");
				if(dbpw.equals(inpw)){
					//암호가 일치하면 글삭제
					pstmt=con.prepareStatement("delete from notice_board where num="+num);
					pstmt.executeUpdate(); //쿼리수행
					x=1; //삭제성공
				}else{
					//암호가 일치하지 않으면 
					x=0; //삭제실패 
				}
			}//if-end
		}catch(Exception ex){
			System.out.println("deleteBoard()예외:"+ex);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally-end
		return x;
	}
}//class-end
