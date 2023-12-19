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
        <form action="processPayment" method="post" onsubmit="redirectToProcessPayment()">

            <div class="address-box">
                Delivery Address
                <h4>Name: ${orderDetails.name}</h4>
                <h4>Address: ${orderDetails.address}</h4>
                <h4>City: ${orderDetails.city}</h4>
                <h4>Landmark: ${orderDetails.landmark}</h4>
                <h4>Pincode: ${orderDetails.pincode}</h4>
                <h4>Mobile: ${orderDetails.mobile}</h4>
                <h3>Email: ${orderDetails.email}</h3>
                <h3>DeliveryType: ${orderDetails.deliveryType}</h3>
            </div>

        </form>

    </div>
    <div class="product-details">

        <!-- Add the form with the specified fields -->
        <form action="processPayment?totalItems=${totalItems} &subtotal=${subtotal}" method="post" onsubmit="redirectToProcessPayment()">

            <h2>Select Payment Option:</h2>
            <div class="total-box">
            </div>
            <label><input type="radio" name="paymentOption" value="cashOnDelivery"> Cash on Delivery</label><br>
            <label><input type="radio" name="paymentOption" value="upi"> UPI ID</label><br>
            <label><input type="radio" name="paymentOption" value="phonePe"> PhonePe</label><br>
            <label><input type="radio" name="paymentOption" value="paytm"> Paytm</label><br>
            <label><input type="radio" name="paymentOption" value="gPay"> Google Pay (gPay)</label><br>
            <label><input type="radio" name="paymentOption" value="debitCard"> Debit Card</label><br>
            <label><input type="radio" name="paymentOption" value="creditCard"> Credit Card</label><br>

            <br><br>
            <input type="submit" value="Proceed to Payment">

        </form>

    </div>

    <!-- Thank you message box -->
    <div class="thank-you-box">
        <p id="subtotal">Subtotal (${totalItems} item): ${subtotal}</p>
    </div>
</div>

<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
