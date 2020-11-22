package com.wild.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.action.Action;
import com.wild.dto.MemberVO;
import com.wild.service.MemberService;
import com.wild.utils.ExceptionLoggerHelper;

public class MemberModifyFormAction implements Action{
	
	private MemberService memberService;
	

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/member/modify";
		
		String id = request.getParameter("id");
		
		
		MemberVO member = null;
		
		try {
			member = memberService.getMember(id);
		} catch (Exception e) {
			e.printStackTrace();
			ExceptionLoggerHelper.write(request, e, memberService);
		}
		
		request.setAttribute("member", member);
		
		
		return url;
	}

}
