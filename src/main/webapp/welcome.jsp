<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.assessment.Student" %>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<%
    HttpSession getSession = request.getSession(false);

    String userId = (String) getSession.getAttribute("userId");
    out.println("<p>Welcome " + userId + "</p>");
%>

<table>
    <thead>
    <tr>
        <td>Department</td>
        <td>Student ID</td>
        <td>Marks</td>
        <td>Pass %</td>
    </tr>
    </thead>
    <tbody>
        <%
            List<Student> students = (List<Student>) request.getAttribute("students");

            String department = "";
            double passGrade = 0.0;
            int row = 0;

            for (Student student : students){
                if (!student.getDepartment().equals(department)){
                    if (!department.isEmpty()){

        %>
        <tr>
            <td rowspan="<%= row%>"><%= department%></td>
            <td colspan="2"><strong>Total</strong></td>
            <td><strong><%= passGrade %></strong></td>
        </tr>
        <%
                    }
                    department = student.getDepartment();
                    passGrade = 0.0;
                    row = countDept(students, department);
        %>
        <tr>
           <td><%= student.getDepartment() %></td>
            <td><%= student.getId() %></td>
            <td><%= student.getMark() %></td>
            <td rowspan="<%= row %>">Total</td>
        </tr>
        <%
            }else{
        %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getMark() %></td>
        </tr>
        <%
            }
                passGrade = 20;
            }
        %>
        <tr>
            <td rowspan="<%= row %>"><strong><%= department %></strong></td>
            <td colspan="2"><strong>Total</strong></td>
            <td><strong><%= passGrade %></strong></td>
        </tr>
    </tbody>
</table>
</body>
</html>


<%!
    private int countDept(List<Student> students, String department) {
        int count = 0;
        for (Student student : students) {
            if (student.getDepartment().equals(department)) {
                count++;
            }
        }
        return count;
    }
%>
