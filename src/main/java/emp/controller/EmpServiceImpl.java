package emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import emp.bean.EmpDTO;
import emp.dao.EmpDAO;

@Service
public class EmpServiceImpl implements EmpService{
	
	@Autowired
	private EmpDAO empDAO;
	
	@Override
	public List<EmpDTO> list() {
		return empDAO.list();
	}
	
	
}
