<%--
Created by IntelliJ IDEA.
User: xxtyo
Date: 11/1/2020
Time: 10:54 PM
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;c   harset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<center>
    <h1>Customers</h1>
    <p>
        <a href="/customers?action=create" class="btn btn-success">Create new customer</a>
    </p>
    <form>
        <input type="hidden" name="action" value="searchByName">
        <input type="text" name="searchByName" id="searchByName">
<%--        <select name="type" id="type">--%>
<%--            <option value="id" name="searchId" id="searchId">ID</option>--%>
<%--            <option value="name" name="searchName" id="searchName">Name</option>--%>
<%--            <option value="address" name="searchAddress" id="searchAddress">Address</option>--%>
<%--            <option value="email" name="searchEmail" id="searchEmail">Email</option>--%>
<%--        </select>--%>
        <input type="submit" class="btn btn-success" value="Search By Name">
    </form>
    <form>
        <input type="hidden" name="action" value="searchById">
        <input type="text" name="searchById" id="searchById">
        <%--        <select name="type" id="type">--%>
        <%--            <option value="id" name="searchId" id="searchId">ID</option>--%>
        <%--            <option value="name" name="searchName" id="searchName">Name</option>--%>
        <%--            <option value="address" name="searchAddress" id="searchAddress">Address</option>--%>
        <%--            <option value="email" name="searchEmail" id="searchEmail">Email</option>--%>
        <%--        </select>--%>
        <input type="submit" class="btn btn-success" value="Search By Id">
    </form>
    <hr>
    <table border="1" cellpadding="10px">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Image</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items='${requestScope["customers"]}' var="customer">
            <tr>
                <th>${customer.getId()}</th>
                <th><a href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a></th>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td><img src="${customer.getImage()}" alt="Image" width="100px" height="100px"></td>
                <th><a href="/customers?action=edit&id=${customer.getId()}" class="btn btn-secondary">EDIT</a></th>
                <th><a href="/customers?action=delete&id=${customer.getId()}" class="btn btn-danger">DELETE</a></th>
            </tr>
        </c:forEach>
    </table>
</center>
</body>
</html>
