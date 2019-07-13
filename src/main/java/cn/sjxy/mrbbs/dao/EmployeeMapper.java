package cn.sjxy.mrbbs.dao;

import java.util.List;

import cn.sjxy.mrbbs.domain.Employee;

public interface EmployeeMapper {

	//保存一个员工信息
	public void save(Employee emp);
	
	//更新员工信息
	public void update(Employee emp);
	
	//通过编号删除员工	
	public void deleteById(String empId);
	
	//通过编号查询员工，包括部门
	public Employee findIncludeDeptById(String empId);
	
	//通过部门编号查询部门下所有员工信息
	public List<Employee> findEmpsByDeptId(String deptId);
	
	//查询所有员工信息
	public List<Employee> findAll();
}
