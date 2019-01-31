package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl MemberService;
	
	@RequestMapping(value="/login/loginForm")
	public ModelAndView login(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("로그인폼 ");
		modelAndView.setViewName("/login/loginForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/login/signUpForm")
	public ModelAndView signUpForm(HttpServletRequest request, ModelAndView modelAndView) {
		System.err.println("회원가입폼");
		modelAndView.setViewName("/login/signUpForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/login/write")
	public ModelAndView loginWrite(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("로그인정보전달");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = MemberService.loginMember(id, password);
		
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", id);
			session.setAttribute("memberName", name);
			modelAndView.setViewName("../main/index.jsp");
		}else {
			modelAndView.setViewName("/login/loginForm.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/login/checkId")
	@ResponseBody
	public ModelAndView checkUserId(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("아이디체크");
		String id = request.getParameter("ID");
		System.out.println(id);
		boolean result = MemberService.isExistId(id);
		modelAndView.addObject("result",result);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}
	
//	@RequestMapping(value="/login/checkId")
//	@ResponseBody
//	public boolean checkUserId(HttpServletRequest request) {
//		System.out.println("아이디체크2222");
//		String id = request.getParameter("ID");
//		System.out.println(id);
//		boolean result = MemberService.isExistId(id);
//		return result;
//	}
	
	
}
