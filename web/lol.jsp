<%-- 
    Document   : lol
    Created on : Mar 19, 2019, 5:42:25 PM
    Author     : Panji Sadewo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean cekData = session.getAttribute("idLogin") != null;
    if (!cekData) {
        response.sendRedirect("./LoginPageServlet");
        out.print("AAA");
    }
%>