<%-- 
    Document   : AddCustomer.jsp
    Created on : Jul 17, 2025, 9:47:49 AM
    Author     : ACER
--%>

<%@ page import="dao.DivisionDAO" %>
<%@ page import="dao.PaymentMethodDAO" %>
<%@ page import="model.Division" %>
<%@ page import="model.PaymentMethod" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f0f2f5, #a1c4fd);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 500px;
            max-height: 90vh;
            overflow-y: auto;
            border-left: 6px solid #007bff;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            text-shadow: 1px 1px 1px #ccc;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #444;
        }

        input[type="text"],
        input[type="date"],
        input[type="password"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            transition: 0.3s ease;
            background-color: #f9f9f9;
        }

        input:focus,
        select:focus,
        textarea:focus {
            border-color: #007bff;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        .checkbox-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: normal;
            background-color: #f1f1f1;
            padding: 8px 10px;
            border-radius: 5px;
        }

        .checkbox-group input[type="checkbox"] {
            margin-right: 8px;
        }

        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(90deg, #007bff, #0056b3);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease;
            margin-top: 10px;
        }

        button:hover {
            background: linear-gradient(90deg, #0056b3, #003e80);
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Register New Customer</h2>
        <form method="post" action="InsertCustomer.jsp">
            <label for="nic">NIC:</label>
            <input type="text" name="nic" id="nic" required>

            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required>

            <label for="dob">DOB:</label>
            <input type="date" name="dob" id="dob" required>

            <label for="contactno">Contact No:</label>
            <input type="text" name="contactno" id="contactno" required>

            <label for="gender">Gender:</label>
            <select name="gender" id="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>

            <label for="address">Address:</label>
            <textarea name="address" id="address" required></textarea>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>

            <label for="divition">Division:</label>
            <select name="divition" id="divition" required>
                <%
                    try {
                        DivisionDAO divisionDAO = new DivisionDAO();
                        List<Division> divisions = divisionDAO.getAllDivisions();
                        for (Division division : divisions) {
                %>
                            <option value="<%= division.getDivitionId() %>"><%= division.getName() %></option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<option disabled>Error loading divisions</option>");
                    }
                %>
            </select>

            <label>Payment Methods:</label>
            <div class="checkbox-group">
                <%
                try {
                    PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
                    List<PaymentMethod> paymentMethods = paymentMethodDAO.getAllPaymentMethods();
                    for (PaymentMethod paymentMethod : paymentMethods) {
                %>
                        <label>
                            <input type="checkbox" name="paymentMethods" value="<%= paymentMethod.getMethodId() %>">
                            <%= paymentMethod.getMethodName() %>
                        </label>
                <%
                    }
                } catch (Exception e) {
                    out.println("<p class='error'>Error loading payment methods</p>");
                }
                %>
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
