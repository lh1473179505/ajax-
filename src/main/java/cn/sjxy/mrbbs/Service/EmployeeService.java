package cn.sjxy.mrbbs.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.sjxy.mrbbs.dao.EmployeeMapper;
import cn.sjxy.mrbbs.domain.Employee;

@Service
@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
public class EmployeeService {
	
	@Autowired
	private EmployeeMapper empMap;

	public EmployeeMapper getEmpMap() {
		return empMap;
	}

	public void setEmpMap(EmployeeMapper empMap) {
		this.empMap = empMap;
	}
	
	public void insertEmp(Employee emp) {
		empMap.save(emp);
	}
	
	public void update(Employee emp) {
		empMap.update(emp);
	}
	
	public void delete(String empId) {
		empMap.deleteById(empId);
	}
	
	public Employee findIncludeDeptById(String empId) {
		return empMap.findIncludeDeptById(empId);
	}
	
	public List<Employee> findEmpsByDeptId(String deptId){
		return empMap.findEmpsByDeptId(deptId);
	}
	
	public List<Employee> findAll(){
		return empMap.findAll();
	}

}
