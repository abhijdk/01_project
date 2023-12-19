<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>SkyTech Commerce - Signup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://raw.githubusercontent.com/abhijdk/A_Portfolio_Website/main/image/bg1.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        header {
            background-color: #007BFF;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .home-icon,
        .logout-button {
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

        footer {
            background-color: #007BFF;
            color: white;
            padding: 5px;
            text-align: center;
            font-size: 12px;
            font-weight: bold;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .container {
            margin: 10px;
            max-width: 600px; /* Set a maximum width for the container */
            background: rgba(255, 255, 255, 0.3);
            padding: 10px;
            border-radius: 10px;
            margin-left: auto;
            margin-right: auto; /* Center the container */
        }

        .signup-form {
            text-align: left; /* Align the form to the left */
            margin-top: 5px;
        }

        .signup-form label,
        .signup-form input,
        .signup-form select {
            display: block; /* Display form elements as block elements */
            margin-bottom: 10px; /* Add margin between form elements */
        }

        .signup-form input,
        .signup-form select {
            width: 100%; /* Set the width to 100% of the container */
            padding: 8px; /* Add padding for better styling */
            box-sizing: border-box; /* Include padding and border in the element's total width and height */
        }

        .signup-form input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        }

        .signup-form input[type="submit"]:hover {
            background-color: #0056b3;
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
    Omato
    <div class="login-button">
        <a href="login">
            <img src="https://i.pinimg.com/736x/e8/25/02/e82502d76e7e6bf54a50a35c3f0a5809.jpg" alt="login" style="width: 100px; height: 40px;">
        </a>
    </div>
</header>

<div class="container">
    <h2>Signup</h2>

    <!-- Signup form section -->
    <form:form action="processSignup" modelAttribute="signUp">



        <label>Name:</label>
        <form:input path="name" />
        <form:errors path="name" cssClass="error"/>
        <br />
        <label>Username:</label>
        <form:input path="username" />
        <form:errors path="username" cssClass="error"/>
        <br />
        <label>Password:</label>
        <form:input path="password" />
        <form:errors path="password" cssClass="error"/>
        <br />
        <!-- Role Dropdown -->
        <label for="role">Role:</label>
        <select id="role" name="role">
            <option value="ROLE_USER">User</option>
            <option value="ROLE_ADMIN">Admin</option>
        </select>
<br>
        <input type="submit" value="submit" onclick="setDefaultStudentId()"/>

    </form:form>
</div>
<style>
    .error{
        color: red;
    }
</style>
<script>
    function setDefaultStudentId() {
        var studentIdField = document.getElementById("studentId");
        if (studentIdField.value === "") {
            studentIdField.value = "0"; // Set default value to 1
        }
    }
</script>
<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>





<%--<form:form action="processSignup" method="post" modelAttribute="signUp" class="signup-form">--%>

<%--    <!-- Name Input -->--%>
<%--    <label for="name">Name:</label>--%>
<%--    <form:input type="text" id="name" path="name" placeholder="Write your name" />--%>

<%--    <!-- Username Input -->--%>
<%--    <label for="userName">Username:</label>--%>
<%--    <form:input type="text" id="userName" path="userName" required="true" placeholder="Write  username" />--%>

<%--    <!-- Password Input -->--%>
<%--    <label for="password">Password:</label>--%>
<%--    <form:password id="password" path="password" required="true" placeholder="Write valid password" />--%>

<%--    <!-- Role Dropdown -->--%>
<%--    <label for="role">Role:</label>--%>
<%--    <form:select id="role" path="role">--%>
<%--        <form:option value="ROLE_USER">UserController</form:option>--%>
<%--        <form:option value="ROLE_ADMIN">Admin</form:option>--%>
<%--    </form:select>--%>

<%--    <!-- Submit Button -->--%>
<%--    <input type="submit" value="Signup">--%>

<%--</form:form>--%>








<%--<form action="processSignup" method="post" class="signup-form">--%>

<%--    <!-- Name Input -->--%>
<%--    <label for="name">Name:</label>--%>
<%--    <input type="text" id="name" name="name" placeholder="Write your name" />--%>

<%--    <!-- Username Input -->--%>
<%--    <label for="userName">Username:</label>--%>
<%--    <input type="text" id="userName" name="userName" required="true" placeholder="Write username" />--%>

<%--    <!-- Password Input -->--%>
<%--    <label for="password">Password:</label>--%>
<%--    <input type="password" id="password" name="password" required="true" placeholder="Write valid password" />--%>

<%--    <!-- Role Dropdown -->--%>
<%--    <label for="role">Role:</label>--%>
<%--    <select id="role" name="role">--%>
<%--        <option value="ROLE_USER">UserController</option>--%>
<%--        <option value="ROLE_ADMIN">Admin</option>--%>
<%--    </select>--%>

<%--    <!-- Submit Button -->--%>
<%--    <input type="submit" value="Signup">--%>

<%--</form>--%>
