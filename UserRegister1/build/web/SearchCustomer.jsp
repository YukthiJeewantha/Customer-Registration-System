<%-- 
    Document   : SearchCustomer
    Created on : Jul 17, 2025, 9:51:48?AM
    Author     : ACER
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Search Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f2fe, #c7d2fe);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 400px;
        }

        h2 {
            color: #1f2937;
            margin-bottom: 25px;
            text-shadow: 1px 1px 1px #ccc;
        }

        input[type="number"] {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1.5px solid #ccc;
            font-size: 16px;
            margin-bottom: 25px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="number"]:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 6px rgba(59, 130, 246, 0.4);
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(90deg, #3b82f6, #2563eb);
            color: #fff;
            font-weight: 600;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
        }

        button:hover {
            background: linear-gradient(90deg, #2563eb, #1d4ed8);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Search Customer by ID</h2>
        <form method="get" action="ViewCustomer.jsp">
            <input type="number" name="customerId" placeholder="Enter Customer ID" required>
            <button type="submit">Search</button>
        </form>
    </div>
</body>
</html>
