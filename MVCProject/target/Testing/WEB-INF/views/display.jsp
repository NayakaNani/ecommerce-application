<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18-04-2024
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="nani" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .center{
            margin-right: auto;
            margin-left: auto;
        }
        th{
            padding: 10px 25px;
            background-color: aqua;
        }
        td{
            padding: 10px 25px;
        }
        tr:nth-child(even){
            background-color: lightgoldenrodyellow;
        }
        div{
            text-align: center;
        }
        form{
            margin-bottom: 0px;
        }
        button{
            border-radius: 5px;
            border: none;
            font-size: 15px;
        }
        .delete{
            background-color: red;
            color: white;
        }
        .edit{
            background-color: yellow;
        }
        .add{
            background-color: lightgreen;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">All User Details</h1>
<div>
    <table class="center">
        <tr>
            <th>
                ID
            </th>
            <th>
                NAME
            </th>
            <th>
                RECENT PURCHASE
            </th>
            <th>
                HIGHEST PURCHASE
            </th>
            <th>
                MOBILE NUMBER
            </th>
            <th>
                EMAIL ADDRESS
            </th>
            <th>
                GENDER
            </th>
            <th>
                ROLE
            </th>
            <th>
                STATUS
            </th>
            <th>
                Edit
            </th>
            <th>
                Delete
            </th>
        </tr>
        <nani:forEach items="${data}" var="obj">
            <tr>
                <td>
                    ${obj.getId()}
                </td>
                <td>
                    ${obj.getName()}
                </td>
                <td>
                    ${obj.getRecentPurchase()}
                </td>
                <td>
                    ${obj.getHighestPurchase()}
                </td>
                <td>
                    ${obj.getMobileNumber()}
                </td>
                <td>
                    ${obj.getEmailAddress()}
                </td>
                <td>
                    ${obj.getGender()}
                </td>
                <td>
                    ${obj.getRole()}
                </td>
                <td>
                    <form action="userStatus">
                        <input type="hidden" name="id" value="${obj.getId()}">
                        <nani:choose>
                            <nani:when test="${obj.getEnabled() eq 1}">
                                <input type="hidden" name="status" value="off">
                                <button type="submit" style="background-color: orange">Disable</button>
                            </nani:when>
                            <nani:otherwise>
                                <input type="hidden" name="status" value="on">
                                <button type="submit" style="background-color: cornflowerblue">Enable</button>
                            </nani:otherwise>
                        </nani:choose>
                    </form>
                </td>
                <td>
                    <form action="updateUserStarter">
                        <input type="hidden" name="id" value="${obj.getId()}">
                        <input type="hidden" name="samePage" value="NotNull">
                        <button type="submit" class="edit">Edit</button>
                    </form>
                </td>
                <td>
                    <form action="deleteUser">
                        <input type="hidden" name="id" value="${obj.getId()}">
                        <input type="hidden" name="samePage" value="NotNull">
                        <button type="submit" class="delete">Delete</button>
                    </form>
                </td>
            </tr>
        </nani:forEach>
        <tr>
            <td colspan="11">
                    <span>
                        <form action="home" style="display: inline">
                            <button type="submit" class="edit">Home Page</button>
                        </form>
                    </span>
                <span>
                    <form action="userStarter" style="display: inline;float: right">
                        <input type="hidden" name="samePage" value="NotNull">
                        <button type="submit" class="add">Add User</button>
                    </form>
                </span>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
