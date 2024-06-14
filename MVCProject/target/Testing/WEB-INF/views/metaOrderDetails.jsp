<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 15-05-2024
  Time: 13:23
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
        td{
            padding: 10px 25px;
            text-align: center;
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
            <img src="https://cdn-icons-png.flaticon.com/512/6815/6815043.png" onclick="" class="orders">
        </nani:when>
    </nani:choose>
</div>
<div style="text-align: center">
    <table style="position: absolute;left: 650px;">
        <tr>
            <td colspan="2">
                <h1 style="font-size: 35px;text-align: center;">Address</h1>
            </td>
        </tr>
        <tr>
            <td style="font-size: 30px">
                Address Line :
            </td>
            <td>
                <input type="text" style="font-size: 18px">
            </td>
        </tr>
        <tr>
            <td style="font-size: 30px">
                State :
            </td>
            <td>
                <input type="text" style="font-size: 18px">
            </td>
        </tr>
        <tr>
            <td style="font-size: 30px">
                PinCode :
            </td>
            <td>
                <input type="text" style="font-size: 18px">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h1 style="text-align: center">Payment Mode</h1>
            </td>
        </tr>
        <tr>
            <td style="font-size: 30px">
                CardHolder Name :
            </td>
            <td>
                <input type="text" style="font-size: 18px">
            </td>
        </tr>
        <tr>
            <td style="font-size: 30px">
                Card Number :
            </td>
            <td>
                <input type="text" style="font-size: 18px">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h1 style="text-align: center;font-size: 35px;">Delivery Mode</h1>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="radio" id="in1" name="dm" value="low" style="font-size: 30px">
                <label for="in1">Standard Delivery Mode -> 5-6 Days ($0.0)</label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="radio" id="in2" name="dm" value="medium" style="font-size: 30px">
                <label for="in2">Premium Delivery Mode -> 1-2 Days ($10.0)</label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="radio" id="in3" name="dm" value="high" style="font-size: 30px">
                <label for="in3">Standard Delivery Mode -> 0 Days ($40.0)</label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button onclick="proceedOrder()" style="font-size: 20px;text-align: center;height: 100%;width: 100%;border-radius: 25px;border-collapse: collapse;background-color: lightgreen">Check Out</button>
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
    function goToCart(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getCartProducts";
    }
    function getOrders(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getOrders";
    }
    function proceedOrder(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/orderResult";
    }
</script>
</body>
</html>
