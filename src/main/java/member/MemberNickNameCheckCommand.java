package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberNickNameCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		 
		 MemberVO vo = dao.getMemberNickNameCheck(nickName);
		 
		 if(vo.getNickName() == null) {
			 vo.setTempNickName(nickName);
		 }
		 request.setAttribute("vo", vo);
	}
}