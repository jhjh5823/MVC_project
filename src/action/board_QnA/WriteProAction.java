package action.board_QnA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import boardmysql_QnA.*;
public class WriteProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		BoardDTO dto=new BoardDTO(); //객체 생성
		//클라이언트가 보내준 데이터를 받아서 dto에 넣는다
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setWriter(request.getParameter("writer"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPw(request.getParameter("pw"));
		dto.setRef(Integer.parseInt(request.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		dto.setIp(request.getRemoteAddr()); 
		BoardDAO dao=BoardDAO.getDao(); //dao객체 얻기
		dao.insertBoard(dto); //dao메서드 호출
		return "/board_QnA/writePro.jsp"; //jsp리턴
	}

}
