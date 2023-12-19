<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Omato Products</title>
    <style>
        header {
            background-color: #007BFF;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
        }

        .login-button {
            margin-right: 10px;
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

        .home-button img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .product-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            text-align: left;
        }

        .product-image {
            max-width: 500px;
            max-height: 500px;
            margin-right: 50px;
        }

        .product-details {
            flex-grow: 1;
        }

        .add-to-cart-btn {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .add-to-cart-btn2 {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: green;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .product-id {
            display: none; /* Hide the Product ID */
        }

        /* Box styles for thank you message */
        .thank-you-box {
            background-color: yellow;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            text-align: center;
        }

        /* Add some colorful design to the form */
        form {
            background-color: #f2f2f2;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        form label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        form input,
        form select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        form button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #45a049;
        }

        .custom-radio-label {
            display: inline-block;
            padding: 10px;
            margin: 5px;
            background-color: gray;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .custom-radio:checked + .custom-radio-label {
            background-color: #45a049;
        }
    </style>

    <!-- Add JavaScript to dynamically update subtotal -->
    <script>
        function updateSubtotal() {
            var viewElement = document.getElementById("view");
            var standardRadio = document.getElementById("standard");
            var subtotal = standardRadio.checked ? parseInt(viewElement.value) + 30 : parseInt(viewElement.value);

            document.getElementById("subtotal").innerText = "Subtotal (1 item): $" + subtotal;
        }
    </script>
</head>
<body>

<header>
    <div class="home-button">
        <a href="user">
            <img src="https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/home-button-icon.png"
                 alt="Home">
        </a>
    </div>
    OMATO
    <div class="logout-button">
        <a href="/Omato/logout">
            <img src="https://i.pinimg.com/474x/b7/88/59/b78859e759a9dba9949ff641c185d08a.jpg" alt="LogOut" style="width: 30px; height: 30px;">
        </a>
    </div>
</header>

<div class="product-container">
    <div class="product-details">

        <!-- Add the form with the specified fields -->
        <form:form action="/Omato/user/otp" method="get" modelAttribute="orderDetails">
            <h2>Give Mobile Number for Payment</h2>

            <label for="subtotal"></label>
            <input type="hidden" id="subtotal2" value="${subtotal}" name="subtotal" required><br>

            <label for="totalItems"></label>
            <input type="hidden" id="totalItems" value="${totalItems}" name="totalItems" required><br>

<%--            <label for="mobile">Mobile Number:</label>--%>
<%--            <input type="text" id="mobile" name="mobile" required><br>--%>
            <label>Mobile Number:</label><br>(India +91 )
            <form:input path="mobile" />
            <form:errors path="mobile" cssClass="error"/>
            <br />


            <!-- Proceed to Buy button -->
            <button type="submit" class="add-to-cart-btn2">Send Otp</button>
        </form:form>

    </div>

    <!-- Thank you message box -->
    <div class="thank-you-box">
        <p id="subtotal">Subtotal (${totalItems} item): ${subtotal}</p>
    </div>
</div>
<style>
    .error{
        color: red;
    }
</style>
<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
