package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
//		int goodCnt = (request.getParameter("goodCnt")==null || request.getParameter("goodCnt").equals("")) ? 1 : Integer.parseInt(request.getParameter("goodCnt"));
		
		BoardDAO dao = new BoardDAO();
		
//		좋아요 수 증가 처리(중복불가)
		HttpSession session = request.getSession();
		ArrayList<String> contentGood = (ArrayList<String>)session.getAttribute("sContentGood");
		
		if(contentGood == null) {
			contentGood = new ArrayList<String>();
		}
		String tempContentGood = "board" + idx;
		int res = 0;
		if(!contentGood.contains(tempContentGood)) {
			res = dao.setBoardGoodCheck(idx);
			contentGood.add(tempContentGood);
		}
		session.setAttribute("sContentGood", contentGood);
		
		
//		좋아요 수 증가 처리(중복가능)
//		int res = dao.setBoardGoodCheck(idx, goodCnt);
		
		response.getWriter().write(res+"");
	}

}
