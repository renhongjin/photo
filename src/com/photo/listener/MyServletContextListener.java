package com.photo.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.photo.utils.LocalConfig;

public class MyServletContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//全局的静态资源访问路径前缀
		ServletContext sc =  sce.getServletContext();
		String imagePath = LocalConfig.readFromFileToMap().get("imgServer");
		sc.setAttribute("PATH", sc.getContextPath());
		sc.setAttribute("imgPath",imagePath);
	}

}
