package study2.mapping;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/mapping/Test1Ok")
public class Test1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = (request.getParameter("su1") == null || request.getParameter("su1").equals("")) ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = (request.getParameter("su2") == null || request.getParameter("su2").equals("")) ? 0 : Integer.parseInt(request.getParameter("su2"));
		String flag = request.getParameter("flag") /* == null ? "" : request.getParameter("flag") */;
		
		if(flag.equals("1")) {
			int hap = su1 + su2;
			int cha = su1 - su2;
			request.setAttribute("hap", hap);
			request.setAttribute("cha", cha);
		}
		else if(flag.equals("3")) {
			int gop = su1 * su2;
			int mok = su1 / su2;
			request.setAttribute("gop", gop);
			request.setAttribute("mok", mok);
		}
		else if(flag.equals("4")) {
//			Date today = new Date();	// Web Oct....~
//			LocalDate today = LocalDate.now();	//	날짜만
			
			LocalDateTime today = LocalDateTime.now(); //	2024-10-15T10:11...~
			String time = today.toString().substring(0,19).replace("T", " / ");
			
			request.setAttribute("msg", time);
			request.setAttribute("today", today);	//	jsp에서 jstl을 이요한 날짜 / 시간 분리를 위한 준비
		}
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
