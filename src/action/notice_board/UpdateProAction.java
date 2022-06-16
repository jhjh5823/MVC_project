package action.notice_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandAction;
import boardmysql.*; //DTO,DAO
public class UpdateProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		//updateForm.jsp가 보내준 데이터 받기 
		String pageNum=request.getParameter("pageNum");
		//updateForm.jsp가 보내준 데이터 dto에 저장
		
		Notice_BoardDTO dto=new Notice_BoardDTO();
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setWriter(request.getParameter("writer"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPw(request.getParameter("pw"));
		
		Notice_BoardDAO dao=Notice_BoardDAO.getDao(); //dao객체얻기
		int x=dao.updateBoard(dto); //dao메서드 호출, 결과 x를 받는다
		//x=1 이면 정상수행
		//x=0 이면 암호가 틀림
		//x=-1이면 해당 자료가 없음
		
		//jsp가 사용할 값 세팅
		request.setAttribute("x", x);
		request.setAttribute("pageNum", pageNum);
		return "/notice_board/updatePro.jsp";//뷰(jsp)를 리턴한다
	}//requestPro-end

}//class-end
