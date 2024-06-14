<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 14-05-2024
  Time: 16:18
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
        p{
            font-size: 25px;
        }
        .order-buttons{
            height: 100%;
            width: 100%;
            border-collapse: collapse;
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
    <table>
        <tr>
            <td style="width: 700px;height: 700px">
                <img src="${product.getImage()}" style="height: 700px;width: 700px" alt="ProductImage">
            </td>
            <td>
                <p>
                    Brand : ${product.getBrand()}
                </p>
                <p>
                    Name : ${product.getTitle()}
                </p>
                <p>
                    Price : $${product.getPrice()}
                </p>
                <p>
                    Model : ${product.getModel()}
                </p>
                <p style="font-size: 20px">
                    ${product.getDescription()}
                </p>
            </td>
        </tr>
    </table>
    <table style="width: 100%;height: 50px;">
        <tr>
            <td>
                <button style="background-color: yellow" class="order-buttons" onclick="addToCart(${product.getId()})">Add To Cart</button>
            </td>
            <td>
                <button style="background-color: #4CAF50" class="order-buttons" onclick="placeOrder(${product.getId()},${product.getPrice()})">Check Out</button>
            </td>
        </tr>
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
    function addToCart(id){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/addToCart?productId="+id;
    }
    function goToCart(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getCartProducts";
    }
    function getOrders(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getOrders";
    }
    function placeOrder(id,amount){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/placeOrder?id="+id+"&amount="+amount;
    }
</script>
</body>
</html>
