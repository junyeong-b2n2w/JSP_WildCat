package com.wild.action.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.action.Action;
import com.wild.dto.MenuVO;
import com.wild.service.MenuService;

public class MainMenuAction implements Action {

private MenuService menuService;
	
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "";
		
		
		
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(menuList);
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println(jsonData);
			out.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			url=null;
		}
		
		return url;
	}
}
