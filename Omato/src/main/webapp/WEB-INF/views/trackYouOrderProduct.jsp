
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .main-content {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin: 20px;
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
        .delete {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: red;
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
            text-align: center;
        }
        .subtotal-box {
            background-color: greenyellow;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 10.1);
            align-self: flex-end;
        }
    </style>
</head>
<body>
<header>
    <div class="home-button">
        <a href="user">
            <img src="https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/home-button-icon.png" alt="Home">
        </a>
    </div>
    OMATO
    <div class="logout-button">
        <a href="/Omato/logout">
            <img src="https://i.pinimg.com/474x/b7/88/59/b78859e759a9dba9949ff641c185d08a.jpg" alt="LogOut" style="width: 30px; height: 30px;">
        </a>
    </div>
</header><hr>
<h2>Your Order Details</h2><hr>
<div class="main-content">
    <c:forEach items="${view}" var="product">
        <div class="product-container">
            <img src="${product.product_imageUrl}" alt="Product Image" class="product-image">
            <div class="product-details">
                <p class="product-id">
                    <strong>Product ID:</strong> ${product.product_id}<br>
                </p>
                <p>
                <h2><strong></strong> ${product.product_name}<br></h2>
                <strong>Price:</strong> ${product.product_price}<br>
                <strong>Category:</strong> ${product.product_category}<br>
                <strong>Quantity:</strong>${product.quantity}<br>
                <strong>Order Time:</strong>${product.createdAt}
            </div>
        </div>
    </c:forEach>
        <h3 style="background-color: #4CAF50">Subtotal (${totalItems} item): ${subtotal}</h3>
</div>
<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
