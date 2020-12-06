package com.wild.action.raw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.action.Action;
import com.wild.dto.IngreVO;
import com.wild.service.IngreService;

public class RawIngrOneAction implements Action{
private IngreService ingreService;
	
	public void setIngreService(IngreService ingreService) {
		this.ingreService = ingreService;
	}
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		
		try {
			int ingNo = Integer.parseInt(request.getParameter("ingNo"));
			IngreVO ingre = ingreService.selectIngreByIngNo(ingNo);
			
			ObjectMapper mapper = new ObjectMapper();
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("["+mapper.writeValueAsString(ingre)+"]");
			out.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			url=null;
		}
		
		
		
		return url;
	}
}
