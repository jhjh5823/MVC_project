package action.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reviewmysql.*;
import command.CommandAction;
public class WriteProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		ReviewDTO dto=new ReviewDTO(); //객체 생성
		//클라이언트가 보내준 데이터를 받아서 dto에 넣는다
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setWriter(request.getParameter("writer"));
		dto.setLecture(request.getParameter("lecture"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPw(request.getParameter("pw"));
		dto.setRef(Integer.parseInt(request.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		dto.setIp(request.getRemoteAddr()); 
		ReviewDAO dao=ReviewDAO.getDao(); //dao객체 얻기
		dao.insertReview(dto); //dao메서드 호출
		return "/review/writePro.jsp"; //jsp리턴
	}

}
