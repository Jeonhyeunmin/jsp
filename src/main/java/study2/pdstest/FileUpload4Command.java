package study2.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload4Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 30;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String ofName = "";
		String fsName = "";
		
		while(fileNames.hasMoreElements()) {
		 file = (String) fileNames.nextElement();
		 ofName += multipartRequest.getOriginalFileName(file) + "/";
		 fsName += multipartRequest.getFilesystemName(file) + "/";
		}
		ofName = ofName.substring(0, ofName.lastIndexOf("/"));
		fsName = fsName.substring(0, fsName.lastIndexOf("/"));
		
		System.out.println("원본 파일명 집합 : " + ofName);
		System.out.println("서버 파일명 집합 : " + fsName);
		
		if(!ofName .equals("")) {
			request.setAttribute("message", "파일이 업로드 되었습니다.");
		}
		else {
			request.setAttribute("message", "파일 업로드 실패");
		}
		request.setAttribute("url", "FileUpload4.st");
	}
}
