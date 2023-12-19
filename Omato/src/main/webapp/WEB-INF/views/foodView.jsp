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
      margin-right:50px;
    }

    .product-details {
      flex-grow: 1;
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
      .add-to-cart-btn {
          margin-top: 10px;
          padding: 5px 10px;
          background-color: #4CAF50;
          color: white;
          text-decoration: none;
          border-radius: 5px;
      }
      .view-cart {
          margin-top: 0.5px;
          padding: 15px 110px;
          background-color: #4CAF50;
          color: yellow;
          text-decoration: none;
          border-radius: 115px;
          float: right; /* Use float property to align the link to the right */
      }
      .track-order {
          margin-top: 0.5px;
          padding: 15px 110px;
          background-color: #4CAF50;
          color: yellow;
          text-decoration: none;
          border-radius: 115px;
          float: unset ; /* Use float property to align the link to the right */
      }
      .food-catagory {
          margin-top: 10px;
          padding: 5px 10px;
          background-color: #4CAF50;
          color: white;
          text-decoration: none;
          border-radius: 100px;
          float: left; /* Use float property to align the link to the right */
      }
      .nonr-none {
          margin-top: 10px;
          padding: 5px 10px;
          background-color: mediumorchid;
          color: white;
          text-decoration: none;
          /*border-radius: 100px;*/
          float: left; /* Use float property to align the link to the right */
      }
      .none-none {
          margin-top: 10px;
          padding: 15px 25px;
          background-color: blue;
          color: white;
          text-decoration: none;
          border-radius: 100px;
          float: revert; /* Use float property to align the link to the right */
      }




      .add-to-cart-btn2 {
      margin-top: 10px;
      padding: 5px 10px;
      background-color: white;
      color: darkgreen;
      text-decoration: none;
      border-radius: 5px;
    }

    .product-id {
      display: none; /* Hide the Product ID */
    }
  </style>
</head>
<body>

<header>
    <div class="home-button">
        <a href="#">
            <img src="https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/home-button-icon.png" alt="Home">
        </a>
    </div>Omato
    <div class="logout-button">
        <a href="/Omato/logout">
            <img src="https://i.pinimg.com/474x/b7/88/59/b78859e759a9dba9949ff641c185d08a.jpg" alt="LogOut" style="width: 30px; height: 30px;">
        </a>
    </div>
</header>

<form action="search" method="GET" style="text-align: center; margin-top: 20px;">
    <label for="search" style="color: blue; font-weight: bold;">Search:</label>
    <input type="text" id="search" name="search" placeholder="Enter keywords..." style="padding: 5px; border: 1px solid goldenrod; border-radius: 3px;">
    <input type="submit" value="Search" style="background-color: goldenrod; color: white; padding: 5px 10px; border: none; border-radius: 3px; cursor: pointer;">
</form>




<div class="container">
    <h2>Hello!!! Mr. ${name} <a href="cartView" class="view-cart">View Cart</a></h2><hr>
<div class="food-menu"  >
    <a href="#" class="nonr-none">Food Catagory:</a>
    <a href="foodMenuAccordingToCategory?product_category=veg" class="food-catagory">Veg Food Menu</a>
    <a href="foodMenuAccordingToCategory?product_category=nonVeg" class="food-catagory">Non Veg Food Menu</a>
    <a href="foodMenuAccordingToCategory?product_category=coke" class="food-catagory">Coke Menu</a>
    <a href="foodMenuAccordingToCategory?product_category=fruits" class="food-catagory">Fruits Menu</a>
    <a href="foodMenuAccordingToCategory?product_category=ice" class="food-catagory">Cold / Ice  Menu</a>
    <a href="foodMenuAccordingToCategory?product_category=snacks" class="food-catagory">Snacks  Menu</a>
    <a href="foodMenuAccordingToCategory?product_category=other" class="food-catagory">Other  Menu</a>
    <a href="allFoodMenu" class="food-catagory">All Food Menu</a>
    <a href="trackYouOrder" class="none-none">Track You Order</a>

<%--    <a href="trackYouOrder" style="background-color: mediumorchid">trackYouOrder${trackYouOrder}</a>--%>
    <%--        <a href="user/user">UserController Login</a> | <a href="admin/admin">Admin Login</a>--%>
</div>
</div><br><hr>
<h2>Omato Products</h2>
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
        <strong>Category:</strong> ${product.product_category}
      </p>
      <a href="addToCart?product_id=${product.product_id}" class="add-to-cart-btn">Add to Cart</a>
    </div>
  </div>
</c:forEach>

<footer>
    Copyright ©️ AbhinnaSundarBehuria
</footer>
</body>
</html>



