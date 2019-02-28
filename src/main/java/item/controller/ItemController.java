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
	
	@RequestMapping(value="/item/itemView", produces="application/text; charset=utf8")
	@ResponseBody
	public String itemDetailView(HttpServletRequest request, ItemDTO itemDTO){
		System.out.println("itemDetailView");
		Map<String, Object> map = new HashMap<String, Object>();
		String itemcd = request.getParameter("itemcd");
		itemDTO = itemService.detailView(itemcd);
//		System.out.println(itemDTO.toString());
		System.out.println("itemcd ==== "+itemcd);
		map.put("result", itemDTO);
		return json(map);
	}
	
	@RequestMapping(value="/item/selectList", produces="application/text; charset=utf8")
	@ResponseBody
	public String selectList(HttpServletRequest request, ItemDTO itemDTO){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ItemDTO> result = itemService.selectList();
		map.put("result", result);
		return json(map);
	}
	
	@RequestMapping(value="/item/madename", produces="application/text; charset=utf8")
	@ResponseBody
	public String madenameList(HttpServletRequest request, ItemDTO itemDTO){
		Map<String, Object> map = new HashMap<String, Object>();
		List<CodeMngDTO> madename = itemService.madenameList();
		map.put("result", madename);
		return json(map);
	}
	
	@RequestMapping(value="/item/unitcdname", produces="application/text; charset=utf8")
	@ResponseBody
	public String unitcdname(HttpServletRequest request, ItemDTO itemDTO){
		Map<String, Object> map = new HashMap<String, Object>();
		List<CodeMngDTO> unitcdname = itemService.unitcdnameList();
		map.put("result", unitcdname);
		return json(map);
	}
	
	@RequestMapping(value="/item/itemUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public String itemUpdate(HttpServletRequest request, ItemDTO itemDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int count = itemService.itemUpdate(itemDTO);
		System.out.println(itemDTO.toString());
		String msg = "";
		if(count > 0) {
			msg = "성공";
			map.put("msg", msg);
			map.put("result", true);
		}else {
			msg = "실패";
			map.put("msg", msg);
			map.put("result", false);
		}
		return json(map);
	}
	
	@RequestMapping(value="/item/itemInput", produces="application/text; charset=utf8")
	@ResponseBody
	public String itemInput(HttpServletRequest request, ItemDTO itemDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int count = itemService.itemInput(itemDTO);
		System.out.println(itemDTO.toString());
		String msg = "";
		if(count > 0) {
			msg = "성공";
			map.put("msg", msg);
			map.put("result", true);
		}else {
			msg = "실패";
			map.put("msg", msg);
			map.put("result", false);
		}
		return json(map);
	}
	
	
	
	
	
	
	
	
	
	
}
