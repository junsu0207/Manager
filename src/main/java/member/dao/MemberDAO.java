package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import codeMng.bean.CodeMngDTO;
import member.bean.MemberDTO;
import member.bean.MemberDetailDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인
	public String login(String id, String password) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		return sqlSession.selectOne("mybatis.member.login", map);
	}
	
	// id중복체크
	public boolean checkUserId(String id) {
		boolean result = false;
		if(sqlSession.selectOne("mybatis.member.checkUserId", id) != null) {
			result = true;
		}
		System.out.println(result);
		return result;
	}
	
	// 회원가입
	public int signUp(MemberDTO memberDTO) {
		return sqlSession.insert("mybatis.member.insertUser", memberDTO);
	}
	
	// 회원상세정보
	public int detailUp(MemberDetailDTO memberDetailDTO) {
		return sqlSession.insert("mybatis.member.insertDetailUser", memberDetailDTO);
	}
	
	// 회원상제정보 리스트
	public List<MemberDetailDTO> list(String id){
		return sqlSession.selectList("mybatis.member.detailList",id);
	}
	
	// 관계:C0020 ,코드 넘버, 이름 가져오기
	public List<CodeMngDTO> codelist(){
		return sqlSession.selectList("mybatis.codeMng.detailCodeList");
	}
}
