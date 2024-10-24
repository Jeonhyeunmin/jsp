package study2.database;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study2/database/DbUpdateOk")
public class DbUpdateOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = request.getParameter("age") == null || request.getParameter("age").equals("") ? 0 : Integer.parseInt(request.getParameter("age"));
		int idx = request.getParameter("idx") == null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		
		DbTestDAO dao = new DbTestDAO();
		DbTestVO vo = new DbTestVO();
		
		vo.setIdx(idx);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		
		int res = dao.setDbUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원 정보수정이 완료되었습니다.");
			request.setAttribute("url", "/study/database/DbList");
		}
		else {
			request.setAttribute("message", "회원 수정에 실패하였습니다.");
			request.setAttribute("url", "/study2/database/DbSearch?idx=${vo.idx}");
		}
		
		String viewPage = "/include/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
