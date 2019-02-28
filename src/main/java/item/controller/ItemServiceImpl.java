package item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import codeMng.bean.CodeMngDTO;
import item.bean.ItemDTO;
import item.dao.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemDAO itemDAO;
	
	@Override
	public List<CodeMngDTO> mainCategoryCode() {
		return itemDAO.mainCategoryCode();
	}

	@Override
	public List<CodeMngDTO> firstCategory(String code) {
		return itemDAO.firstCategory(code);
	}

	@Override
	public List<ItemDTO> itemList(String itemclscd) {
		return itemDAO.itemList(itemclscd);
	}

	@Override
	public ItemDTO detailView(String itemcd) {
		return itemDAO.itemDetailView(itemcd);
	}

	@Override
	public List<ItemDTO> selectList() {
		return itemDAO.selectList();
	}

	@Override
	public List<CodeMngDTO> madenameList() {
		return itemDAO.madenameList();
	}

	@Override
	public List<CodeMngDTO> unitcdnameList() {
		return itemDAO.unitcdnameList();
	}

	@Override
	public int itemUpdate(ItemDTO itemDTO) {
		return itemDAO.itemUpdate(itemDTO);
	}

	@Override
	public int itemInput(ItemDTO itemDTO) {
		return itemDAO.itemInput(itemDTO);
	}
}
