package com.wild.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.action.Action;

public class BoardRegistFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="/board/regist";
		
		String gb = request.getParameter("gb");
		
		request.setAttribute("gb", gb);
		
		return url;
	}

}
