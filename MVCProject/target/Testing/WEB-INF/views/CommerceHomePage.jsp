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
            cursor: pointer;
        }
        .login-button{
            position: relative;
            left: 1250px;
            width: 150px;
            height: 50px;
            top: -15px;
            background-color: cornflowerblue;
            border-radius: 25px;
            cursor: pointer;
        }
        .admin-button{
            position: relative;
            left: 930px;
            width: 150px;
            height: 50px;
            top: -15px;
            background-color: cornflowerblue;
            border-radius: 25px;
            cursor: pointer;
        }
        .cart{
            position: relative;
            left: 700px;
            width: 60px;
            height: 60px;
            top: 10px;
            background-color: cornflowerblue;
            cursor: pointer;
        }
        .orders{
            position: relative;
            left: 550px;
            width: 70px;
            height: 70px;
            top: 15px;
            background-color: cornflowerblue;
            cursor: pointer;
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
<%--        <nani:forEach items="${products}" var="obj">--%>
<%--            <tr style="border: 2px solid red;border-radius: 5px;">--%>
<%--                <td style="width: 400px;height: 400px">--%>
<%--                    <img src="${obj.getImage()}" style="height: 100%;width: 100%" />--%>
<%--&lt;%&ndash;                    <img src="${obj.getImage()}" style="height: 100%;width: 100%" />&ndash;%&gt;--%>
<%--                </td>--%>
<%--                <td style="position:absolute;left: 400px ;width: 100%;height: 400px">--%>
<%--                    <table class="inner-table">--%>
<%--                        <tr style="margin-top: 50px;margin-left: 25px;">--%>
<%--                            <td>--%>
<%--                                <h1>--%>
<%--                                    ${obj.getTitle()}--%>
<%--                                </h1>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr style="margin-top: 50px;margin-left: 25px;">--%>
<%--                            <td>--%>
<%--                                <h1>--%>
<%--                                         $${obj.getPrice()}--%>
<%--                                </h1>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </table>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </nani:forEach>--%>
    <nani:forEach items="${products}" var="obj">
            <tr>
                <td style="width: 400px;height: 400px;cursor: pointer;" onclick="pdp(${obj.getId()})">
                    <img src="${obj.getImage()}" style="height: 500px;width: 500px;" />
                </td>
                <td style="position:absolute;left: 600px ;width: 700px;height: 500px" onclick="pdp(${obj.getId()})">

                    <h1 style="margin-top: 100px;font-size: 50px;cursor: pointer;">
                            ${obj.getBrand()}
                    </h1>

                    <h1 style="margin-top: 100px;cursor: pointer;">
                            ${obj.getTitle()}
                    </h1>

                    <h1 style="margin-top: 50px;cursor: pointer;">
                        $${obj.getPrice()}
                    </h1>
                </td>
                <td style="position: absolute;left: 1400px;height: 500px;width: 500px;text-align: center;">
                    <h1>
                        <button style="margin-top: 200px;background-color: greenyellow;border-radius: 25px;width: 200px;height: 50px;cursor: pointer;" onclick="addToCart(${obj.getId()})">Add To Cart</button>
                    </h1>
                    <h1>
                        <button style="margin-top: 20px;background-color: cornflowerblue;border-radius: 25px;width: 200px;height: 50px;cursor: pointer;" onclick="placeOrder(${obj.getId()},${obj.getPrice()})">Check Out</button>
                    </h1>
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
    function pdp(id){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/pdp?id=" + id;
    }
    function addToCart(id){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/addToCart?productId="+id;
    }
    function goToCart(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getCartProducts";
    }
    function placeOrder(id,amount){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/placeOrder?id="+id+"&amount="+amount;
    }
    function getOrders(){
        location.href="http://localhost:8080/MVCMainProject_war_exploded/getOrders";
    }
</script>
</body>
</html>
