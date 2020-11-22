package com.wild.action.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wild.action.Action;
import com.wild.dto.MemberVO;
import com.wild.service.MemberService;
import com.wild.utils.ExceptionLoggerHelper;

public class MemberDetailAction implements Action{
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="/member/detail";
		
//		HttpSession session = request.getSession();
//		
//		MemberVO member = session.getAttribute("loginUser");
//		
//		String id = member.getId();
//		
//		
//		
//		MemberVO member = null;
//		try {
//			member = memberService.getMember(id);
//			request.getSession().setAttribute("member", member);
//		} catch (SQLException e) {
//			e.printStackTrace();
//			ExceptionLoggerHelper.write(request, e, memberService);
//			url = null;
//		}
		
		
		return url;
	}
}
