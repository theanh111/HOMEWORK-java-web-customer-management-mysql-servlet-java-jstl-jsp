<%--
  Created by IntelliJ IDEA.
  User: xxtyo
  Date: 11/1/2020
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
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
<h1>Delete customer</h1>
<p>
    <a href="/customers" class="btn btn-primary">Back To Customer List</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
        <table cellpadding="10px" border="1px">
            <tr>
                <th colspan="2">Customer Information</th>
            </tr>
            <tr>
                <th>Name:</th>
                <td>${requestScope["customer"].getName()}</td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>${requestScope["customer"].getEmail()}</td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>${requestScope["customer"].getAddress()}</td>
            </tr>
            <tr>
                <th>Image:</th>
                <td><img src="${requestScope["customer"].getImage()}" alt="Image" width="100px" height="100px"></td>
            </tr>
        </table>
    <input type="submit" value="Delete customer" class="btn btn-danger">
</form>
</body>
<style>
    body {
        font-family: Arial;
        font-size: larger;
    }
</style>
</html>
