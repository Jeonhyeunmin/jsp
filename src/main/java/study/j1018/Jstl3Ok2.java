package study.j1018;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/1018/Jstl3Ok2")
public class Jstl3Ok2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		
		MemberVO vo = null;
		
		vo = new MemberVO();
		vo.setName("홍길동");
		vo.setAge(25);
		vo.setGender("남자");
		vo.setJob("학생");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("김말숙");
		vo.setAge(31);
		vo.setGender("여자");
		vo.setJob("주부");
		vo.setAddress("청주");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("이기자");
		vo.setAge(40);
		vo.setGender("남자");
		vo.setJob("회사원");
		vo.setAddress("제주");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("오하늘");
		vo.setAge(20);
		vo.setGender("여자");
		vo.setJob("자영업");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo = new MemberVO();
		vo.setName("강감찬");
		vo.setAge(50);
		vo.setGender("남자");
		vo.setJob("군인");
		vo.setAddress("인천");
		vos.add(vo);
		
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/1018_JSTL/jstl3_res2.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
