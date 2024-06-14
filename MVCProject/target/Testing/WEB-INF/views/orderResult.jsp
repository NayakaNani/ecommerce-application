<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 15-05-2024
  Time: 11:44
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
        .cart{
            position: relative;
            left: 700px;
            width: 60px;
            height: 60px;
            top: 10px;
            background-color: cornflowerblue;
        }
        .orders{
            position: relative;
            left: 550px;
            width: 70px;
            height: 70px;
            top: 15px;
            background-color: cornflowerblue;
        }
        .main-div{
            width: 700px;
            height: 500px;
            position: absolute;
            top: 250px;
            left: 600px;
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
        <nani:when test="${role eq 'admin'}">
            <button class="admin-button" onclick="admin()">Admin Panel</button>
        </nani:when>
        <nani:when test="${role eq 'user'}">
            <button class="admin-button" onclick="profile()">Profile</button>
        </nani:when>
    </nani:choose>
    <nani:choose>
        <nani:when test="${role eq 'user' or role eq 'admin'}">
            <img src="https://cdn-icons-png.flaticon.com/512/630/630746.png" onclick="goToCart()" class="cart">
            <img src="https://cdn-icons-png.flaticon.com/512/6815/6815043.png" onclick="getOrders()" class="orders">
        </nani:when>
    </nani:choose>
</div>
<div class="main-div">
    <img src="https://th.bing.com/th/id/R.fcecaf11e7cdc8f272e3803ef3ed0c93?rik=TCD4nj4keBYYig&riu=http%3a%2f%2fwww.atlantisresort-bg.com%2fwp-content%2fuploads%2f2019%2f05%2fanimated-check-mark.gif&ehk=CgGNxAYJnRTlsr7y4gUA2DcrQQLkv%2b0NaFh3kYlxZTQ%3d&risl=&pid=ImgRaw&r=0" style="height: 200px;width: 200px;position: relative;left: 240px;">
    <br>
    <h1 style="position: relative;left: 230px;">Hai ${username}</h1>
    <h1 style="position: relative;left: 160px;">Order Placed Successfully!!</h1>
    <h1 style="position: relative;left: 170px;">Your Order ID is : ${orderId}</h1>
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
    function profile(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/userProfile";
    }
    function goToCart(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getCartProducts";
    }
    function getOrders(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getOrders";
    }
</script>
</body>
</html>
