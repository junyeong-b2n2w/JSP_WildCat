package com.wild.action.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.action.Action;
import com.wild.dto.ReplyVO;
import com.wild.request.ModifyReplyRequset;
import com.wild.service.ReplyService;

public class ReplyModifyAction implements Action {

	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		ObjectMapper mapper = new ObjectMapper();
		
		ModifyReplyRequset replyReq 
			= mapper.readValue(request.getReader(), ModifyReplyRequset.class);
		
		System.out.println(replyReq);
		
		ReplyVO reply = replyReq.toReplyVO();
		
		System.out.println(reply);
		
		try {
			replyService.modifyReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
				
		
		return url;
	}

}
