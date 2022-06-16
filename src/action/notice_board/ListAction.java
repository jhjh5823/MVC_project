package action.notice_board;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandAction;
import java.util.*; //List,ArrayList 
import boardmysql.*; //DAO,DTO
public class ListAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		//글검색
		String keyField=""; //키필드 name,subject,content
		String keyWord="";  //검색단어
		//Vector <Notice_BoardDTO> vec=null;
		//jsp로직처리는 Action에다 한다
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum); //현재페이지
		int pageSize=10;
		int startRow=(currentPage-1)*pageSize+1; //페이지의 시작 글(row)번호 
		int endRow=currentPage*pageSize; //페이지의 끝 글번호
		int count=0; //총 글 갯수 넣을 변수
		int number=0; //출력시 글번호 처리하려고 
		int pageBlock=10; //블럭당 10페이지
		List list=null; //모든 클래스는 null로 초기화한다 
		Notice_BoardDAO dao=Notice_BoardDAO.getDao();
		count=dao.getCount(); //총 글갯수 얻는다
		if(request.getParameter("keyWord")!=null){
			keyWord=request.getParameter("keyWord");
			keyField=request.getParameter("keyField");
		}
		//vec=dao.searchList(keyField, keyWord);
		if(count>0){//글이 있으면 
			list=dao.getList(keyField, keyWord,startRow, pageSize);
		}else{//글이 없으면
			list=Collections.EMPTY_LIST;//글이없을때,비어있는 리스트
			//count=0;
		}
		number=count-(currentPage-1)*pageSize;//글번호 구한다
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int startPage=(int)(currentPage/pageBlock)*10+1;
		int endPage=startPage+pageBlock-1;
		//------------------
		// jsp에서 사용할 속성 설정
		//------------------
		request.setAttribute("startPage", new Integer(startPage));
		request.setAttribute("endPage", new Integer(endPage));
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageBlock", new Integer(pageBlock));
		request.setAttribute("pageCount", new Integer(pageCount));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);
		return "/notice_board/list.jsp"; //뷰(jsp)리턴
		
	}//requestPro-end

}//class-end
