<%--
  Created by IntelliJ IDEA.
  User: akshathphillips
  Date: 9/22/23
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Survey Result</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #006633; /* gmu-green */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Survey Result</h1>
    <div class="alert alert-success">
        <strong>${requestScope.alertMessage}</strong>
    </div>
    <form action="index.jsp">
        <button type="submit" class="btn btn-primary">Fill Out Another Survey</button>
    </form>
</div>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

