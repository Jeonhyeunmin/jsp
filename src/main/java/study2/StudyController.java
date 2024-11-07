package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax.AjaxIdCheck0Command;
import study2.ajax.AjaxIdCheck1Command;
import study2.ajax.AjaxPointCheckCommand;
import study2.password.PassCheckOkCommand;
import study2.pdstest.FileDeletecommand;
import study2.pdstest.FileDownloadcommand;
import study2.pdstest.FileUpload1Okommand;
import study2.pdstest.FileUpload2Okommand;
import study2.pdstest.FileUpload3Okommand;
import study2.pdstest.FileUpload4Command;
import study2.pdstest.javaFileDownloadcommand;


@WebServlet("*.st")
public class StudyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		
		String viewPage = "/WEB-INF";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
//		인증처리..(Spring에서는 aop의 개념)
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 999 : (int)session.getAttribute("sLevel");
		
		if(level > 4) {
			request.setAttribute("message", "로그인 후 사용하세요.");
			request.setAttribute("url", "/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(level == 1) {
			request.setAttribute("message", "정회원부터 사용가능합니다.");
			request.setAttribute("url", "/MemberMain.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PassCheckForm")) {
			viewPage += "/study2/password/passCheck.jsp";
		}
		else if(com.equals("/PassCheckOk")) {
			command = new PassCheckOkCommand();
			command.execute(request, response);
			viewPage += "/study2/password/passCheck.jsp";
		}
		else if(com.equals("/MemberJoin")) {
			viewPage += "/member/memberJoin.jsp";
		}
		else if(com.equals("/AjaxTest")) {
			viewPage += "/study2/ajax/ajaxTest.jsp";
		}
		else if(com.equals("/AjaxIdCheck0")) {
			command = new AjaxIdCheck0Command();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AjaxIdCheck1")) {
			command = new AjaxIdCheck1Command();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AjaxPointCheck")) {
			command = new AjaxPointCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileUpload")) {
			viewPage += "/study2/pdstest/fileUpload.jsp";
		}
		else if(com.equals("/FileUpload1")) {
			viewPage += "/study2/pdstest/fileUpload1.jsp";
		}
		else if(com.equals("/FileUpload1Ok")) {
			command = new FileUpload1Okommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload2")) {
			viewPage += "/study2/pdstest/fileUpload2.jsp";
		}
		else if(com.equals("/FileUpload2Ok")) {
			command = new FileUpload2Okommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload3")) {
			viewPage += "/study2/pdstest/fileUpload3.jsp";
		}
		else if(com.equals("/FileUpload3Ok")) {
			command = new FileUpload3Okommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload4")) {
			viewPage += "/study2/pdstest/fileUpload4.jsp";
		}
		else if(com.equals("/FileUpload4Ok")) {
			command = new FileUpload4Command();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileDownload")) {
			command = new FileDownloadcommand();
			command.execute(request, response);
			viewPage += "/study2/pdstest/fileDownload.jsp";
		}
		else if(com.equals("/FileDelete")) {
			command = new FileDeletecommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/JavaFileDownload")) {
			command = new javaFileDownloadcommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
