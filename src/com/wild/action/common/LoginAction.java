package com.wild.action.common;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.action.Action;
import com.wild.exception.InvalidPasswordException;
import com.wild.exception.NotFoundIDException;
import com.wild.service.MemberService;

public class LoginAction implements Action {
	private MemberService memberService;
	

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}



	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "redirect:/index.do";
		
		//로그인처리
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	
		try {
			memberService.login(id, pwd, request.getSession());
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (NotFoundIDException | InvalidPasswordException e) {
			//e.printStackTrace();
			url="redirect:/common/loginForm.do";
			request.getSession().setAttribute("msg", e.getMessage());
		}
		
		return url;
	}
	

}
