<%-- 
    Document   : UpdateDivitionAction
    Created on : Jul 17, 2025, 9:51:26?AM
    Author     : ACER
--%>

<%@ page import="dao.CustomerDAO" %>
<%@ page import="dao.DivisionHistoryDAO" %>
<%@ page import="dao.CustomerDAO, dao.DivisionHistoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Division Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .popup {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
        }

        .popup h3 {
            margin-bottom: 15px;
            font-size: 22px;
        }

        .success {
            color: #16a34a;
        }

        .error {
            color: #dc2626;
        }

        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background: #4f46e5;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
        }

        .btn:hover {
            background: #4338ca;
        }
    </style>
</head>
<body>
<div class="popup">
<%
    int customerId = Integer.parseInt(request.getParameter("customerId"));
    int newDivitionId = Integer.parseInt(request.getParameter("newDivitionId"));

    try {
        CustomerDAO customerDAO = new CustomerDAO();
        DivisionHistoryDAO divisionHistoryDAO = new DivisionHistoryDAO();

       
        customerDAO.updateCustomerDivision(customerId, newDivitionId);

       
        divisionHistoryDAO.endCurrentDivisionHistory(customerId);

        
        divisionHistoryDAO.insertNewDivisionHistory(customerId, newDivitionId);
%>
    <h3 class="success">✔ Division updated successfully!</h3>
    <button class="btn" onclick="window.parent.location.href='Navigation.jsp'">Back</button>
<%
    } catch (Exception e) {
%>
    <h3 class="error">✖ Error: <%= e.getMessage() %></h3>
    <button class="btn" onclick="window.history.back()">Try Again</button>
<%
    }
%>
</div>
</body>
</html>
