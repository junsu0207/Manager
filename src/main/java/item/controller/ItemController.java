package item.controller;

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
import item.bean.ItemDTO;

@Controller
public class ItemController {
	
	
	@Autowired
	private ItemServiceImpl itemService;
	
	public String json(Map<String, Object> map){
		String json = "";
		try {
			json = new ObjectMapper().writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return json;
	}
	
	@RequestMapping(value="/item/itemList")
	public ModelAndView itemList(HttpServletRequest request, ModelAndView modelAndView) {
		List<CodeMngDTO> categoryCode = itemService.mainCategoryCode();
		modelAndView.setViewName("/main/index.jsp?req=itemList");
		modelAndView.addObject("categoryCode", categoryCode);
		return modelAndView;
	}
	
	@RequestMapping(value="/item/firstCategory", produces="application/text; charset=utf8")
	@ResponseBody
	public String firstCategory(HttpServletRequest request, CodeMngDTO codeMngDTO){
		Map<String, Object> map = new HashMap<String, Object>();
		String code = request.getParameter("code");
		System.out.println("code =====" + code);
		List<CodeMngDTO> result = itemService.firstCategory(code);
		map.put("result", result);
		return json(map);
	}
	
	@RequestMapping(value="/item/viewList", produces="application/text; charset=utf8")
	@ResponseBody
	public String itemList(HttpServletRequest request){
		System.out.println("itemList");
		Map<String, Object> map = new HashMap<String, Object>();
		String itemclscd = request.getParameter("itemclscd");
		System.out.println("itemclscd ==== "+itemclscd);
		List<ItemDTO> result = itemService.itemList(itemclscd);
		map.put("result", result);
		return json(map);
	}
	
	@RequestMapping(value="/item/detailList", produces="application/text; charset=utf8")
	@ResponseBody
	public String itemDetailView(HttpServletRequest request, ItemDTO itemDTO){
		System.out.println("itemDetailView");
		Map<String, Object> map = new HashMap<String, Object>();
		String itemcd = request.getParameter("itemcd");
		itemDTO = itemService.detailView(itemcd);
		System.out.println("itemcd ==== "+itemcd);
		map.put("result", itemDTO);
		return json(map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
