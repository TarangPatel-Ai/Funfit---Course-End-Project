<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Funfit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .invalid-feedback {
            display: none;
            color: #dc3545;
            font-size: 0.875em;
        }
        .is-invalid ~ .invalid-feedback {
            display: block;
        }
    </style>
</head>
<body>
    <center>
        <h2>Login Form</h2><br>
        <p>Please enter your email and password to log in</p>
    </center>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <% 
                    String error = (String) session.getAttribute("error");
                    if (error != null) {
                        out.println("<div class='alert alert-danger'>" + error + "</div>");
                        session.removeAttribute("error");
                    }
                %>
                <form action="processLogin.jsp" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required oninput="validateEmail(this)">
                        <div class="invalid-feedback" id="email-error">Please enter a valid email address.</div>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
                        <div class="invalid-feedback" id="pwd-error">Password is required.</div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Login</button>
                        <a href="index.jsp" class="btn btn-default">Back to Registration</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function validateEmail(input) {
            const email = input.value;
            const errorElement = document.getElementById('email-error');
            const emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
            if (!emailRegex.test(email)) {
                input.classList.add('is-invalid');
                errorElement.style.display = 'block';
            } else {
                input.classList.remove('is-invalid');
                errorElement.style.display = 'none';
            }
        }

        function validateForm() {
            const emailInput = document.getElementById('email');
            const pwdInput = document.getElementById('pwd');
            validateEmail(emailInput);
            const pwdError = document.getElementById('pwd-error');
            if (pwdInput.value.trim() === '') {
                pwdInput.classList.add('is-invalid');
                pwdError.style.display = 'block';
                return false;
            } else {
                pwdInput.classList.remove('is-invalid');
                pwdError.style.display = 'none';
            }
            return !emailInput.classList.contains('is-invalid');
        }
    </script>
</body>
</html>