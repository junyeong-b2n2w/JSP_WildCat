package com.wild.action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.action.Action;
import com.wild.service.BoardService;

public class BoardRemoveAction implements Action {
	
	private BoardService boardService;
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String url="";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
			
		
		try {
			boardService.remove(bno);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다');");
			out.println("location.href = '"+request.getContextPath()+"/board/list.do'");
			out.println("</script>");	
			out.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			url=null;			
		}
		
		return url;
	}

}
