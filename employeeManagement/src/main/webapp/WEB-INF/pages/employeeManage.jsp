<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
 <title>Employee Management</title> 
 <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Employee Management</h1>
    <hr/>
    <h3>All Employees <a href="${pageContext.request.contextPath}/addEmployee" type="button" class="btn btn-default btn-sm">Add employee</a></h3>
 
    <!-- 如果用户列表非空 -->
 <c:if test="${!empty employeeList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Operation</th>
            </tr>
 
            <c:forEach items="${employeeList}" var="employee">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/showEmployee/${employee.id}" type="button" class="btn btn-sm btn-success">Details</a>
                        <a href="${pageContext.request.contextPath}/updateEmployee/${employee.id}" type="button" class="btn btn-sm btn-warning">Modify</a>
                        <a href="${pageContext.request.contextPath}/deleteEmployee/${employee.id}" type="button" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>