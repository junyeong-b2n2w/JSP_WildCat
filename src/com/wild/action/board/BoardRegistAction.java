package com.wild.action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.request.RegistBoardRequest;
import com.wild.action.Action;
import com.wild.dto.BoardVO;
import com.wild.service.BoardService;

public class BoardRegistAction implements Action {
	
	private BoardService boardService;
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String url = "";
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String gb = request.getParameter("gb");
		String category = request.getParameter("category");
		
		
		
		BoardVO board = new RegistBoardRequest(title, content, writer,gb,category).toBoardVO();
		
				
		try {
			boardService.write(board);
		} catch (SQLException e) {
			e.printStackTrace();
			url=null;
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("location.href='list.do?gb="+gb+"';window.close();");
		out.println("</script>");
		out.close();
		
		return url;
	}

}
