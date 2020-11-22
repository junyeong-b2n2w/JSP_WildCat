package com.wild.action.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wild.action.Action;
import com.wild.dto.MenuVO;
import com.wild.service.MenuService;

public class IndexAction implements Action {
	
	private MenuService menuService;
	
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "/common/indexPage";
		
		String mCode = request.getParameter("mCode");
		
		if(mCode == null) mCode = "M000000";
		
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();
			MenuVO menu = menuService.getMenuByMcode(mCode);
			
			request.setAttribute("menuList", menuList);
			request.setAttribute("menu", menu);
					
		} catch (Exception e) {
			e.printStackTrace();
			url=null;
		}
		
		return url;
	}
}
