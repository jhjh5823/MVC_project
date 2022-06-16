package action.notice_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;

public class DeleteFormAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//content.jsp가 보내준 데이터 받기
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		//jsp에서 사용할 속성
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "/notice_board/deleteForm.jsp"; //뷰(jsp)리턴 
	}//requestPro-end
}//class-end
