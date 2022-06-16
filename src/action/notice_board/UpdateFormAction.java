package action.notice_board;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import boardmysql.*; //DTO,DAO
public class UpdateFormAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		//content.jsp보내준 내용받기
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		Notice_BoardDAO dao=Notice_BoardDAO.getDao(); //dao객체얻기
		Notice_BoardDTO dto=dao.getUpdate(num); //dao메서드 호출,num에 해당하는 자료받기
		//jsp에서 사용할 값 설정
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		return "/notice_board/updateForm.jsp"; //view리턴(jsp)
	}//requestPro-end
}//class-end
