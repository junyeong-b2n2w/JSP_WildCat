package com.wild.action.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wild.action.Action;

public class LogoutAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "redirect:/";
		
		HttpSession sesson = request.getSession();
		sesson.invalidate();
		
		return url;
	}

}
