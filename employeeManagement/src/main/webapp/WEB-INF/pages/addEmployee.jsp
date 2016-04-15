<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
 <title>Add Employee</title>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
 <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
 <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $( "#hireDate" ).datepicker({
            changeMonth: true,//this option for allowing user to select month
            changeYear: true //this option for allowing user to select from year range
          });
    });
</script>
</head>
<body>
<div class="container">
    <h1>Add Employee</h1>
    <hr/>
    <form:form action="${pageContext.request.contextPath}/addEmployeePost" method="post" commandName="employee" role="form">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter name:"/>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="text" class="form-control" id="pwd" name="pwd" placeholder="Enter password:"/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="Enter email:"/>
        </div>
        <div class="form-group">
            <label for="salary">Salary:</label>
            <input type="text" class="form-control" id="salary" name="salary" placeholder="Enter salary:"/>
        </div>
        <div class="form-group">
	        <label for="department">Department:</label><br>
			<select id="department.id" name=department.id>
				<option value="1">Human Resources</option>
				<option value="2">Marketing</option>
				<option value="3">Information Technology</option>
				<option value="4">R&D</option>	
			</select>
		</div>
		<div class="form-group">
            <label for="hireDate">HireDate:</label>
            <input type="text" class="form-control" id="hireDate" name="hireDate" placeholder="Choose hireDate:"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">Submit</button>
        </div>
    </form:form>
</div>
</body>
</html>