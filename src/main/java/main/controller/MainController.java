package main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping(value="/main/index")
	public ModelAndView index(ModelAndView modelAndView) {
		System.out.println("메인화면 시작111111 ");
		modelAndView.setViewName("redirect:/main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView modelAndView) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		modelAndView.setViewName("redirect:../main/index.jsp");
		return modelAndView;
	}
}
