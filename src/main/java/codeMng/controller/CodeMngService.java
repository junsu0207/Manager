package codeMng.controller;

import java.util.List;

import codeMng.bean.CodeMngDTO;

public interface CodeMngService {
	// cdno 전체리스트
	public List<CodeMngDTO> list();
	
	// 상세리스트
	public List<CodeMngDTO> detailList(String cdno);
	
	// 수정
	public int codeMngUpdate(CodeMngDTO codeMngDTO);
	
	// 입력
	public int codeMngInsert(CodeMngDTO codeMgnDTO);
}
