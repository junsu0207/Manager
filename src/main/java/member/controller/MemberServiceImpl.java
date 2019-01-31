package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
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

}
