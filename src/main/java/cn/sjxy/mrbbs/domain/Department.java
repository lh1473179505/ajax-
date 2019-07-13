package cn.sjxy.mrbbs.domain;

import java.util.List;

public class Department {

	private String deptId;
	private String name;
	private List<Employee> emps;
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Employee> getEmps() {
		return emps;
	}
	public void setEmps(List<Employee> emps) {
		this.emps = emps;
	}
	@Override
	public String toString() {
		return "Department [deptId=" + deptId + ", name=" + name + ", emps=" + emps + "]";
	}
	
	
	
	
}
