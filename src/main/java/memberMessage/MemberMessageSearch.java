package memberMessage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberMessageSearch implements MemberMessageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msgFlag = request.getParameter("msgFlag") == null ? "" : request.getParameter("msgFlag");
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		MemberMessageDAO dao = new MemberMessageDAO();
		
		ArrayList<MemberMessageVO> vos = dao.getMemberMessageSearch(msgFlag, mid);
	}
}
