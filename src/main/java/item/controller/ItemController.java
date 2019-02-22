package item.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {
	
	@RequestMapping(value="/item/itemList")
	public ModelAndView itemList(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/main/index.jsp?req=itemList");
		return modelAndView;
	}
}
