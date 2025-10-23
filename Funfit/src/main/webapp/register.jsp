<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Registration - Funfit</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
.invalid-feedback {
  display: none;
  color: #dc3545; /* Bootstrap's default error color */
  font-size: 0.875em;
}
.is-invalid ~ .invalid-feedback {
  display: block;
}

.invalid-feedback {
  display: none;
  color: #dc3545; /* Bootstrap's default error color */
  font-size: 0.875em;
}
.is-invalid ~ .invalid-feedback {
  display: block;
}
</style>
</head>
<body>
<center>
<h2>Registration Form</h2><br>
<p>Please fill the form for the book the class</p>
</center>
<div class="container">
  
  <div class="container">
  <div class="row">
    <div class="col-md-12 offset-md-3">
      <form action="userinsert.jsp">
        <div class="form-group col-md-6">
          <label for="name">Name</label>
          <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
        </div>
        
        <div class="form-group col-md-6">
		  <label for="mobile">Mobile:</label>
		  <input type="tel" class="form-control" id="mobile" placeholder="Enter Mobile Number" name="mobile" pattern="[0-9]{10}" maxlength="10" required onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" oninput="validateMobile(this)">
		  <div class="invalid-feedback" id="mobile-error">Please enter a valid 10-digit mobile number.</div>
		</div>
        
        <div class="form-group col-md-6">
		  <label for="age">Age</label>
		  <input type="number" class="form-control" id="age" placeholder="Enter Age" name="age" min="18" max="100" required onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" oninput="validateAge(this)">
		  <div class="invalid-feedback" id="age-error">Please enter a valid age between 18 and 100.</div>
		</div>
		
		<div class="form-group col-md-6">
		  <label for="weight">Weight</label>
		  <input type="number" class="form-control" id="weight" placeholder="Enter Weight (kg)" name="weight" min="20" max="300" required onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" oninput="validateWeight(this)">
		  <div class="invalid-feedback" id="weight-error">Please enter a valid weight between 20 and 300 kg.</div>
		</div>
        
        <div class="form-group col-md-6">
          <label for="email">Email:</label>
          <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
        </div>
        <div class="form-group col-md-6">
          <label for="pwd">Password:</label>
          <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <div class="form-group col-md-12">
          <label for="inputAddress">Address</label>
    	  <input type="text" name="address" class="form-control" id="inputAddress" placeholder="Apartment, studio, or floor">
        </div>
        
        <div class="form-group col-md-12">
          <button type="submit" class="btn btn-default">Submit</button>
        </div>
        
      </form>
    </div>
  </div>
</div>
</div>

<script>
function validateMobile(input) {
  const mobile = input.value.replace(/\D/g, ''); // Remove non-digits
  const errorElement = document.getElementById('mobile-error');
  if (mobile.length !== 10) {
    input.classList.add('is-invalid');
    errorElement.style.display = 'block';
  } else {
    input.classList.remove('is-invalid');
    errorElement.style.display = 'none';
  }
}

function validateAge(input) {
	  const age = parseInt(input.value);
	  const errorElement = document.getElementById('age-error');
	  if (isNaN(age) || age < 18 || age > 100) {
	    input.classList.add('is-invalid');
	    errorElement.style.display = 'block';
	  } else {
	    input.classList.remove('is-invalid');
	    errorElement.style.display = 'none';
	  }
	}

	function validateWeight(input) {
	  const weight = parseFloat(input.value);
	  const errorElement = document.getElementById('weight-error');
	  if (isNaN(weight) || weight < 20 || weight > 300) {
	    input.classList.add('is-invalid');
	    errorElement.style.display = 'block';
	  } else {
	    input.classList.remove('is-invalid');
	    errorElement.style.display = 'none';
	  }
	}
</script>
</body>
</html>