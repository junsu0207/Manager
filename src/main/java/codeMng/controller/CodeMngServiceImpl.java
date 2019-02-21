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

	@Override
	public List<CodeMngDTO> detailList(String cdno) {
		return codeMngDAO.DetailList(cdno);
	}

	@Override
	public int codeMngUpdate(CodeMngDTO codeMngDTO) {
		return codeMngDAO.codeMngUpdate(codeMngDTO);
	}

	@Override
	public int codeMngInsert(CodeMngDTO codeMgnDTO) {
		return codeMngDAO.codeMngInsert(codeMgnDTO);
	}

}
