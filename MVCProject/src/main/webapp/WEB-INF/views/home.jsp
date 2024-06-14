<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: user--%>
<%--  Date: 18-04-2024--%>
<%--  Time: 17:13--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <style>--%>
<%----%>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26-04-2024
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="nani" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+15&display=swap" rel="stylesheet">
    <title>Title</title>
    <style>
        .navBar{
            height: 100px;
            background-color: cornflowerblue;
        }
        .nav-bar-name{
            position: relative;
            /*top: 5px;*/
            left: 15px;
            width: 400px;
            height: 100%;
            font-family: "Jersey 15", serif;
            font-size: 70px;
            background-color: cornflowerblue;
            border: 0;
        }
        .login-button{
            position: relative;
            left: 1250px;
            width: 150px;
            height: 50px;
            top: -15px;
            background-color: cornflowerblue;
            border-radius: 25px;
        }
        .admin-button{
            position: relative;
            left: 930px;
            width: 150px;
            height: 50px;
            top: -15px;
            background-color: cornflowerblue;
            border-radius: 25px;
        }
        #div{
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }
        form{
            text-align: center;
            padding-top: 8px;
            padding-bottom: 8px;
        }
        .button{
            width: 100%;
            font-size: 25px;
            border-radius: 20px;
            border: none;
        }
        h1{
            font-size: 30px;
            text-align: center;
            background-color: lightgoldenrodyellow;
            height: 70px;
            padding-bottom: 5px;
            padding-top: 5px;
            line-height: 70px;
        }
    </style>
</head>
<body>
<div class="navBar">
    <%--    <button><span class="nav-bar-name" onclick="">Smart Store</span></button>--%>
    <button class="nav-bar-name" onclick="home()">Smart Store</button>
        <nani:choose>
            <nani:when test="${in eq true}">
                <button class="login-button" onclick="logout()">Logout</button>
            </nani:when>
            <nani:otherwise>
                <button class="login-button" onclick="login()">Login/SignIn</button>
            </nani:otherwise>
        </nani:choose>
    <nani:choose>
        <nani:when test="${url eq true}">
            <button class="admin-button" >Admin Button</button>
        </nani:when>
    </nani:choose>
</div>
<h1>Admin Page</h1>
<div id="div">
    <form action="getAllUsers">
        <button class="button" type="submit">All User's Details</button>
    </form>
    <form action="getParticularUserStarter">
        <button class="button" type="submit">User Details</button>
    </form>
    <form action="userStarter">
        <button class="button" type="submit">Add User</button>
    </form>
    <form action="updateUserStarterOne">
        <button class="button" type="submit">Update User</button>
    </form>
    <form action="deleteUserStarter">
        <button class="button" type="submit">Delete User</button>
    </form>
</div>
<script>
    function home(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/";
    }
    function login(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/login";
    }
    function admin(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/home";
    }
    function logout(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/logout";
    }
</script>
</body>
</html>
