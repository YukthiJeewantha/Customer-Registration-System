<%-- 
    Document   : AdminLogin
    Created on : Jul 17, 2025, 9:46:46?AM
    Author     : ACER
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f0f2f5, #c9d6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        .company-name {
            font-size: 30px;
            font-weight: bold;
            color: #4f46e5;
            margin-bottom: 10px;
            text-shadow: 1px 1px 2px #ccc;
        }

        h2 {
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 500;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="company-name">SoftWatch</div>
        <h2>Admin Login</h2>
        <form method="post" action="AdminLoginAction.jsp">
            <label for="name">Admin Name:</label>
            <input type="text" id="name" name="name" required />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />

            <input type="submit" value="Login" />
        </form>
    </div>
</body>
</html>

