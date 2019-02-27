package item.controller;

import java.util.List;

import org.springframework.stereotype.Service;

import codeMng.bean.CodeMngDTO;
import item.bean.ItemDTO;

@Service
public interface ItemService {
	// 카테고리 대분류
	public List<CodeMngDTO> mainCategoryCode();
	// 카테고리 -> 1차분류
	public List<CodeMngDTO> firstCategory(String code);
	// 1차분류 선택 전체 리스트
	public List<ItemDTO> itemList(String itemclscd);
	// detail view
	public ItemDTO detailView(String itemcd);
	// select list 제조사,단위명
	public List<ItemDTO> selectList();
}
