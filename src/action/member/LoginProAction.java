package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.*;
import command.CommandAction;

public class LoginProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		//loginForm.jsp에서 보내준 데이터 받기
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		MemberDAO dao=MemberDAO.getDao();
		int x=dao.userCheck(id, pw); //dao메서드호출
		
		//jsp에서 사용할 속성 설정
		request.setAttribute("x", x);
		request.setAttribute("id", id);
		
		return "/member/loginPro.jsp"; //뷰 리턴
	}//requestPro-end
}//class-end
