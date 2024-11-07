package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload2Okommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFilName1 = multipartRequest.getOriginalFileName("fName1");
		String originalFilName2 = multipartRequest.getOriginalFileName("fName2");
		String originalFilName3 = multipartRequest.getOriginalFileName("fName3");
		String filesysttemName1 = multipartRequest.getFilesystemName("fName1");
		String filesysttemName2 = multipartRequest.getFilesystemName("fName2");
		String filesysttemName3 = multipartRequest.getFilesystemName("fName3");
		
		System.out.println("원본 파일명 : " + originalFilName1);
		System.out.println("원본 파일명 : " + originalFilName2);
		System.out.println("원본 파일명 : " + originalFilName3);
		System.out.println("서버에 저장된 파일명 : " + filesysttemName1);
		System.out.println("서버에 저장된 파일명 : " + filesysttemName2);
		System.out.println("서버에 저장된 파일명 : " + filesysttemName3);
		System.out.println("서버에 저장된 파일경로 : " + realPath);
		
		String nickName = request.getParameter("nickName");
		nickName = multipartRequest.getParameter("nickName");
		System.out.println(nickName);
		
		if(originalFilName1 != null && !originalFilName1.equals("") && originalFilName2 != null && !originalFilName2.equals("") && originalFilName3 != null && !originalFilName3.equals("")) {
			request.setAttribute("message", "파일 전송 완료");
		}
		else {
			request.setAttribute("message", "파일전송실패");
		}
				
		request.setAttribute("url", "FileUpload2.st");
	}
}
