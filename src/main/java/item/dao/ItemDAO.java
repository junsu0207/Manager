package item.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import codeMng.bean.CodeMngDTO;
import item.bean.ItemDTO;

@Repository
public class ItemDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	// 대분류,카테고리 C0070
	public List<CodeMngDTO> mainCategoryCode(){
		return sqlSession.selectList("mybatis.codeMng.itemCodeList");
	}
	// 카테고리 -> 1차 분류
	public List<CodeMngDTO> firstCategory(String code){
		return sqlSession.selectList("mybatis.codeMng.firstCodeList", code);
	}
	// 1차분류된 아이템 리스트
	public List<ItemDTO> itemList(String itemclscd){
		return sqlSession.selectList("mybatis.item.itemList", itemclscd);
	}
	// detail view
	public ItemDTO itemDetailView(String itemcd) {
		return sqlSession.selectOne("mybatis.item.itemView", itemcd);
	}
	// select 리스트 db쿼리 한번에 
	public List<ItemDTO> selectList(){
		return sqlSession.selectList("mybatis.item.selectList");
	}
	// select 리스트 쿼리 나눠져있음
	public List<CodeMngDTO> madenameList(){
		return sqlSession.selectList("mybatis.item.madenameList");
	}
	public List<CodeMngDTO> unitcdnameList(){
		return sqlSession.selectList("mybatis.item.unitcdnameList");
	}
	public int itemUpdate(ItemDTO itemDTO) {
		return sqlSession.update("mybatis.item.itemUpdate", itemDTO);
	}
	public int itemInput(ItemDTO itemDTO) {
		return sqlSession.insert("mybatis.item.itemInput", itemDTO);
	}
}
