<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门</title>
</head>
<body>
	<table border="1" align="center">
		<thead>
			<tr>
				<th>部门编号</th>
				<th>部门名称</th>
				<th>员工编号</th>
				<th>员工姓名</th>
				<th>入职时间</th>
				<th>工资</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${depts }" var="dept">
				<tr>
					<td>${dept.deptId }</td>
					<td>${dept.name }</td>
					<c:forEach items="${dept.emps }" var="d">
					
					<td>${d.empId }</td>
					<td>${d.name }</td>
					<td>${d.hireDate }</td>
					<td>${d.salary }</td>
					
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>