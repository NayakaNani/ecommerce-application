<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 15-05-2024
  Time: 13:15
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
        .date{
            position: relative;
            top: 20px;
            left: 70px;
            font-size: 25px;
        }
        .order-id{
            position: relative;
            top: 20px;
            left: 1300px;
            font-size: 25px;
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
<div>
    <nani:forEach items="${orders}" var="order">
        <div style="height: 70px;background-color: lightgreen">
            <span class="date">Date : ${order.getOrderDate()}</span>
            <span class="order-id">Order Id : ${order.getOrderId()}</span>
        </div>
        <table style="margin-top: 10px;margin-left: 10px;margin-right: 10px;width: 90%">
            <nani:forEach items="${order.getProductList()}" var="product">
                <tr>
                    <td style="height: 400px;width: 400px;">
                        <img src="${product.getImage()}" style="width: 400px;height: 400px;" alt="productImage"/>
                    </td>
                    <td style="position: relative;left: 50px;top: 25px;">
                        <h1>
                                ${product.getTitle()}
                        </h1>
                        <h1>
                            Price : $${product.getPrice()}
                        </h1>
                    </td>
                </tr>
            </nani:forEach>
        </table>
    </nani:forEach>
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
