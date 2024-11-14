package memberMessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberMessageDeleteCommand implements MemberMessageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		MemberMessageDAO dao = new MemberMessageDAO();
		
		int res = dao.MemberMessageDelete(idx);
		
		response.getWriter().write(res + "");
	}
}
