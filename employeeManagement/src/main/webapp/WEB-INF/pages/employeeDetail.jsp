<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
 <title>Employee Details</title> 
 <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Employee Details</h1>
    <hr/>
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <td>${employee.id}</td>
        </tr>
        <tr>
            <th>Name</th>
            <td>${employee.name}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${employee.email}</td>
        </tr>
        <tr>
            <th>Password</th>
            <td>${employee.pwd}</td>
        </tr>
        <tr>
            <th>Salary</th>
            <td>${employee.salary}</td>
        </tr>
        <tr>
            <th>Department</th>
            <td>${department.name}</td>
        </tr>
    </table>
</div>
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
