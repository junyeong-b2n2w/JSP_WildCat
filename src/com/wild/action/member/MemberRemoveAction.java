package com.wild.action.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.action.Action;
import com.wild.dto.MemberVO;
import com.wild.service.MemberService;
import com.wild.utils.GetUploadPath;

public class MemberRemoveAction implements Action{

	   
	private MemberService memberService;

    public void setMemberService(MemberService memberService) {
       this.memberService = memberService;
    }

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="";
		
		String id = request.getParameter("id");
		
		MemberVO member;
		
		try {
			member = memberService.getMember(id);
			
			//삭제되는 회원이 로그인회원인경우 로그아웃해야함 
			MemberVO loginUser = (MemberVO)request.getSession().getAttribute("loginUser");
			if (id.equals(  loginUser.getId() ) ) {
				request.getSession().invalidate();
			}
			
			request.setAttribute("member", member);
			memberService.remove(id);
		} catch (SQLException e) {

			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("window.opener.parent.location.href='"+request.getContextPath()+"/';");
		out.println("</script>");
		
		
		
		return url;
	}
	
}
