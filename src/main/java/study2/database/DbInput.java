package study2.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study2/database/DbInput")
public class DbInput extends HttpServlet{
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		
		String viewPage = "/WEB-INF/study2/database/dbInput.jsp";
		RequestDispatcher dispatcher = requset.getRequestDispatcher(viewPage);
		dispatcher.forward(requset, response);
	}
}
