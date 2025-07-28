<%-- 
    Document   : AdminLoginAction
    Created on : Jul 17, 2025, 9:49:27?AM
    Author     : ACER
--%>

<%@ page import="dao.AdminDAO" %>
<%@ page import="model.Admin" %>

<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");

    try {
        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.authenticateAdmin(name, password);

        if (admin != null) {
            session.setAttribute("adminId", admin.getAdminId());
            session.setAttribute("adminName", admin.getName());
            response.sendRedirect("Navigation.jsp");
            return; 
        } else {
           
            out.println("<script>alert('Invalid credentials!'); window.location='AdminLogin.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Login failed due to server error!'); window.location='AdminLogin.jsp';</script>");
    }
%>

