package codeMng.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import codeMng.bean.CodeMngDTO;

@Controller
public class CodeMngController {
	@Autowired
	private CodeMngServiceImpl codeMngService;
	
	@RequestMapping(value="/codeMng/codeList")
	public ModelAndView list(HttpServletRequest request,ModelAndView modelAndView) {
		List<CodeMngDTO> list = codeMngService.list();
		
		modelAndView.addObject("list",list);
		modelAndView.setViewName("/codeMng/codeList.jsp");
		return modelAndView;
	}
}
