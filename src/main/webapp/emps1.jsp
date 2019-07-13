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
<title>异步刷新</title>


<script type="text/javascript">
	$(function(){
		$("#add_emp").click(function(){
			
			$("#select_dept").empty();
			//$("#tianjia").modal({backdrop: 'static', keyboard: false}); 
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
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"${pageContext.request.contextPath }/emp1",
			type:"GET",
			success:function(result){
				//alert(result);
				get_tableData(result);
			}
		});
	});
	
	function get_tableData(result){
		var $tbody=$(".table tbody");
		$tbody.empty(); 
		$.each(result.date.emps,function(index,emp){
			//var checkboxTD=$("<td></td>").append("<input type='checkbox' name='emps' />");
			var empIdTD=$("<td></td>").append(emp.empId);
			var nameTD=$("<td></td>").append(emp.name);
			var hireDateTD=$("<td></td>").append(emp.hireDate);
			var salaryTD=$("<td></td>").append(emp.salary);
			var deptNameTD=$("<td></td>").append(emp.dept.name);
			var deptIdTD=$("<td></td>").append(emp.dept.deptId);
			var opTD=$("<td></td>");
			
			var btn1=$("<button></button>")
					 .addClass("btn btn-warning")
					 .append($("<span></span>").addClass("glyphicon glyphicon glyphicon-pencil").append("修改")).append($("<a></a>").attr("href","#"));
			var btn2=$("<button></button>")
					 .addClass("btn btn-primary btn-danger")
					 .append($("<span></span>").addClass("glyphicon glyphicon-minus-sign").append($("<a></a>").append("删除").attr("href","${pageContext.request.contextPath }/delete?empId="+emp.empId)));
			opTD.append(btn1)
				.append("")
				.append(btn2)
			
			$("<tr></tr>").append(empIdTD)
						  .append(nameTD)
						  .append(hireDateTD)
						  .append(salaryTD)
						  .append(deptNameTD)
						  .append(deptIdTD)
						  .append(opTD)
						  .appendTo($tbody)
						  
		});
		
	}
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
			
		</tbody>
	</table>
	
	<!-- 添加开始 -->
															
								<div class="modal fade" id="tianjia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
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
								      	<!-- 
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
								      	
								      	 -->
								      	
								      	
								      		
								      		 
								      		 
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
							
							
							
	</div>


	
</body>
</body>
</html>