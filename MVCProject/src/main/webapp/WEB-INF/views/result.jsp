<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18-04-2024
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="nani" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        div{
            text-align: center;
        }
        form button,button{
            border-radius: 10px;
            border: none;
            font-size: 20px;
            width: 25%;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">The User is ${type} Successfully : ${flag}</h1>
<div>
    <nani:choose>
        <nani:when test="${role eq 'admin'}">
            <form action="home">
                <button type="submit">Home Page</button>
            </form>
        </nani:when>
        <nani:otherwise>
            <form action="${pageContext.request.contextPath}/">
                <button type="submit">Home Page</button>
            </form>
        </nani:otherwise>
    </nani:choose>
</div>
</body>
</html>
