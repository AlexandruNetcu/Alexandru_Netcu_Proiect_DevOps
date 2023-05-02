<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>DevOps Project</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
     integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
     crossorigin="anonymous">
    <style>
      /* Body styles */
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }
      
      /* Header styles */
      header {
        background-color: #444;
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      
      /* Navigation bar styles */
      nav {
        display: flex;
        gap: 20px;
      }
      
      /* Navigation bar link styles */
      nav a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        padding: 10px;
        border-radius: 5px;
      }
      
      /* Navigation bar link hover styles */
      nav a:hover {
        background-color: #555;
      }
      
      /* Main styles */
      main {
        padding: 20px;
        max-width: 800px;
        margin: 0 auto;
      }
      
      /* Login form styles */
      form label, form input {
        display: block;
        margin-bottom: 10px;
      }
      
      form input[type="submit"] {
        background-color: #444;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      
      form input[type="submit"]:hover {
        background-color: #555;
      }
      
      /* Footer styles */
      footer {
        background-color: #ccc;
        padding: 20px;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <header>
      <h1>DevOps Project</h1>
      <nav>
       <ul class="nav">
        <li class="nav-item"><a class="nav-link" href="https://www.google.com/search?q=irina+loghin" target="_blank">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="https://casebune.ro/" target="_blank">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="https://www.auto-soft.ro/" target="_blank">Services</a></li>
        <li class="nav-item"><a class="nav-link" href="https://www.aboutyou.ro/magazinul-tau" target="_blank">About</a></li>
        <li class="nav-item"><a class="nav-link" href="https://www.youtube.com/watch?v=HrJI-XgQCAw" target="_blank">Contact</a></li>
      </ul>
      </nav>
    </header>
    
    <main>
      <h2>Welcome to DevOps Project</h2>
      <p>To take down one server is human. To take down 10,000 servers is DevOps! </p>
      
      <section>
        <h2>Login</h2>
        <form>
          <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" name="username" required>
          </div>
          
          <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          
          <button type="submit" class="btn btn-primary">Login</button>
        </form>
      </section>
    </main>
    
    <footer class="bg-light py-3">
      <div class="container text-center">
        <p>&copy; 2023 DevOps Project - Coordonator shadowman88</p>
      </div>
    </footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
            integrity="sha384-xrp90tzj9tLg+EB52dNtTPh81OvYCpGy7UPCjFngJ+2k8+BvqmXV7ArtoVRbKjWw"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-cREIeSkjrDjc1pxvXyW9Ic+bl5frEUC5idwvQZJh7E5A2kSP+MyKzzJCH1Wxm7AE"
            crossorigin="anonymous"></script>
  <script type="text/javascript" src="script.js"></script>
  </body>
</html>

