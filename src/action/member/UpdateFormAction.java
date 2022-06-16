package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.*; //DTO,DAO
public class UpdateFormAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//modify.jsp에서 넘어온 id받는다
		String id=request.getParameter("id");
		MemberDAO dao=MemberDAO.getDao(); //dao객체 얻기
		MemberDTO dto=dao.getMember(id); //dao메서드호출,dto받는다
		//jsp에서 사용할 값 설정
		request.setAttribute("dto", dto);
		return "/member/updateForm.jsp"; //뷰리턴
	}//requestPro-end
}//class-end
