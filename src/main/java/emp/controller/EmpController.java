package emp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import emp.bean.EmpDTO;

@Controller
public class EmpController {
	
	@Autowired
	private EmpServiceImpl empService;
	
	@RequestMapping(value="/emp/empList")
	public ModelAndView empList(HttpServletRequest requset, ModelAndView modelAndView) {
		System.out.println("emp리스트");
		List<EmpDTO> list = empService.list();
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("/main/index.jsp?req=empList");
		return modelAndView;
	}
}
