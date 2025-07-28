<%-- 
    Document   : GetCustomerDivition
    Created on : Jul 17, 2025, 9:50:14 AM
    Author     : ACER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enter Customer ID</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0e7ff, #c7d2fe);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #222;
            text-shadow: 1px 1px 1px #ccc;
        }

        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1.5px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
            margin-bottom: 20px;
        }

        input[type="number"]:focus {
            border-color: #4f46e5;
            outline: none;
            box-shadow: 0 0 5px rgba(79, 70, 229, 0.4);
        }

        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(90deg, #4f46e5, #4338ca);
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: linear-gradient(90deg, #4338ca, #3730a3);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Check Customer Division</h2>
        <form method="get" action="UpdateDivition.jsp">
            <input type="number" name="customerId" placeholder="Enter Customer ID" required>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>

