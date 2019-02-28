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
	// select list 제조사,단위명 db쿼리 한번에
	public List<ItemDTO> selectList();
	// selectlist db쿼리 나눠져있음
	public List<CodeMngDTO> madenameList();
	public List<CodeMngDTO> unitcdnameList();
	// update
	public int itemUpdate(ItemDTO itemDTO);
	// insert
	public int itemInput(ItemDTO itemDTO);
}
