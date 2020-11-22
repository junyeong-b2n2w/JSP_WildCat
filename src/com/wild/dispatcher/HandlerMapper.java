package com.wild.dispatcher;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import com.wild.action.Action;
import com.wild.action.ApplicationContext;

public class HandlerMapper {

	private Map<String, Action> commandMap = new HashMap<String, Action>();
	
	public HandlerMapper() throws ClassNotFoundException, InstantiationException, IllegalAccessException,
								Exception{
		String path = "com/wild/properties/url";
		
		ResourceBundle rbHome = ResourceBundle.getBundle(path);
		
		Set<String> actionSetHome = rbHome.keySet();
		
		Iterator<String> it = actionSetHome.iterator();
		
		while (it.hasNext()) {
			String command = it.next();
			
			String actionClassName = rbHome.getString(command);
			
			System.out.println(actionClassName);
			
			try {
				Class<?> actionClass = Class.forName(actionClassName);
				Action commandAction = (Action)actionClass.newInstance();
				
				System.out.println(commandAction);
				
				//의존성 확인 및 조립
				Method[] methods = actionClass.getMethods();
				
				for (Method method : methods) {
					if (method.getName().contains("set")) {
						String paramType = method.getParameterTypes()[0].getName();
						
						//파라미터 조립
						paramType = paramType.substring(paramType.lastIndexOf(".")+1);
						paramType = (paramType.charAt(0) + "").toLowerCase() + paramType.substring(1);
						
						try {
							method.invoke(commandAction, ApplicationContext.getApplicationContext().get(paramType));
						} catch (Exception e) {
							e.printStackTrace();
							throw e;
						}

						
						
					}
					
				}
				
				commandMap.put(command, commandAction); // mapper에 추가
				
				
			}catch (ClassNotFoundException e) {
				System.out.println("[HandlerMapper]" + actionClassName + "이 존재하지 않습니다");
			}catch (InstantiationException e) {
				System.out.println("[HandlerMapper]" + actionClassName + "인스턴스를 생성할수 없습니다");
			}catch (IllegalAccessException e) {
				e.printStackTrace();
				throw e;
			}
			
		}
		
	}
	
	
	public Action getAction(String url) {
		Action action = commandMap.get(url);
		return action;
	}
	
}
