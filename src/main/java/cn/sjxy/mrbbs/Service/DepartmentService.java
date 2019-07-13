package cn.sjxy.mrbbs.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.sjxy.mrbbs.dao.DepartmentMapper;
import cn.sjxy.mrbbs.domain.Department;

@Service
@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)

public class DepartmentService {

	@Autowired
	private DepartmentMapper deptMap;

	public DepartmentMapper getDeptMap() {
		return deptMap;
	}

	public void setDeptMap(DepartmentMapper deptMap) {
		this.deptMap = deptMap;
	}
	
	
	public void insert(Department dept) {
		deptMap.save(dept);
	}
	
	public Department findById(String deptId) {
		return deptMap.findById(deptId);
	}
	
	public Department findIncludeEmpsById(String deptId) {
		return deptMap.findIncludeEmpsById(deptId);
	}
	
	public List<Department> findAll(){
		return deptMap.findAll();
	}
	
	public void update(Department dept) {
		deptMap.update(dept);
	}
	
	public void deleteDept(String deptId) {
		deptMap.deleteDept(deptId);
	}
}
