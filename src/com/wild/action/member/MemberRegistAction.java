package com.wild.action.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.action.Action;
import com.wild.dto.MemberVO;
import com.wild.service.MemberService;
import com.wild.utils.ExceptionLoggerHelper;

public class MemberRegistAction implements Action {
   
   private MemberService memberService;

   public void setMemberService(MemberService memberService) {
      this.memberService = memberService;
   }

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      String url = "";
      
      MemberVO member = new MemberVO();
      
      String id = request.getParameter("id").trim();
      String pwd = request.getParameter("pwd").trim();
      String name = request.getParameter("name").trim();
      String email = request.getParameter("email").trim();
      
      String phone = "";
      
      for(String data : request.getParameterValues("phone")) {
         phone += data;
      }
      
      member.setId(id);
      member.setPwd(pwd);
      member.setName(name);
      member.setEmail(email);
      member.setPhone(phone);

      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      
      try {
//          throw new SQLException("테스트");
    	 memberService.regist(member);
         
         out.println("<script>");
         out.println("alert('내 동료가 된걸 환영한다냥.');");
         out.println("location.href='" + request.getContextPath() + "/common/loginForm.do';");
         out.println("</script>");
         

      }catch (SQLException e) {
         e.printStackTrace();
         ExceptionLoggerHelper.write(request, e, memberService);
         out.println("<script>");
         out.println("alert('내 동료가 되지 못했다냥 ,,');");
         out.println("history.go(-1);");
         out.println("</script>");
      } finally {
         if(out != null) out.close();
      }
      
      return url;
   }

}