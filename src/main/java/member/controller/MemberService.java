package member.controller;

import java.util.List;

import codeMng.bean.CodeMngDTO;
import member.bean.MemberDTO;
import member.bean.MemberDetailDTO;

public interface MemberService {
	
	// 로그인
	public String loginMember(String id, String password);
	// 아이디 중복 체크
	public boolean isExistId(String id);
	// 회원가입
	public int userSignUp(MemberDTO memberDTO);
	// 회원상세
	public int detailUser(MemberDetailDTO memberDetailDTO);
	// 회원상세리스트
	public List<MemberDetailDTO> list(String id);
	// code select
	public List<CodeMngDTO> codeSelect();
	
}
