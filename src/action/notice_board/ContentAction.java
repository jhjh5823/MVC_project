package action.notice_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import boardmysql.*;//DTO,DAO
public class ContentAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//리스트가 보내준 내용받기 
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		Notice_BoardDAO dao=Notice_BoardDAO.getDao(); //dao객체얻기 
		Notice_BoardDTO dto=dao.getBoard(num); //dao메서드 호출, num에 해당하는 자료받기
		
		int ref=dto.getRef();
		int re_step=dto.getRe_step();
		int re_level=dto.getRe_level();
		
		//jsp에서 사용할 값 설정
		//request.setAttribute("String", 객체);
		request.setAttribute("num", new Integer(num));//Integer 타입=객체타입
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("ref", new Integer(ref));
		request.setAttribute("re_step", new Integer(re_step));
		request.setAttribute("re_level", new Integer(re_level));
		
		request.setAttribute("dto", dto);
		
		return "/notice_board/content.jsp";//view(jsp)리턴
	}

}
