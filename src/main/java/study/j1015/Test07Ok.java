package study.j1015;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test07Ok2")
public class Test07Ok extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		PrintWriter out = response.getWriter();
		
		System.out.println("아이디 : " + mid);
		System.out.println("비밀번호 : " + pwd);
		
		if(mid.equals("admin") && pwd.equals("1234")){
			out.println("<script>");
			out.println("location.href='/javaGroup/study/1015/test07Admin.jsp';");
			out.println("</script>");
		}
		else if(mid.equals("qwe123") && pwd.equals("1234")){
			out.println("<script>");
			out.println("location.href='/javaGroup/study/1015/test07Member.jsp';");
			out.println("</script>");
		}
		else{
			out.println("<script>");
			out.println("alert('아이디/비밀번호를 확인하시고 다시 로그인해주세요');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}