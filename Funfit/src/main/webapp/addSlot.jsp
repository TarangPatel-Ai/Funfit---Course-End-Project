<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Slot - Funfit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <center>
        <h2>Add Slot</h2><br>
        <p>Enter slot details</p>
    </center>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form action="processSlot.jsp" method="post">
                    <div class="form-group">
                        <label for="date">Date (YYYY-MM-DD):</label>
                        <input type="text" class="form-control" id="date" name="date" placeholder="e.g., 2025-10-23" required>
                    </div>
                    <div class="form-group">
                        <label for="time">Time (HH:MM:SS):</label>
                        <input type="text" class="form-control" id="time" name="time" placeholder="e.g., 14:00:00" required>
                    </div>
                    <div class="form-group">
                        <label for="count">Count:</label>
                        <input type="number" class="form-control" id="count" name="count" min="1" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Slot</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>