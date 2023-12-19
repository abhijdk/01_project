<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Success</title>
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
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            width: 50%;
            margin: auto;
            margin-top: 50px;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .success-message {
            color: #4CAF50;
            font-size: 20px;
            margin-bottom: 20px;
        }

        .delivery-message {
            color: #007BFF;
            font-size: 18px;
            margin-top: 20px;
            animation: fadeIn 2s;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
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
<div class="container">
    <div class="success-message">
        <p>Your order was successful!</p>
        <p>Order Date Time: ${time}</p>
        <p>Number of Products: ${totalItems}</p>
        <p>Total Amount: ${subtotal}</p>
        <p>Order ID: ${orderId}</p>
        <h1 style="color: red;">${readyTheCash}</h1>

    </div>
    <div class="delivery-message">
        <p>Your order is out for delivery. Sit back and relax!</p>
    </div>
</div>
<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
