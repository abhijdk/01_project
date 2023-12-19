<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OTP Verification</title>
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
        }

        .container {
            background-color: antiquewhite;
            width: 300px;
            margin: auto;
            margin-top: 50px;
        }
        .thank-you-box {
            background-color: green;
            padding: 5px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
            text-align: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>

    <!-- Add JavaScript for client-side validation -->
    <script>
        function validateOTP() {
            var otpInput = document.getElementById("otp");
            var otpValue = otpInput.value.trim();

            // Check if the entered OTP is exactly 6 digits
            if (otpValue.length !== 6 || isNaN(otpValue)) {
                alert("Please enter a valid 6-digit OTP.");
                otpInput.focus();
                return false;
            }

            return true;
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
<div class="thank-you-box">
    <p id="subtotal">Subtotal (${totalItems} item): ${subtotal}</p>
</div>
<h1 style="background-color: red; color: white; text-align: center;">${error}</h1>

<div class="container">
    <h2>OTP Verification</h2><hr>
<%--    <h2>We sended otp to your mobile number (${view}), please enter the otp</h2><hr>--%>
    <h2>We sended otp to your mobile number , please enter the otp</h2><hr>
    <form action="/Omato/user/success" method="get">

        <label for="subtotal"></label>
        <input type="hidden" id="subtotal2" value="${subtotal}" name="subtotal" required><br>

        <label for="totalItems"></label>
        <input type="hidden" id="totalItems" value="${totalItems}" name="totalItems" required><br>

        <label for="mobile"></label>
        <input type="hidden" id="mobile" value="${view}" name="mobile" required><br>

        <label for="otp">Enter Your Otp :</label>
        <input type="text" id="otp"  name="otp" required><br>



        <!-- Proceed to Buy button -->
        <button type="submit" class="add-to-cart-btn2">Conform Otp</button>
    </form>



</div>

<h6 style="background-color: yellow;text-align: center;color: red">You will find your otp in your console</h6>
<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>










































<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>OTP Verification</title>--%>
<%--    <style>--%>

<%--        header {--%>
<%--            background-color: #007BFF;--%>
<%--            color: white;--%>
<%--            padding: 10px;--%>
<%--            text-align: center;--%>
<%--            font-size: 24px;--%>
<%--            font-weight: bold;--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--        }--%>

<%--        .login-button {--%>
<%--            margin-right: 10px;--%>
<%--        }--%>

<%--        footer {--%>
<%--            background-color: #007BFF;--%>
<%--            color: white;--%>
<%--            padding: 5px;--%>
<%--            text-align: center;--%>
<%--            font-size: 12px;--%>
<%--            font-weight: bold;--%>
<%--            position: fixed;--%>
<%--            bottom: 0;--%>
<%--            width: 100%;--%>
<%--        }--%>

<%--        .home-button img {--%>
<%--            width: 30px;--%>
<%--            height: 30px;--%>
<%--            margin-right: 10px;--%>
<%--        }--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--        }--%>

<%--        .container {--%>
<%--            width: 300px;--%>
<%--            margin: auto;--%>
<%--            margin-top: 50px;--%>
<%--        }--%>
<%--        .thank-you-box {--%>
<%--            background-color: green;--%>
<%--            padding: 5px;--%>
<%--            border-radius: 5px;--%>
<%--            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);--%>
<%--            margin-top: 10px;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        input {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            margin: 10px 0;--%>
<%--        }--%>

<%--        button {--%>
<%--            padding: 10px;--%>
<%--            background-color: #4CAF50;--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>
<%--    </style>--%>

<%--    <!-- Add JavaScript for client-side validation -->--%>
<%--    <script>--%>
<%--        function validateOTP() {--%>
<%--            var otpInput = document.getElementById("otp");--%>
<%--            var otpValue = otpInput.value.trim();--%>

<%--            // Check if the entered OTP is exactly 6 digits--%>
<%--            if (otpValue.length !== 6 || isNaN(otpValue)) {--%>
<%--                alert("Please enter a valid 6-digit OTP.");--%>
<%--                otpInput.focus();--%>
<%--                return false;--%>
<%--            }--%>

<%--            return true;--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>

<%--<header>--%>
<%--    <div class="home-button">--%>
<%--        <a href="user">--%>
<%--            <img src="https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/home-button-icon.png"--%>
<%--                 alt="Home">--%>
<%--        </a>--%>
<%--    </div>--%>
<%--    OMATO--%>
<%--    <div class="logout-button">--%>
<%--        <a href="/Omato/logout">--%>
<%--            <img src="https://i.pinimg.com/474x/b7/88/59/b78859e759a9dba9949ff641c185d08a.jpg" alt="LogOut" style="width: 30px; height: 30px;">--%>
<%--        </a>--%>
<%--    </div>--%>
<%--</header>--%>
<%--<div class="thank-you-box">--%>
<%--    <p id="subtotal">Subtotal (${totalItems} item): ${subtotal}</p>--%>
<%--</div>--%>
<%--<div class="container">--%>
<%--    <h2>OTP Verification</h2><hr>--%>
<%--    <h2>We sended otp to your mobile number (${view}), please enter the otp</h2><hr>--%>
<%--    <form action="/Omato/user/success?totalItems=${totalItems}&subtotal=${subtotal}&otp=" method="post" onsubmit="return validateOTP()">--%>
<%--        <label for="otp">Enter OTP:</label>--%>
<%--        <input type="text" id="otp" name="otp" maxlength="6" required>--%>
<%--        <button type="submit" onclick="this.form.action += document.getElementById('otp').value;">Verify OTP</button>--%>
<%--    </form>--%>



<%--</div>--%>

<%--<footer>--%>
<%--    Copyright ©️ AbhinnaSundarBehuria--%>
<%--</footer>--%>
<%--</body>--%>
<%--</html>--%>
