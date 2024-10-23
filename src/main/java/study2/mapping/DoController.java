package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/study2/mapping/list.do") //	directory
@WebServlet("*.do")	//	extension
public class DoController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
		
		request.setAttribute("msg", msg);
		
		DoInterface command = null;
		
		String viewPage = "/WEB-INF/study2/mapping/";
//		url = 주소창 / uri = 상세한 주소
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		System.out.println(com);
		
		if(com.equals("list")) {
			command = new DoListCommand();
			command.execute(request, response);
			viewPage += "doList.jsp";
		}
		else if(com.equals("search")) {
			command = new DoSearchCommand();
			command.execute(request, response);
			viewPage += "doSearch.jsp";
		}
		else if(com.equals("input")) {
			command = new DoInputCommand();
			command.execute(request, response);
			viewPage += "doInput.jsp";
		}
		else if(com.equals("inputOk")) {
			command = new DoInputOkCommand();
			command.execute(request, response);
			viewPage += "test2.jsp";
		}
		else if(com.equals("update")) {
			command = new DoUpdateCommand();
			command.execute(request, response);
			viewPage += "doUpdate.jsp";
		}
		else if(com.equals("updateOk")) {
			command = new DoUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("delete")) {
			command = new DoDeleteCommand();
			command.execute(request, response);
			viewPage += "doDelete.jsp";
		}
		else if(com.equals("deleteOk")) {
			command = new DoDeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
