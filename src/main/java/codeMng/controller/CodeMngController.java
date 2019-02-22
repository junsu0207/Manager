package codeMng.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import codeMng.bean.CodeMngDTO;

@Controller
public class CodeMngController {
	@Autowired
	private CodeMngServiceImpl codeMngService;
	
	public String json(Map<String, Object> map) {
		String json = "";
		try {
			json = new ObjectMapper().writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return json;
	}
	
	@RequestMapping(value="/codeMng/codeList")
	public ModelAndView list(HttpServletRequest request,ModelAndView modelAndView) {
		List<CodeMngDTO> list = codeMngService.list();
		
		modelAndView.addObject("list",list);
		modelAndView.setViewName("/main/index.jsp?req=list");
		return modelAndView;
	}
	
//	@RequestMapping(value="/codeMng/codeDetail")
//	@ResponseBody
//	public ModelAndView detailView(HttpServletRequest request, ModelAndView modelAndView) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		String cdno = request.getParameter("cdno");
//		List<CodeMngDTO> result = codeMngService.detailList(cdno);
//		modelAndView.addObject("result", result);
//		return modelAndView;
//	}
	
//	@RequestMapping(value="/codeMng/codeDetail")
//	@ResponseBody
//	public List<CodeMngDTO> detailView(HttpServletRequest request, ModelAndView modelAndView) {
//		String cdno = request.getParameter("cdno");
//		List<CodeMngDTO> result = codeMngService.detailList(cdno);
//		return result;
//	}
	
	@RequestMapping(value="/codeMng/codeDetail", produces="application/text; charset=utf8")
	@ResponseBody
	public String detailView(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		String cdno = request.getParameter("cdno");
		List<CodeMngDTO> result = codeMngService.detailList(cdno);
		map.put("result",result);
		
		return json(map);
	}
	
	@RequestMapping(value="/codeMng/codeUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public String update(HttpServletRequest request, CodeMngDTO codeMngDTO) {
		Map<String,Object> map = new HashMap<String,Object>();
		int count = codeMngService.codeMngUpdate(codeMngDTO);
		String msg = "";
		if(count > 0) {
			msg = "업데이트 성공";
			map.put("result", true);
			map.put("msg", msg);
		}else {
			map.put("result", false);
		}
		return json(map);
	}
	
	@RequestMapping(value="/codeMng/codeInput", produces="application/text; charset=utf8")
	@ResponseBody
	public String insert(HttpServletRequest request, CodeMngDTO codeMngDTO) {
		Map<String,Object> map = new HashMap<String,Object>();
		int count = codeMngService.codeMngInsert(codeMngDTO);
		System.out.println("count === " + count);
		String msg = "";
		if(count > 0) {
			msg = "입력 성공";
			map.put("result", true);
			map.put("msg", msg);
		}else {
			map.put("result", false);
		}
		return json(map);
	}
	
	
	
	
	
}
