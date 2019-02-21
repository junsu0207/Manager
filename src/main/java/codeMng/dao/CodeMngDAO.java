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
	
	// codemng list
	public List<CodeMngDTO> list(){
		return sqlSession.selectList("mybatis.codeMng.codeMngList");
	}
	// codemng detail list
	public List<CodeMngDTO> DetailList(String cdno){
		return sqlSession.selectList("mybatis.codeMng.codeMngView", cdno);
	}
	// codemng update
	public int codeMngUpdate(CodeMngDTO codeMngDTO) {
		return sqlSession.update("mybatis.codeMng.codeUpdate", codeMngDTO);
	}
	// codemng insert
	public int codeMngInsert(CodeMngDTO codeMngDTO) {
		return sqlSession.insert("mybatis.codeMng.codeInsert", codeMngDTO);
	}
}

