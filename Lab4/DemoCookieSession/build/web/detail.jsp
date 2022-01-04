<%-- 
    Document   : detail
    Created on : Oct 13, 2021, 12:52:50 PM
    Author     : tenhik
--%>


<%@page import="dal.AccountDAO"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--get session-->
        <% Account acc = (Account) request.getSession().getAttribute("user");
            String name = (String) request.getAttribute("name");
            Cookie[] cookies = request.getCookies();
            AccountDAO db = new AccountDAO();
        %>

    </head>
    <body>
        <%
            String username = "";
            String password = "";
            // cookies process when go strait into detail.jsp
            if (cookies != null) {
                for (Cookie cooky : cookies) {
                    if (cooky.getName().equals("username")) {
                        username = cooky.getValue();
                    }
                    if (cooky.getName().equals("password")) {
                        password = cooky.getValue();
                    }
                }
                Account account = db.getAccountByUsernameAndPassword(username, password);
                response.getWriter().println("Hello: " + account.getDisplayname());

            } else if (name != null) {
                //cookies when user not go strait into detail.jsp    
                response.getWriter().println("Hello: " + name);
                //session     
            } else if (acc != null) {
                response.getWriter().println("Hello: " + acc.getDisplayname());
            } else {
                response.sendRedirect("login.jsp");
            }
        %>

    </body>
</html>
