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
import com.wild.request.SearchCriteria;
import com.wild.service.IngreService;

public class RawIngreListAction implements Action{
	
	private IngreService ingreService;
	
	public void setIngreService(IngreService ingreService) {
		this.ingreService = ingreService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			
			List<IngreVO> ingreList = ingreService.selectIngreList();
			
			dataMap.put("results", ingreList);
			
			Map<String, String> pagination = new HashMap<String, String>();
			pagination.put("more", "true");
			dataMap.put("pagination", pagination);
					
			
			ObjectMapper mapper = new ObjectMapper();
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(mapper.writeValueAsString(dataMap));
			out.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			url=null;
		}
		
		
		
		return url;
	}

}
