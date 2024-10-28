package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.password.PassCheckOkCommand;


@WebServlet("*.st")
public class StudyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		
		String viewPage = "/WEB-INF";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/PassCheckForm")) {
			viewPage += "/study2/password/passCheck.jsp";
		}
		if(com.equals("/PassCheckOk")) {
			command = new PassCheckOkCommand();
			command.execute(request, response);
			viewPage += "/study2/password/passCheck.jsp";
		}
		if(com.equals("/MemberJoin")) {
			viewPage += "/member/memberJoin.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
