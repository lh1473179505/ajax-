package cn.sjxy.mrbbs.Handler;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sjxy.mrbbs.Service.DepartmentService;
import cn.sjxy.mrbbs.Service.EmployeeService;
import cn.sjxy.mrbbs.domain.Department;
import cn.sjxy.mrbbs.domain.Employee;
import cn.sjxy.mrbbs.domain.PageDate;

@Controller
public class EmployeeHandler {

	@Autowired
	private DepartmentService deptService;
	
	public DepartmentService getDeptService() {
		return deptService;
	}

	public void setDeptService(DepartmentService deptService) {
		this.deptService = deptService;
	}

	@Autowired
	private EmployeeService empService;

	public EmployeeService getEmpService() {
		return empService;
	}

	public void setEmpService(EmployeeService empService) {
		this.empService = empService;
	}
	
	@RequestMapping(value="/emp")
	public String showEmps(Map<String,Object>map,String empId) {
		map.put("emps", empService.findAll());
		map.put("dept", deptService.findAll());
//		List<Employee> list=empService.findAll();
//		for(Employee e:list) {
//			System.out.println(e.toString());
//		}
		return "emps";
	}
	
	@ResponseBody
	@RequestMapping(value="/emp1",method=RequestMethod.GET)
	public PageDate showEmps1(Map<String,Object>map,String empId) {
		PageDate pageDate=null;
		List<Employee> emps=empService.findAll();
		pageDate=PageDate.success();
		pageDate.addDate("emps", emps);
		return pageDate;
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(value="empId",defaultValue="1")String empId) {
		System.out.println(empId);
		empService.delete(empId);
		return "redirect:/emps1.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/addEmp",method=RequestMethod.GET)
	public List<Department> addEmp(Map<String,Object>map) {
		//map.put("dept", deptService.findAll());
		return deptService.findAll();
		
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Employee emp,Department dept,HttpServletRequest request) {
		//System.out.println(request.getParameter("dept_id"));
		
		dept.setDeptId(request.getParameter("dept_id"));
		emp.setDept(dept);
		empService.insertEmp(emp);
		
		System.out.println(emp.toString());
		return "redirect:/emps1.jsp";
	}
	
	
}
