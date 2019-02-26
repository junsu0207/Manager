package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import codeMng.bean.CodeMngDTO;
import member.bean.MemberDTO;
import member.bean.MemberDetailDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
		
	@Override
	public String loginMember(String id, String password) {
		return memberDAO.login(id, password);
	}

	@Override
	public boolean isExistId(String id) {
		return memberDAO.checkUserId(id);
	}

	@Override
	public int userSignUp(MemberDTO memberDTO) {
		return memberDAO.signUp(memberDTO);
	}

	@Override
	public int detailUser(MemberDetailDTO memberDetailDTO) {
		return memberDAO.detailUp(memberDetailDTO);
	}

	@Override
	public List<MemberDetailDTO> list(String id) {
		return memberDAO.list(id);
	}

	@Override
	public List<CodeMngDTO> codeSelect() {
		return memberDAO.codelist();
	}

}
