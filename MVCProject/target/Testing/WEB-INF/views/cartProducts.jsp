<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 14-05-2024
  Time: 18:42
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
        .remove-button{
            font-size: 15px;
            width: 200px;
            height: 50px;
            border-collapse: collapse;
            border-radius: 25px;
            background-color: orange;
            padding: 10px;
            position: absolute;
            right: 150px;
        }
        .cart-nav-bar{
            height: 75px;
            background-color: lightgreen;
        }
        .cart-delete-button{
            position: absolute;
            top: 120px;
            left: 70px;
            width: 220px;
            height: 50px;
            background-color: lightgreen;
            border-radius: 25px;
        }
        .cart-check-out{
            position: absolute;
            top: 120px;
            right: 70px;
            width: 220px;
            height: 50px;
            background-color: lightgreen;
            border-radius: 25px;
        }
        .price{
            font-size: 25px;
            position: relative;
            top: 25px;
            left: 1400px;
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
<div class="cart-nav-bar">
    <button class="cart-delete-button" onclick="deleteCart()">Delete Cart</button>
    <span class="price">Total : $${total}</span>
    <button class="cart-check-out" onclick="placeOrders()">Check Out</button>
</div>
<div>
    <table style="width: 100%">
        <nani:forEach items="${cartProducts}" var="obj">
            <tr>
                <td style="height: 400px;width: 400px;" onclick="pdp(${obj.getId()})">
                    <img src="${obj.getImage()}" style="width: 400px;height: 400px;">
                </td>
                <td style="position: relative;left: 50px;top: 25px;" onclick="pdp(${obj.getId()})">
                    <h1>
                        ${obj.getTitle()}
                    </h1>
                    <h1>
                        Price : $${obj.getPrice()}
                    </h1>
                </td>
                <td style="text-align: center">
                    <button onclick="remove(${obj.getId()})" class="remove-button">Remove From Cart</button>
                </td>
            </tr>
        </nani:forEach>
    </table>
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
    function remove(id){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/removeCartProduct?productId="+id;
    }
    function deleteCart(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/deleteUserCart";
    }
    function pdp(id){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/pdp?id=" + id;
    }
    function placeOrders(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/placeOrders";
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
