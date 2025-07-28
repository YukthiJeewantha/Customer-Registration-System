<%-- 
    Document   : Navigation
    Created on : Jul 17, 2025, 9:52:23 AM
    Author     : ACER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f0f2f5, #c9d6ff);
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #343a40;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
        }

        .company-name {
            font-size: 24px;
            font-weight: bold;
        }

        .logout-btn {
            background-color: #dc3545;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            text-decoration: none;
        }

        .logout-btn:hover {
            background-color: #b52a36;
        }

        nav {
            background-color: #007bff;
            display: flex;
            padding: 12px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 10px;
            border-radius: 6px;
            transition: background-color 0.3s;
            font-weight: 500;
            cursor: pointer;
        }

        nav a:hover {
            background-color: #0056b3;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            text-align: center;
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            padding-top: 80px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: auto;
            padding: 30px 20px 20px 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 700px;
            max-height: 80vh;
            position: relative;
            overflow: hidden;
            box-sizing: border-box;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 16px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
            cursor: pointer;
            user-select: none;
        }

        .close:hover {
            color: red;
        }

        /* iframe styles */
        #modalIframe {
            width: 100%;
            height: 70vh;
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>

    
    <header>
        <div class="company-name">SoftWatch</div>
        <a href="LogOut.jsp" class="logout-btn">Logout</a>
    </header>

   
    <nav>
        <a onclick="loadModal('AddCustomer.jsp')">Add Customer</a>
        <a onclick="loadModal('GetCustomerDivition.jsp')">Edit Division</a>
        <a onclick="loadModal('SearchCustomer.jsp')">View Customer Details</a>
    </nav>

    
    <main>
        <h2>Welcome to the Customer Management Portal</h2>
    </main>

    
    <div id="popupModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <iframe id="modalIframe" src=""></iframe>
        </div>
    </div>

    
    <footer>&copy; 2025 SoftWatch Pvt Ltd. All rights reserved.</footer>

    
    <script>
        function loadModal(pageUrl) {
            const modal = document.getElementById('popupModal');
            const iframe = document.getElementById('modalIframe');

            iframe.src = pageUrl;  
            modal.style.display = 'block';
        }

        function closeModal() {
            const modal = document.getElementById('popupModal');
            const iframe = document.getElementById('modalIframe');

            modal.style.display = 'none';
            iframe.src = "";  
        }

        
        window.onclick = function(event) {
            const modal = document.getElementById('popupModal');
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>

</body>
</html>
