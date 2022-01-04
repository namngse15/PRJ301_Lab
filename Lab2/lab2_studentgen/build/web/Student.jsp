<%-- 
    Document   : Student
    Created on : Sep 18, 2021, 9:49:44 AM
    Author     : tenhik
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            ArrayList<Student> students
                    = (ArrayList<Student>) request.getAttribute("students");
        %>
    </head>
    <body>
        <%int num = Integer.parseInt(request.getParameter("number"));%>
        Number of Students: <input type="text" name="id" size="10" value="<%=num%>" />
        <input type="submit" value="Generate" />
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Gender</td>
                <td>DOB</td>
            </tr>
            <% for (Student s : students) {
            %>
            <tr>
            <td><%=s.getId()%></td>
            <td><%=s.getName()%> </td>
            <td style="text-align: center"><input type="checkbox" <%if(s.getGender() == true){%> checked<%}%>></td>
            <% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%>
            <td><%=sdf.format(s.getDob())%> </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
