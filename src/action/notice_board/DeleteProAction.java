package action.notice_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import boardmysql.*; //DAO,DTO
public class DeleteProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//deleteForm.jsp 보내준 데이터 받기
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		String pw=request.getParameter("pw");
		
		Notice_BoardDAO dao=Notice_BoardDAO.getDao(); //dao객체얻기
		int x=dao.deleteBoard(num, pw); //dao메서드 호출
		
		//jsp에서 사용할 속성 설정
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("x", x);
		
		//x=1 삭제성공
		//x=0 암호가 일치하지않음
		return "/notice_board/deletePro.jsp";//뷰(jsp)리턴
	}//requestPro-end
}//class-end
