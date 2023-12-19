<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Omato</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://www.shutterstock.com/image-vector/indian-dishes-serving-cartoon-vector-260nw-1679358574.jpg');
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

        .container {
            margin: 10px;
            background: rgba(255, 255, 255, 0.3);
            padding: 10px;
            border-radius: 10px;
        }

        .food-menu {
            text-align: center;
            margin-top: 20px;
        }

        .food-menu a {
            text-decoration: none;
            color: #007BFF; /* Set the button text color */
            background-color: white; /* Set the button background color */
            padding: 10px 20px;
            border: 1px solid #007BFF; /* Set the button border color */
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s; /* Add smooth transition */
        }

        .food-menu a:hover {
            color: white;
            background-color: #007BFF;
        }

        .home-button img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<header>
    <div class="home-button">
        <a href="#">
            <img src="https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/home-button-icon.png" alt="Home">
        </a>
    </div>
    OMATO
    <div class="logout-button">
        <a href="signup">
            <img src="https://i.pinimg.com/564x/6c/f4/55/6cf455662d1117039a9e39a3cb9e51ea.jpg" alt="signup" style="width: 100px; height: 40px;">
        </a>
        <a href="login">
            <img src="https://i.pinimg.com/736x/e8/25/02/e82502d76e7e6bf54a50a35c3f0a5809.jpg" alt="login" style="width: 100px; height: 40px;">
        </a>
    </div>
</header>


<div class="container">
    <h2>Welcome to Omato</h2>
    <p>
        From swanky upscale restaurants to the cosiest hidden gems
        serving the most incredible food, Zomato covers it all.
        Explore menus, and millions of restaurant photos and reviews
        from users just like you, to find your next great meal.
    </p>

    <!-- Login button section -->
    <div class="food-menu">
        <a href="foodMenuAccordingToCategory?product_category=veg">Veg Food Menu</a>
        <a href="foodMenuAccordingToCategory?product_category=nonVeg">Non Veg Food Menu</a>
        <a href="foodMenuAccordingToCategory?product_category=coke">Coke Menu</a>
        <a href="foodMenuAccordingToCategory?product_category=fruits">Fruits Menu</a>
        <a href="foodMenuAccordingToCategory?product_category=ice">Cold / Ice  Menu</a>
        <a href="foodMenuAccordingToCategory?product_category=snacks">Snacks  Menu</a>
        <a href="foodMenuAccordingToCategory?product_category=other">Other  Menu</a>
        <a href="allFoodMenu">All Food Menu</a>
        <%--        <a href="user/user">UserController Login</a> | <a href="admin/admin">Admin Login</a>--%>
    </div>
</div>

<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>
