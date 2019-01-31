package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public String login(String id, String password) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		return sqlSession.selectOne("mybatis.member.login", map);
	}
	
	public boolean checkUserId(String id) {
		boolean result = false;
		if(sqlSession.selectOne("mybatis.member.checkUserId", id) != null) {
			result = true;
		}
		System.out.println(result);
		return result;
	}

}
