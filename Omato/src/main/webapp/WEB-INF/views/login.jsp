<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://st3.depositphotos.com/1017986/18327/i/450/depositphotos_183278524-stock-photo-robot-and-human-hand-flash.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        header {
            background-color: #007BFF;
            color: white;
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            display: flex;
            justify-content: space-between; /* Adjusted to spread items apart */
            align-items: center; /* Center items vertically */
        }

        header a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            margin: 0 20px; /* Adjusted margin */
        }

        .home-icon {
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .home-icon img,
        .logout-button img {
            width: 30px;
            height: 30px;
            transition: filter 0.3s;
        }

        center {
            background-color: rgba(255, 255, 255, 0.3);
            padding: 20px;
            border-radius: 10px;
            margin-top: 50px;
        }

        h1 {
            color: black;
        }

        form {
            margin-top: 20px;
        }

        table {
            margin: 0 auto;
        }

        td {
            padding: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 200px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid greenyellow;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: green;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: green;
        }

        footer {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <div class="home-icon">
        <a href="/Omato">
            <img src="https://raw.githubusercontent.com/abhijdk/A_Portfolio_Website/main/image/home..png" alt="Home">
        </a>
    </div>
    <span>Omato</span>
    <div class="login-button">
        <a href="login">
<%--            <img src="https://i.pinimg.com/736x/e8/25/02/e82502d76e7e6bf54a50a35c3f0a5809.jpg" alt="login" style="width: 100px; height: 40px;">--%>
        </a>
    </div>
</header>

<h1 style="color: red; align-content: center">   ${view}</h1>
<center>
    <h1>Login Here</h1>

   <h2> <span style="color: dodgerblue;">${view}</span></h2>

    <c:if test="${error eq 'true'}">
        <font color="red">${msg}</font>
    </c:if>
    <font color="#008b8b">${logOutMsg}</font>
    <form name="login" action="loginOk" method="post">
        <table>
            <tr>
                <td>User Name:</td>
                <td><input type='text' name='userName' value='' placeholder="Enter User Name"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name='password' placeholder="Enter Password"/></td>
            </tr>
            <tr>
                <td><input name="submit" type="submit" value="Submit"/></td>
                <td><input name="reset" type="reset"/></td>
            </tr>
        </table>
    </form>
</center>

<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
