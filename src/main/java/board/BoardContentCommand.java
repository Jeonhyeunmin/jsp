package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
    int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));
      
    BoardDAO dao = new BoardDAO();
      
    HttpSession session = request.getSession();
    String idxStr = idx+"";
    String sIdx = session.getAttribute("sIdx") == null ? "" : session.getAttribute("sIdx").toString();
    
    if(sIdx.indexOf(idxStr) == -1) {
      //글조회수 1씩 증가하기
      dao.setContentReadNumPlus(idx);
      sIdx += idxStr + "/";
      session.setAttribute("sIdx", sIdx);
    }
    
//      이전글 / 다음 글 검색하기
    BoardVO preVo = dao.getPreNextSearch(idx, "pre");
    BoardVO nextVo = dao.getPreNextSearch(idx, "next");
    request.setAttribute("preVo", preVo);
    request.setAttribute("nextVo", nextVo);
    
    BoardVO vo = dao.getBoardContent(idx);
    
    request.setAttribute("vo", vo);
    request.setAttribute("pag", pag);
    
//      댓글처리
    ArrayList<BoardReplyVO> replyVos = dao.getBoardReply(idx);
    
    request.setAttribute("replyVos", replyVos);
    
      
  }

}
