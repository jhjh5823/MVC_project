package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import member.*; //DTO,DAO

public class UpdateProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		//updateForm.jsp가 보내준 자료받아서 dto에 넣기
		String id=request.getParameter("id");
		MemberDTO dto=new MemberDTO();
		
		dto.setId(id);
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddr(request.getParameter("addr"));
		dto.setAddr2(request.getParameter("addr2"));
		
		MemberDAO dao=MemberDAO.getDao(); //dao객체얻기
		dao.updateMember(dto); //dao메서드 호출
		
		//jsp에서 사용할 속성 설정
		request.setAttribute("id",id);
		
		return "/member/updatePro.jsp"; //뷰 리턴
	}//requestPro-end
}//class-end
