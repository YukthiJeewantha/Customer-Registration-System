<%-- 
    Document   : ViewCustomer
    Created on : Jul 17, 2025, 9:52:06 AM
    Author     : ACER
--%>

<%@ page import="dao.CustomerDAO" %>
<%@ page import="dao.PaymentMethodDAO" %>
<%@ page import="model.Customer" %>
<%@ page import="model.DivisionHistory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Customer, model.DivisionHistory, dao.CustomerDAO, dao.PaymentMethodDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f2fe, #f0f9ff);
            margin: 0;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 16px;
            max-width: 900px;
            margin: 40px auto;
            padding: 40px 50px;
            box-shadow: 0 12px 36px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: scale(1.01);
        }

        h2, h3 {
            color: #0f172a;
            margin-bottom: 20px;
            border-bottom: 3px solid #bae6fd;
            padding-bottom: 10px;
        }

        p {
            margin: 10px 0;
            font-size: 16px;
            color: #334155;
        }

        b {
            color: #1e293b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 16px;
            border: 1px solid #e2e8f0;
            text-align: left;
        }

        th {
            background-color: #0284c7;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f0f9ff;
        }

        .no-data {
            text-align: center;
            color: #64748b;
            padding: 12px;
        }

        .error, .success {
            margin-top: 20px;
            padding: 15px 20px;
            border-radius: 8px;
            font-weight: 500;
        }

        .error {
            background-color: #fecaca;
            color: #7f1d1d;
        }

        .success {
            background-color: #bbf7d0;
            color: #166534;
        }

        .back-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 24px;
            background-color: #0ea5e9;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #0369a1;
        }

        .highlight-box {
            background-color: #f0f9ff;
            padding: 14px 20px;
            border-radius: 10px;
            margin-bottom: 15px;
            border-left: 4px solid #38bdf8;
        }
    </style>
</head>
<body>
<div class="container">
<%
    String cidStr = request.getParameter("customerId");
    int customerId = 0;

    if (cidStr != null && !cidStr.trim().equals("")) {
        customerId = Integer.parseInt(cidStr);
    } else {
%>
    <div class="error"><strong>Error:</strong> Please provide a Customer ID.</div>
</div>
</body>
</html>
<%
        return;
    }

    try {
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerById(customerId);

        if (customer != null) {
%>
    <h2>Customer Details</h2>

    <div class="highlight-box"><b>Customer ID:</b> <%= customer.getCustomerId() %></div>
    <div class="highlight-box"><b>Name:</b> <%= customer.getName() %></div>
    <div class="highlight-box"><b>NIC:</b> <%= customer.getNic() %></div>
    <div class="highlight-box"><b>DOB:</b> <%= customer.getDob() %></div>
    <div class="highlight-box"><b>Contact:</b> <%= customer.getContactno() %></div>
    <div class="highlight-box"><b>Gender:</b> <%= customer.getGender() %></div>
    <div class="highlight-box"><b>Address:</b> <%= customer.getAddress() %></div>
    <div class="highlight-box"><b>Division:</b> <%= customer.getDivisionName() %></div>
    <div class="highlight-box"><b>Registered By:</b> <%= customer.getAdminName() %></div>

    <h3>Payment Methods</h3>
    <%
        PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
        List<String> paymentMethods = paymentMethodDAO.getCustomerPaymentMethods(customerId);

        if (!paymentMethods.isEmpty()) {
            for (String method : paymentMethods) {
    %>
        <div class="highlight-box">- <%= method %></div>
    <%
            }
        } else {
    %>
        <div class="no-data">No payment methods assigned.</div>
    <%
        }
    %>

    <h3>Division History</h3>
    <table>
        <tr>
            <th>Division</th>
            <th>Start Date</th>
            <th>End Date</th>
        </tr>
    <%
        List<DivisionHistory> history = customerDAO.getCustomerDivisionHistory(customerId);

        if (!history.isEmpty()) {
            for (DivisionHistory divHistory : history) {
    %>
        <tr>
            <td><%= divHistory.getDivisionName() %></td>
            <td><%= divHistory.getStartDate() %></td>
            <td><%= (divHistory.getEndDate() != null) ? divHistory.getEndDate() : "Current" %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="3" class="no-data">No division history available.</td>
        </tr>
    <%
        }
    %>
    </table>

    <a href="SearchCustomer.jsp" class="back-btn">← Back to Search</a>
<%
        } else {
%>
    <div class="error"><strong>Error:</strong> No customer found with ID: <%= customerId %></div>
<%
        }
    } catch (Exception e) {
%>
    <div class="error"><strong>Exception:</strong> <%= e.getMessage() %></div>
<%
    }
%>
</div>
</body>
</html>
