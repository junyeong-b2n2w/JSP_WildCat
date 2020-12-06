package com.wild.action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.action.Action;
import com.wild.dto.BoardVO;
import com.wild.request.SearchCriteria;
import com.wild.service.BoardService;

public class BoardNewAction implements Action{


	private BoardService boardService;// = new BoardServiceImpl.getInstance();
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		

		String gb = request.getParameter("gb");
		
		
		
		try {
			List<BoardVO> hotList =  boardService.selectNewBoard(gb);
			
			ObjectMapper mapper = new ObjectMapper();
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(mapper.writeValueAsString(hotList));
			out.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			url=null;
		}
		
		
		return url;
	}
}
