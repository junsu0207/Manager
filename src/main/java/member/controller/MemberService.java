package member.controller;

import member.bean.MemberDTO;

public interface MemberService {
	
	// 로그인
	public String loginMember(String id, String password);
	// 아이디 중복 체크
	public boolean isExistId(String id);
	// 회원가입
	public int userSignUp(MemberDTO memberDTO);
	
	
	
}
