package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import member.*; //DTO,DAO
public class DeleteProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//deleteForm.jsp가 보내준 데이터받기
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		MemberDAO dao=MemberDAO.getDao(); //dao객체 얻기
		int x=dao.deleteMember(id, pw); //dao메서드 호출
		
		//jsp사용할 속성설정
		request.setAttribute("x", x);
		
		return "/member/deletePro.jsp";
	}//requestPro-end
}//class-end
