<%--
  Created by IntelliJ IDEA.
  User: xxtyo
  Date: 11/1/2020
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit customer</title>
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
<h1>Edit customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/customers" class="btn btn-primary">Back To Customer List</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <th>Name:</th>
                <td><input type="text" name="name" id="name" value="${requestScope["customer"].getName()}">
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type="text" name="email" id="email" value="${requestScope["customer"].getEmail()}">
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" value="${requestScope["customer"].getAddress()}">
                </td>
            </tr>
            <tr>
                <th>Image:</th>
                <td>
                    <input type="text" name="image" id="image" value="${requestScope["customer"].getImage()}">
                </td>
            </tr>
            <tr>
                <th>Preview Image:</th>
                <td>
                    <img src="${requestScope["customer"].getImage()}" alt="Image" width="100px" height="100px">
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer" class="btn btn-success"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>

<style>
    body {
        font-family: Arial;
        font-size: larger;
    }
</style>
</html>
