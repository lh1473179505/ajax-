package cn.sjxy.mrbbs.domain;

import java.util.Date;

public class Employee {

	private String empId;
	private String name;
	private Date hireDate;
	private int salary;
	private Department dept;
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public Department getDept() {
		return dept;
	}
	public void setDept(Department dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", name=" + name + ", hireDate=" + hireDate + ", salary=" + salary
				+ ", dept=" + dept + "]";
	}
	
	
	
}
