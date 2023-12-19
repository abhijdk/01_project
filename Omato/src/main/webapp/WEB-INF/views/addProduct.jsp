<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Add Product</title>
    <style>header {
        background-color: #007BFF;
        color: white;
        padding: 10px;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        display: flex;
        justify-content: space-between;
    }
    .logout-button {
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
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<header>
    <div class="home-button">
        <a href="/Omato/admin/admin">
            <img src="https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/home-button-icon.png" alt="Home">
        </a>
    </div>
    OMATO
    <div class="logout-button">
        <a href="/Omato/logout">
            <img src="https://i.pinimg.com/474x/b7/88/59/b78859e759a9dba9949ff641c185d08a.jpg" alt="LogOut" style="width: 30px; height: 30px;">
        </a>
    </div>
</header>

<div class="container">
    <h2>Add Product</h2>
    <form action="addProductToDb" method="post">
        <label for="product_name">Product Name:</label>
        <input type="text" id="product_name" name="product_name" required>

        <label for="product_price">Product Price:</label>
        <input type="number" id="product_price" name="product_price" required>

        <label for="product_category">Product Category:</label>
        <select id="product_category" name="product_category">
            <option value="veg">Vegetarian</option>
            <option value="nonVeg">Non-Vegetarian</option>
            <option value="coke">Coke</option>
            <option value="fruits">Fruits</option>
            <option value="ice">Ice</option>
            <option value="snacks">Snacks</option>
            <option value="sweets">Sweets</option>
            <option value="other">Other's</option>
        </select>

        <label for="product_imageUrl">Product Image URL:</label>
        <input type="url" id="product_imageUrl" name="product_imageUrl" required>

        <input type="submit" value="Add Product">
    </form>
</div>


<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
