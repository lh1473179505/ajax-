<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>


    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>添加员工</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/add" method="post">
	<label>员工编号：</label>
	<input name="empId" type="text"/>
	<br>
	<label>姓名：</label>
	<input name="name" type="text">
	<br>
	<label>工资：</label>
	<input name="salary" type="text">
	<br>
	
	<label>部门：</label>
	
	<select name="dept_id" class="form-control" >
	
	<c:forEach items="${dept }" var="dept">
		<option value="${dept.deptId }">
			${dept.name }
		</option>
	</c:forEach>
		
	</select>
	<br> 
	<button type="submit">提交</button>
</form>
</body>
</html>