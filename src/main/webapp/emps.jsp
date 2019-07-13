<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>首页</title>

<script type="text/javascript">
	$(function(){
		$("#add_emp").click(function(){
			//alert("hello");
			//发送一个ajax请求
			$.ajax({
				url:"${pageContext.request.contextPath }/addEmp",
				type:"GET",
				success:function(result){
					//alert(result);
					$.each(result,function(index,dept){
						//创建一个option元素
						$("<option></option>").append(dept.name).attr("value",dept.deptId).appendTo("#select_dept");
					})
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
	<button type="button" class="btn btn-primary">
								<span class="glyphicon  glyphicon-plus-sign" aria-hidden="true" data-toggle="modal" data-target="#tianjia"
								id="add_emp"></span> 添加
							</button>
	 <table align="center" class="table table-hover">
		<thead>
			<tr>
				<th>员工编号</th>
				<th>姓名</th>
				<th>入职日期</th>
				<th>工资</th>
				<th>部门名称</th>
				<th>部门编号</th>
				<th>操作</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${emps }" var="emp">
				<tr>
					<td>${emp.empId }</td>
					<td>${emp.name }</td>
					<td>${emp.hireDate }</td>
					<td>${emp.salary }</td>
					<td>${emp.dept.name }</td>
					<td>${emp.dept.deptId }</td>
					<td>
						
		
						<button type="button" class="btn btn-warning">
						<span class="glyphicon glyphicon glyphicon-pencil" aria-hidden="true" data-toggle="modal" data-target="#xiugai"></span>
						修改</button>
						
						<a href="${pageContext.request.contextPath }/delete?empId=${emp.empId }">
						<button type="button" class="btn btn-primary btn-danger">
						<span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>
						删除
						</button></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 添加开始 -->
															
								<div class="modal fade" id="tianjia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel">添加员工</h4>
								      </div>
								        <form action="${pageContext.request.contextPath }/add" method="post">
								      
								    
								      <div class="modal-body">
								      	
								      		 <div class="form-group">
								      		 	<label for="empId" class="col-sm-4 control-label">员工编号：</label>
   													 <input type="text" class="form-control" id="empId" name="empId" placeholder="员工编号">
								      		 </div>
								      
								      	
								      
								      		<div class="form-group">
								      		 	<label for="empId" class="col-sm-4 control-label">姓名：</label>
   													 <input type="text" class="form-control" id="name" name="name" placeholder="姓名">
								      		 </div>
								      	
								      	
								      	
								      		 <div class="form-group">
								      		 	<label for="empId" class="col-sm-4 control-label">工资：</label>
   													 <input type="number" class="form-control" id="salary" name="salary" placeholder="工资">
								      		 </div>
								      	
								      	
								      	
								      		 <div class="form-group">
								      		 	<label for="dept" class="col-sm-4 control-label">部门：</label>
								      		 	<select name="dept_id" class="form-control" placeholder="部门名称">
								      		 		<c:forEach items="${dept }" var="dept">
														<option value="${dept.deptId }">
															${dept.name }
														</option>
													</c:forEach>
								      		 	</select>
								      		 </div>
								      		 
								      		 
								      		 <div class="form-group">
								      		 	<label for="dept" class="col-sm-4 control-label">部门：</label>
								      		 	<select name="dept_id" class="form-control" placeholder="部门名称" id="select_dept">
								      		 		
								      		 	</select>
								      		 </div>
								      	
						
								      </div>
								      <div class="modal-footer form-group" >
								        <button type="submit" class="btn btn-default">提交</button>
								        <button type="reset" class="btn btn-primary">重置</button>
								      </div>
								      </form>
								    </div>
								  </div>
								</div>
							<!-- 添加结束 -->
							
							
							<!-- 修改开始 -->
															
								<div class="modal fade" id="xiugai" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel">修改员工</h4>
								      </div>
								        <form action="${pageContext.request.contextPath }/update" method="post">
								      
								    
								      <div class="modal-body">
								      	
								      		 <div class="form-group">
								      		 	<label for="empId" class="col-sm-4 control-label">员工编号：</label>
   													 <input type="text" class="form-control" id="empId" name="empId" placeholder="员工编号">
								      		 </div>
								      
								      	
								      
								      		<div class="form-group">
								      		 	<label for="empId" class="col-sm-4 control-label">姓名：</label>
   													 <input type="text" class="form-control" id="name" name="name" placeholder="姓名">
								      		 </div>
								      	
								      	
								      	
								      		 <div class="form-group">
								      		 	<label for="empId" class="col-sm-4 control-label">工资：</label>
   													 <input type="number" class="form-control" id="salary" name="salary" placeholder="工资">
								      		 </div>
								      	
								      	
								      	
								      		 <div class="form-group">
								      		 	<label for="dept" class="col-sm-4 control-label">部门：</label>
								      		 	<select name="dept_id" class="form-control" placeholder="部门名称">
								      		 		<c:forEach items="${dept }" var="dept">
														<option value="${dept.deptId }">
															${dept.name }
														</option>
													</c:forEach>
								      		 	</select>
								      		 </div>
								      	
						
								      </div>
								      <div class="modal-footer form-group" >
								        <button type="submit" class="btn btn-default">提交</button>
								        <button type="reset" class="btn btn-primary">重置</button>
								      </div>
								      </form>
								    </div>
								  </div>
								</div>
							<!-- 修改结束 -->
	</div>


	
</body>
</html>