<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18-04-2024
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="nani" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        div{
            width: 1000px;
            margin-right: auto;
            margin-left: auto;
        }
        th,td{
            padding: 10px 25px;
        }
        :where(#b1,#b2){
            width: 100%;
            border-radius: 10px;
            border: none;
        }
        tr > td:first-child{
            font-size: 30px;
        }
        tr  td:nth-child(2){
            font-size: 18px;
        }
        table{
            margin-right: auto;
            margin-left: auto;
        }
        button{
            border-radius: 10px;
            border: none;
            font-size: 20px;
        }
        .error{
            color: red;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">User Registration Page</h1>
<div>
    <table>
        <%--@elvariable id="user" type=""--%>
        <form:form action="addUser" modelAttribute="user" method="post">
            <nani:choose>
                <nani:when test="${samePage != null}">
                    <input type="hidden" name="samePage" value="NotNull">
                </nani:when>
            </nani:choose>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    <form:input path="id" />
                </td>
                <td>
                    <form:errors path="id" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <form:input path="name" />
                </td>
                <td>
                    <form:errors path="name" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td>
                    Mobile Number
                </td>
                <td>
                    <form:input path="mobileNumber" />
                </td>
                <td>
                    <form:errors path="mobileNumber" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td>
                    Email Address
                </td>
                <td>
                    <form:input path="emailAddress" />
                </td>
                <td>
                    <form:errors path="emailAddress" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td>
                    Gender
                </td>
                <td>
                    <form:input path="gender" />
                </td>
                <td>
                    <form:errors path="gender" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <form:input path="password" />
                </td>
                <td>
                    <form:errors path="password" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <form:button type="submit" id="b1">Submit</form:button>
                </td>
            </tr>
        </form:form>
            <tr>
                <td colspan="2">
                    <form action="home">
                        <button type="submit" id="b2">Home Page</button>
                    </form>
                </td>
            </tr>
    </table>
</div>
</body>
</html>
