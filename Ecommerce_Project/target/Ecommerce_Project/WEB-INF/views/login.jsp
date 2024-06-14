<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 09-05-2024
  Time: 16:44
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
<h1 style="text-align: center">Login Page</h1>
<div>
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
                    <label for="pass">User Name</label>
                </td>
                <td>
                    <input id="pass" name="password" placeholder="Enter Password" style="font-size: 18px">
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
                <form action="">
                    <button type="submit">Home Page</button>
                </form>
            </td>
        </tr>
    </table>
</div>
</body>
</html>

