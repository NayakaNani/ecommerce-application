<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18-04-2024
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        div{
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
    </style>
</head>
<body>
<h1 style="text-align: center">User Details Delete Page</h1>
<div>
    <table>
        <form action="deleteUser" method="get">
        <tr>
            <td style="font-size: 30px">
                <label for="id">Entr User ID</label>
            </td>
            <td>
                <input id="id" name="id" placeholder="Enter User ID" style="font-size: 18px">
            </td>
        </tr>
        <tr>
            <td colspan="2" >
                <button type="submit">Submit</button>
            </td>
        </tr>
        </form>
        <tr>
            <td colspan="2" >
                <form action="home">
                    <button type="submit" >Home Page</button>
                </form>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
