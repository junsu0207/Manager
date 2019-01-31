package emp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import emp.bean.EmpDTO;

@Repository
public class EmpDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// emp리스트
	public List<EmpDTO> list(){
		return sqlSession.selectList("mybatis.emp.empList");
	}
	
	/*public ArrayList<EmpDTO> empList(){
		ArrayList<EmpDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM EXAM_MANAGER.EMP";
		EmpDTO empDTO = null;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				empDTO = new EmpDTO();
				empDTO.setENAME(rs.getString("ENAME"));
				empDTO.setCOMM(rs.getInt("COMM"));
				empDTO.setHIREDATE(rs.getString("HIREDATE"));
				empDTO.setEMPNO(rs.getInt("EMPNO"));
				empDTO.setMGR(rs.getInt("MGR"));
				empDTO.setJOB(rs.getString("JOB"));
				empDTO.setDEPTNO(rs.getInt("DEPTNO"));
				empDTO.setSAL(rs.getInt("SAL"));
				list.add(empDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}*/
	
}
