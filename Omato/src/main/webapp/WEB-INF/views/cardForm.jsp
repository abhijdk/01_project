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

        .product-details {
            flex-grow: 1;
        }

        .add-to-cart-btn2 {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: green;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        /* Additional styles for debit card form */
        form .debit-card-details {
            display: flex;
            flex-direction: column;
        }
    </style>

    <!-- Add JavaScript to dynamically show/hide debit card details -->
    <script>
        function showDebitCardDetails() {
            var debitCardDetails = document.getElementById("debitCardDetails");
            debitCardDetails.style.display = "block";
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

        <!-- Updated form with debit card details -->
        <form action="/Omato/user/otp" method="get">
            <h2>Give Debit Card Details for Payment</h2>

            <label for="subtotal"></label>
            <input type="hidden" id="subtotal2" value="${subtotal}" name="subtotal" required><br>

            <label for="totalItems"></label>
            <input type="hidden" id="totalItems" value="${totalItems}" name="totalItems" required><br>

            <label for="mobile"></label>
            <input type="hidden" id="mobile" value="9000000000" name="mobile" required><br>

            <!-- Button to show/hide debit card details -->
            <button type="button" onclick="showDebitCardDetails()">Provide Debit Card Details</button>

            <!-- Debit card details section (initially hidden) -->
            <div id="debitCardDetails" style="display: none;" class="debit-card-details">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required><br>

                <label for="expiryDate">Expiry Date:</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required><br>

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" required><br>
            </div>

            <!-- Proceed to Buy button -->
            <button type="submit" class="add-to-cart-btn2">Use This Card</button>
        </form>

    </div>

    <!-- Thank you message box remains unchanged -->
</div>

<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
