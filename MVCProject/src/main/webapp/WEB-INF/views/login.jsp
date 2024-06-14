<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 09-05-2024
  Time: 16:44
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
        #div{
            width: 500px;
            margin-right: auto;
            margin-left: auto;
        }
        td{
            padding: 10px 25px;
            text-align: center;
        }
        form button,button{
            border-radius: 10px;
            border: none;
            font-size: 20px;
            width: 70%;
        }
        table{
            width: 100%;
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
    <button class="nav-bar-name" onclick="home()">Smart Store</button>
</div>
<h1 style="text-align: center">Login Page</h1>
<div id="div">
    <table>
        <form action="${pageContext.request.contextPath}/signIn" method="post">
            <tr>
                <td style="font-size: 30px">
                    <label for="name">User Name</label>
                </td>
                <td>
                    <input id="name" name="username" placeholder="Enter User Name" style="font-size: 18px">
                </td>
            </tr>
            <tr>
                <td style="font-size: 30px">
                    <label for="pass">Password</label>
                </td>
                <td>
                    <input id="pass" name="password" placeholder="Enter Password" style="font-size: 18px">
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <button type="submit">Login</button>
                </td>
            </tr>
        </form>
        <tr>
            <td colspan="2" >
                <form action="userStarter">
                    <button type="submit">Sign In</button>
                </form>
            </td>
        </tr>
    </table>
</div>


<script>
    function home(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/";
    }
</script>
</body>
</html>

