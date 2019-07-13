package cn.sjxy.mrbbs.Handler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sjxy.mrbbs.Service.DepartmentService;
import cn.sjxy.mrbbs.domain.Department;

@Controller
public class DepartmentHandler {

	@Autowired
	private DepartmentService deptService;

	public DepartmentService getDeptService() {
		return deptService;
	}

	public void setDeptService(DepartmentService deptService) {
		this.deptService = deptService;
	}
	
	
	@RequestMapping(value="/dept")
	public String showDept(Map<String,Object>map) {
		List<Department> list=deptService.findAll();
		map.put("depts", list);
//		for(Department d:list)
//		{
//		System.out.println(d.toString());}
		return "dept";
	}
}
