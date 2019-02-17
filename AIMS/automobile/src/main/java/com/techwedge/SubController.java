package com.techwedge;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.techwedge.service.SubService;

public class SubController {

	public ModelAndView sub(HttpServletRequest request,HttpServletResponse response)
	{
		int i=Integer.parseInt(request.getParameter("m1"));
		int j=Integer.parseInt(request.getParameter("m2"));
		
		SubService ss=new SubService();
		int k=ss.sub(i, j);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("disp1.jsp");
		mv.addObject("res",k);
		
		return mv;
	}
}
