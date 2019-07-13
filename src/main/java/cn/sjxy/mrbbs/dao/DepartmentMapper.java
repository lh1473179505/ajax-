package cn.sjxy.mrbbs.dao;

import java.util.List;

import cn.sjxy.mrbbs.domain.Department;

public interface DepartmentMapper {

	//持久化一个部门
	public void save(Department dept);
	
	//通过部门编号查询一个部门，不包括部门下的员工
	public Department findById(String deptId);
	
	//通过编号查询部门，包括部门下的员工
	public Department findIncludeEmpsById(String deptId);
	
	//查询所有部门
	public List<Department> findAll();
	
	//更新部门
	public void update(Department dept);
	
	//通过编号删除部门
	public void deleteDept(String deptId);
	
}
