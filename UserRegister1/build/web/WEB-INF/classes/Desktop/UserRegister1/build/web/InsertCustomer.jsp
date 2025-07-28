<%-- 
    Document   : InsertCustomer
    Created on : Jul 17, 2025, 9:49:49?AM
    Author     : ACER
--%>

<%@ page import="dao.CustomerDAO" %>
<%@ page import="dao.DivisionHistoryDAO" %>
<%@ page import="dao.AdminDAO" %>
<%@ page import="model.Customer" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Customer</title>
    <style>
        .modal {
            display: block;
            position: fixed;
            z-index: 9999;
            left: 0; top: 0; width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            width: 400px;
            margin: 10% auto;
            text-align: center;
        }
        .btn {
            padding: 10px 20px;
            margin-top: 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");

    String nic = request.getParameter("nic");
    String name = request.getParameter("name");
    String dobStr = request.getParameter("dob");
    String contactno = request.getParameter("contactno");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    String divitionIdStr = request.getParameter("divition");
    String[] paymentMethodIds = request.getParameterValues("paymentMethods");

    Integer addedBy = (Integer) session.getAttribute("adminId");

    if (addedBy == null) {
%>
        <div class="modal">
            <div class="modal-content">
                <h3>Admin not logged in. Cannot add customer.</h3>
                <button class="btn" onclick="closeModal()">OK</button>
            </div>
        </div>
<%
        return;
    }

    if(divitionIdStr == null || divitionIdStr.trim().equals("")) {
%>
        <div class="modal">
            <div class="modal-content">
                <h3>Division not selected.</h3>
                <button class="btn" onclick="closeModal()">OK</button>
            </div>
        </div>
<%
        return;
    }

    try {
        int divitionId = Integer.parseInt(divitionIdStr);
        Date dob = java.sql.Date.valueOf(dobStr);
        
        Customer customer = new Customer(nic, name, dob, contactno, gender, address, password, addedBy, divitionId);
        CustomerDAO customerDAO = new CustomerDAO();
        int customerId = customerDAO.insertCustomer(customer);

        if (customerId > 0) {
            DivisionHistoryDAO divisionHistoryDAO = new DivisionHistoryDAO();
            divisionHistoryDAO.insertDivisionHistory(customerId, divitionId);

            if (paymentMethodIds != null) {
                int[] pmIds = new int[paymentMethodIds.length];
                for (int i = 0; i < paymentMethodIds.length; i++) {
                    pmIds[i] = Integer.parseInt(paymentMethodIds[i]);
                }
                customerDAO.insertCustomerPaymentMethods(customerId, pmIds);
            }

            AdminDAO adminDAO = new AdminDAO();
            String adminName = adminDAO.getAdminName(addedBy);
%>
            <div class="modal">
                <div class="modal-content">
                    <h3>Customer registered successfully by Admin: <%= adminName %></h3>
                    <button class="btn" onclick="window.parent.location.href='Navigation.jsp'">OK</button>
                </div>
            </div>
<%
        } else {
%>
            <div class="modal">
                <div class="modal-content">
                    <h3>Error inserting customer.</h3>
                    <button class="btn" onclick="window.parent.location.href='Navigation.jsp'">OK</button>
                </div>
            </div>
<%
        }
    } catch (Exception e) {
%>
        <div class="modal">
            <div class="modal-content">
                <h3>Error: <%= e.getMessage() %></h3>
                <button class="btn" onclick="window.parent.location.href='Navigation.jsp'">OK</button>
            </div>
        </div>
<%
    }
%>

<script>
    function closeModal() {
        document.querySelector(".modal").style.display = "none";
        window.location.href = "Navigation.jsp"; // redirect if needed
    }
</script>

</body>
</html>
