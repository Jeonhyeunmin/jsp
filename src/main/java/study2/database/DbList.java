package study2.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/database/DbList")
public class DbList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		String name = requset.getParameter("name") == null ? "" : requset.getParameter("name");
		
		DbTestDAO dao = new DbTestDAO();
		
//		DbTestVO vo = dao.getDbTestSearch(name);
		ArrayList<DbTestVO> vos = dao.getDbTestList(name);
		
//		requset.setAttribute("vo", vo);
		requset.setAttribute("vos", vos);
		
		String viewPage = "/WEB-INF/study2/database/dbList.jsp";
		
		RequestDispatcher dispatcher = requset.getRequestDispatcher(viewPage);
		dispatcher.forward(requset, response);
	}
}
