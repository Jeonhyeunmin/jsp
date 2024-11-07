package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload1Okommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
			COS 라이브러리 - MultipartRequest(파일 업로드) / DefaultFileRenamePolicy(파일명 중복 방지를 위한 클래스 - 파일명1, 파일명2...)
			사용법 : MultipartRequest(저장소(request), 서버의 저장될 파일의 경로, 서버에 저장될 파일의 최대 용량, 코드변환방식, 기타옵션(파일명 중복방지 클래스))
		 	
		 	저장되는 서버 웹사이트의 절대 경로(/webapp) : getRealPath("/")
			ServletContext application = request.getServletContext();
			application.getRealPath("/");
			String _ = request.getServletContext().getRealPath("/");
		 */
		
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
//		파일 업로드 처리(객체 생성 시 자동 업로드)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
//		업로드된 파일의 정보를 추출시켜본다.
		String originalFilName = multipartRequest.getOriginalFileName("fName");
		String filesysttemName = multipartRequest.getFilesystemName("fName");
		
		System.out.println("원본 파일명 : " + originalFilName);
		System.out.println("서버에 저장된 파일명 : " + filesysttemName);
		System.out.println("서버에 저장된 파일경로 : " + realPath);
		
		String nickName = request.getParameter("nickName");
		nickName = multipartRequest.getParameter("nickName");
		System.out.println(nickName);
		
//		backEnd 파일 체크
		if(originalFilName != null && !originalFilName.equals("")) {
			request.setAttribute("message", "파일 전송 완료");
		}
		else {
			request.setAttribute("message", "파일전송실패");
		}
				
		request.setAttribute("url", "FileUpload1.st");
	}
}
