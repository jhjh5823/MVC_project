package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {
	//인터페이스는 메서드 선언만 한다, Action클래스가 상속받아서 오버라이딩 한다
	public String requestPro(HttpServletRequest request,HttpServletResponse response) throws Throwable;
}//CommandAction-end
