package com.wild.action.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.action.Action;
import com.wild.dao.ReplyDAO;
import com.wild.request.DeleteReplyRequest;
import com.wild.request.PageMaker;
import com.wild.request.SearchCriteria;
import com.wild.service.ReplyService;

public class ReplyRemoveAction implements Action {

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

		String url = "";
		
		ObjectMapper mapper = new ObjectMapper();
		DeleteReplyRequest removeReq
			= mapper.readValue(request.getReader(), DeleteReplyRequest.class);
		
		try {
			replyService.removeReply(removeReq.getRno());
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(new SearchCriteria());
			pageMaker.setTotalCount(replyDAO.countReply(removeReq.getBno()));
			
			int realEndPage = pageMaker.getRealEndPage();
			
			int page = removeReq.getPage();
			if(page>realEndPage) {page=realEndPage;}
			
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print(page);
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		
		return url;
	}

}
