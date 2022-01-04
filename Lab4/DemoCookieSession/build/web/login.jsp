<%-- 
    Document   : login
    Created on : Oct 20, 2020, 8:19:45 AM
    Author     : macbookair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <% Cookie[] cookies = request.getCookies();%>
    </head>
    <body>
        <form action="login" method="POST"> 
            <!--login failed mess-->
            <%  String mess = (String) request.getAttribute("mess");
                if (mess != null) {
                    response.getWriter().print(mess);
                }

                String username = "";
                String password = "";

                if (cookies != null) {
                    for (Cookie cooky : cookies) {
                        if (cooky.getName().equals("username")) {
                            username = cooky.getValue();
                        }
                        if (cooky.getName().equals("password")) {
                            password = cooky.getValue();
                        }
                    }
                }
            %>        

            UserName:<input id="username" type="text" name="username" value="<%=username%>"/> 
            <br/>
            PassWord:<input type="password" name="password" value="<%=password%>"/>
            <br/>
            <input type="checkbox" name ="remember" value="remember"/> Remember me <br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
