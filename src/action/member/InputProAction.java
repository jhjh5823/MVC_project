package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import member.*; //DTO,DAO
import command.CommandAction;

public class InputProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//inputForm.jsp가 보내준 데이터 받아서 dto에 넣기 
		request.setCharacterEncoding("UTF-8");
		MemberDTO dto=new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddr(request.getParameter("addr"));
		dto.setAddr2(request.getParameter("addr2"));
		
		//dto를 dao에 넘겨준다 
		MemberDAO dao=MemberDAO.getDao(); //dao객체얻기
		dao.insertMember(dto); //dao메서드 호출, dto넘겨준다
		String id=request.getParameter("id");
		
		//jsp에서 사용할 값 설정
		request.setAttribute("id",id);
		
		return "/member/inputPro.jsp"; //뷰 리턴
	}//requestPro-end
}//class-end
