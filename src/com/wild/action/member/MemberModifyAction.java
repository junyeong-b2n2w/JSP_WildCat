package com.wild.action.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.wild.action.Action;
import com.wild.dto.MemberVO;
import com.wild.exception.NotMultipartFormDataException;
import com.wild.request.MemberModifyRequest;
import com.wild.service.MemberService;
import com.wild.utils.ExceptionLoggerHelper;
import com.wild.utils.GetUploadPath;
import com.wild.utils.MakeFileName;
import com.wild.utils.ServletFileUploadBuilder;

public class MemberModifyAction implements Action{

	private MemberService memberService;
	

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "redirect:/member/detail.do?id=";
		
		
	
		
		try {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String phone = "";   
			
	      for(String data : request.getParameterValues("phone")) {
	         phone += data;
	      }
		     
	      
	       System.out.println(id);
	       System.out.println(name);
	       System.out.println(pwd);
	       System.out.println(email);
	       System.out.println(phone);
		     
	        MemberVO memberModi = new MemberVO();
	        memberModi.setId(id);
	        memberModi.setPwd(pwd);
	        memberModi.setName(name);
	        memberModi.setEmail(email);
	        memberModi.setPhone(phone);
			
			
			
			
					
			memberService.modify(memberModi);
			
			//로그인 사용자 수정여부 확인
			HttpSession session = request.getSession();
			
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			
			if( memberModi.getId().equals(loginUser.getId())) {
				
				memberModi= memberService.getMember(memberModi.getId());
				session.setAttribute("loginUser", memberModi);
				
				url = "";
				
			
				
			}
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("window.opener.parent.location.reload();");
			out.println("</script>");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			ExceptionLoggerHelper.write(request, e, memberService);
			url = null;
		} catch (Exception e) {
			e.printStackTrace();
			url = null;
		}
		
		
		
		return url;
	}
	
	
}
