<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.assessment.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.LinkedHashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        table, th, td {
            border: 1px solid;
            border-collapse: collapse;
        }
    </style>
</head>
<body>

<%
    List<Student> students = getStudentList();
    HttpSession getSession = request.getSession(false);
    String userId = (String) getSession.getAttribute("userId");
%>

<p>Welcome <%= userId %>
</p>

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
        Map<String, List<Student>> groupedStudents = students.stream()
                .collect(Collectors.groupingBy(Student::getDepartment, LinkedHashMap::new, Collectors.toList()));

        for (Map.Entry<String, List<Student>> entry : groupedStudents.entrySet()) {
            String department = entry.getKey();
            List<Student> studentsInDepartment = entry.getValue();
            int totalStudents = studentsInDepartment.size();
            int passCount = (int) studentsInDepartment.stream()
                    .filter(s -> s.getMark() > 50)
                    .count();
            double passPercentage = totalStudents > 0 ? (double) passCount / totalStudents * 100 : 0;

            for (int i = 0; i < studentsInDepartment.size(); i++) {
                Student student = studentsInDepartment.get(i);
    %>
    <tr>
        <% if (i == 0) { %>
        <td rowspan="<%= totalStudents %>"><%= department %>
        </td>
        <% } %>
        <td>
            <button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#exampleModal<%= student.getId() %>">
                <%= student.getId() %>
            </button>
        </td>
        <td><%= student.getMark() %>
        </td>

        <% if (i == 0) { %>
        <td rowspan="<%= totalStudents %>">
            <%= String.format("%.2f", passPercentage) %>
        </td>
        <% } %>
    </tr>

    <div class="modal fade" id="exampleModal<%= student.getId() %>" tabindex="-1"
         aria-labelledby="exampleModalLabel<%= student.getId() %>" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel<%= student.getId() %>">Student Name</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p><%= student.getName() %>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>

    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>


<%!
    private List<Student> getStudentList() {
        List<Student> students = new ArrayList<>();
        students.add(new Student("S1", "Aldo", "Dep 1", 35));
        students.add(new Student("S2", "Budi", "Dep 1", 70));
        students.add(new Student("S3", "Candra", "Dep 1", 60));
        students.add(new Student("S4", "Dudi", "Dep 1", 90));
        students.add(new Student("S5", "Edi", "Dep 2", 30));
        students.add(new Student("S6", "Firman", "Dep 3", 32));
        students.add(new Student("S7", "Gilang", "Dep 3", 70));
        students.add(new Student("S8", "Hilman", "Dep 3", 20));
        return students;
    }
%>

