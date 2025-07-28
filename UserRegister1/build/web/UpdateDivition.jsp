<%-- 
    Document   : UpdateDivition
    Created on : Jul 17, 2025, 9:50:55 AM
    Author     : ACER
--%>

<%@ page import="dao.CustomerDAO" %>
<%@ page import="dao.DivisionDAO" %>
<%@ page import="model.Division" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, dao.CustomerDAO, dao.DivisionDAO, model.Division" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer Division</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0e7ff, #c7d2fe);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #222;
            margin-bottom: 25px;
            text-shadow: 1px 1px 1px #ccc;
        }

        select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1.5px solid #ccc;
            margin-bottom: 25px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        select:focus {
            border-color: #4f46e5;
            outline: none;
            box-shadow: 0 0 5px rgba(79, 70, 229, 0.4);
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            color: white;
        }

        .btn-update {
            background: linear-gradient(90deg, #4f46e5, #4338ca);
        }

        .btn-update:hover {
            background: linear-gradient(90deg, #4338ca, #3730a3);
        }

        .btn-cancel {
            background: #6c757d;
        }

        .btn-cancel:hover {
            background: #5a6268;
        }

        .error-message {
            color: #d14343;
            margin-bottom: 20px;
            font-weight: 600;
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
    <p class="error-message">Customer ID not provided!</p>
<%
        return;
    }

    try {
        CustomerDAO customerDAO = new CustomerDAO();
        int currentDivitionId = customerDAO.getCurrentDivision(customerId);

        if (currentDivitionId == 0) {
%>
    <p class="error-message">No customer found with ID: <%= customerId %></p>
<%
            return;
        }

        DivisionDAO divisionDAO = new DivisionDAO();
        List<Division> divisions = divisionDAO.getAllDivisions();
%>
    <h2>Update Division for Customer ID: <%= customerId %></h2>
    <form method="post" action="UpdateDivitionAction.jsp">
        <input type="hidden" name="customerId" value="<%= customerId %>">
        <select name="newDivitionId" required>
<%
        for (Division division : divisions) {
            String selected = (division.getDivitionId() == currentDivitionId) ? "selected" : "";
%>
            <option value="<%= division.getDivitionId() %>" <%= selected %>><%= division.getName() %></option>
<%
        }
%>
        </select>
        <div class="button-group">
            <button type="submit" class="btn btn-update">Update</button>
        </div>
    </form>
<%
    } catch (Exception e) {
%>
    <p class="error-message">Error: <%= e.getMessage() %></p>
<%
    }
%>
</div>
</body>
</html>
