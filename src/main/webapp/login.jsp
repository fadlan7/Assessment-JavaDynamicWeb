<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("form").submit(function (event) {
                $("#error").hide();
                $(".error-message").remove();

                var userId = $("#userId").val().trim();
                var password = $("#password").val().trim();

                if (userId === "") {
                    $("#userId").after("<span class='error-message' style='color:red'>Username is required</span>");
                    event.preventDefault();
                }

                if (password === "") {
                    $("#password").after("<span class='error-message' style='color:red'>Password is required</span>");
                    event.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
<form action="LoginServlet" method="post">
    <table class="table">
        <tr>
            <td class="headTable"><label for="userId">User ID</label></td>
            <td><input type="text" id="userId" name="userId"></td>
        </tr>

        <tr>
            <td class="headTable"><label for="password">Password</label></td>
            <td><input type="password" id="password" name="password"></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <input type="submit" value="Login"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>