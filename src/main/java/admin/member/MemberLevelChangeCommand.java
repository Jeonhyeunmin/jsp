package admin.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import member.MemberDAO;

public class MemberLevelChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")== null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
		int level = request.getParameter("level")== null || request.getParameter("level").equals("") ? 0 : Integer.parseInt(request.getParameter("level"));

		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberLevelChange(idx, level);
		
		response.getWriter().write(res + "");
	}
}
