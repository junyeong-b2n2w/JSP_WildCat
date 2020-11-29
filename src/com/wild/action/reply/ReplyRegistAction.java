package com.wild.action.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.action.Action;
import com.wild.dao.ReplyDAO;
import com.wild.request.PageMaker;
import com.wild.request.RegistReplyRequest;
import com.wild.request.SearchCriteria;
import com.wild.service.ReplyService;

public class ReplyRegistAction implements Action {

	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService= replyService;
	}
	
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO=replyDAO;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="";
		
		ObjectMapper mapper=new ObjectMapper();
		
		RegistReplyRequest replyReq 
		= mapper.readValue(request.getReader(), RegistReplyRequest.class);
		
		
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try {
			replyService.registReply(replyReq.toReplyVO());
			
			System.out.println(replyReq);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(new SearchCriteria());
			pageMaker.setTotalCount(replyDAO.countReply(replyReq.toReplyVO().getBno()));	
			
			int realEndPage = pageMaker.getRealEndPage();				
			out.println(realEndPage);
			
		} catch (SQLException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();					
		}finally {
			if(out!=null)out.close();
		}	
		
		return url;
	}

}