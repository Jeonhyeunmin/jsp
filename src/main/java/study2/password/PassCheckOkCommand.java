package study2.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;
import study2.StudyInterface;

public class PassCheckOkCommand implements StudyInterface {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		int flag = request.getParameter("flag") == null ? 0 : Integer.parseInt(request.getParameter("flag"));
		String temp = "";
		
		int salt;
		int encPwd = 0;
		int decPwd = 0;
		String strEncPwd = "";
		
		if(flag == 1) {
			temp = "숫자 비밀번호";
		}
		else if(flag == 2) {
			temp = "문자 비밀번호";
		}
		else if(flag == 3) {
			temp = "문자 / 숫자 비밀번호";
		}
		
		System.out.println("원본자료 : ");
		System.out.println("flag : " + temp);
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		
		if(flag == 1) {
//			salt 키 : 0x1234ABCD
			salt = 0x1234ABCD;
			encPwd = Integer.parseInt(pwd) ^ salt;
			
			System.out.println("인코딩된 비밀번호 : " + encPwd);
			System.out.println("salt : " + salt);
			System.out.println("DB저장 : salt + 인코딩된 비밀번호 : " + salt + encPwd);
			System.out.println("----------------------------------------------");
			System.out.println("DB에 저장된 pwd를 불러와서 디코딩한다.");
			
			decPwd = encPwd ^ salt;
			System.out.println("디코딩된(복호화) 비밀번호 : " + decPwd);
		}
		else if(flag == 2) {
			
		}
		else if(flag == 3) {
			
		}
		else if(flag == 4) {
			SecurityUtil security = new SecurityUtil();
			strEncPwd = security.encryptSHA256(pwd);
		}
		
		request.setAttribute("encPwd", encPwd);
		request.setAttribute("pwd", strEncPwd);
		request.setAttribute("decPwd", decPwd);
		
	}

}
