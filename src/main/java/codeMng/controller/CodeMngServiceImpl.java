package codeMng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import codeMng.bean.CodeMngDTO;
import codeMng.dao.CodeMngDAO;

@Service
public class CodeMngServiceImpl implements CodeMngService{
	
	@Autowired
	private CodeMngDAO codeMngDAO;
	
	@Override
	public List<CodeMngDTO> list() {
		return codeMngDAO.list();
	}

}
