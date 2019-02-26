package member.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import codeMng.bean.CodeMngDTO;
import member.bean.MemberDTO;
import member.bean.MemberDetailDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping(value="/member/loginForm")
	public ModelAndView login(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("로그인폼 ");
		modelAndView.setViewName("/main/index.jsp?req=loginForm");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/signUpForm")
	public ModelAndView signUpForm(HttpServletRequest request, ModelAndView modelAndView) {
		System.err.println("회원가입폼");
		modelAndView.setViewName("/main/index.jsp?req=signUpForm");
		return modelAndView;
	}
	
	@RequestMapping(value="/member/write")
	public ModelAndView loginWrite(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("로그인정보전달");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = memberService.loginMember(id, password);
		System.out.println("name="+name);
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", id);
			session.setAttribute("memberName", name);
			modelAndView.setViewName("redirect:../main/index.jsp");
		}else {
			modelAndView.setViewName("/main/index.jsp?req=loginForm");
		}
		
		return modelAndView;
	}
	
//	@RequestMapping(value="/member/checkId")
//	@ResponseBody
//	public ModelAndView checkId(HttpServletRequest request, ModelAndView modelAndView) {
//		System.out.println("아이디체크");
//		String id = request.getParameter("ID");
//		boolean result = memberService.isExistId(id);
//		modelAndView.addObject("result",result);
//		modelAndView.setViewName("jsonView");
//		return modelAndView;
//	}
	
	@RequestMapping(value="/member/checkId")
	@ResponseBody
	public boolean checkUserId(HttpServletRequest request) {
		System.out.println("아이디체크2222");
		String id = request.getParameter("ID");
		System.out.println(id);
		boolean result = memberService.isExistId(id);
		return result;
	}
	
	@RequestMapping(value="/member/signUpWrite")
	public ModelAndView SignUp(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("회원가입test");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setPassword(password);
		memberDTO.setName(name);
//		String temp = new SimpleDateFormat("yy/MM/hh").format(new Date());
//		System.out.println(temp);
		int result = memberService.userSignUp(memberDTO);
		System.out.println(result);
//		화면이동 바로
//		if(result > 0) {
//			modelAndView.setViewName("/member/detail.jsp");
//			modelAndView.addObject("id", id);
//			modelAndView.addObject("password", password);
//			modelAndView.addObject("name", name);
//		}else {
//			modelAndView.setViewName("/member/signUpForm.jsp");
//		}
		modelAndView.setViewName("/member/signUpWrite.jsp");
		modelAndView.addObject("result", result);
		modelAndView.addObject("id", id);
		return modelAndView;
	}
	
	@RequestMapping(value="/member/detail")
	public ModelAndView detail(HttpServletRequest request, ModelAndView modelAndView) {
		System.err.println("디테일");
		String id = request.getParameter("id");
		System.out.println("id = "  +id);
		List<CodeMngDTO> codeList = memberService.codeSelect();
		modelAndView.setViewName("/main/index.jsp?req=detail");
		modelAndView.addObject("codeList", codeList);
		modelAndView.addObject("id", id);
		return modelAndView;
	}
	
	@RequestMapping(value="/member/detailWrite")
	public ModelAndView detailWrite(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("디테일 입력확인");
		String id = request.getParameter("id");
		String relcd = request.getParameter("relation");
		int addrcd = Integer.parseInt(request.getParameter("zipCode"));
		String addrName = request.getParameter("address");
		String phone = request.getParameter("phone");
		String homeTel = request.getParameter("homeTel");
		String insuser = "신규";
		String useyn = request.getParameter("useyn");
		String name = request.getParameter("delivName");
		
		System.out.println(name);
		
		MemberDetailDTO memberDetailDTO = new MemberDetailDTO();
		memberDetailDTO.setId(id);
		memberDetailDTO.setRelcd(relcd);
		memberDetailDTO.setAddrcd(addrcd);
		memberDetailDTO.setAddrname(addrName);
		memberDetailDTO.setMobileTelNo(phone);
		memberDetailDTO.setHomeTelNo(homeTel);
		memberDetailDTO.setInsuser(insuser);
		memberDetailDTO.setUseyn(useyn);
		memberDetailDTO.setDelivName(name);
		
		System.out.println(memberDetailDTO.toString());
		
		int result = memberService.detailUser(memberDetailDTO);
		System.out.println("result"+result);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/member/detailWrite.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/detailUpdate")
	public ModelAndView detailUpdate(HttpServletRequest request, ModelAndView modelAndView) {
		String id = request.getParameter("id");
		System.out.println("디테일 업데이트");
		System.out.println("id="+id);
		List<MemberDetailDTO> list = memberService.list(id);
		List<CodeMngDTO> codeList = memberService.codeSelect();
		modelAndView.addObject("list",list);
		modelAndView.addObject("codeList",codeList);
		modelAndView.setViewName("/main/index.jsp?req=detailUpdate");
		return modelAndView;
	}
	
	
	
	
	
}
