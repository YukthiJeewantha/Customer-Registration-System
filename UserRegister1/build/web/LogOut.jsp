<%-- 
    Document   : LogOut
    Created on : Jul 21, 2025, 2:42:32 PM
    Author     : User
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    
    session.invalidate();

    
    response.sendRedirect("AdminLogin.jsp"); 
%>

