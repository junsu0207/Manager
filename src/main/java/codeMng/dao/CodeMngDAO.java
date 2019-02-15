package codeMng.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import codeMng.bean.CodeMngDTO;

@Repository
public class CodeMngDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CodeMngDTO> list(){
		return sqlSession.selectList("mybatis.codeMng.codeMngList");
	}
}
