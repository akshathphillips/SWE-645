<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Survey Form - SWE 645 - Akshath Phillips</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
            color: #006633; /* gmu-green */
        }

        .gmu-green {
            color: #006633;
        }

        .required-label::after {
            content: " *";
            color: red;
        }
    </style>
</head>
<body>
<div class="container p-4">
    <h1 class="gmu-green">Student Survey</h1>
    <h2 class="gmu-green">SWE 645 - HW1 - Part 2</h2>
    <h3 class="gmu-green">Akshath Phillips</h3>
    <form action="SurveyServlet" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="first_name" class="form-label required-label">First Name</label>
            <input type="text" class="form-control" id="first_name" required placeholder="Example: John">
            <div class="invalid-feedback">
                Please provide a first name.
            </div>
        </div>

        <div class="mb-3">
            <label for="last_name" class="form-label required-label">Last Name</label>
            <input type="text" class="form-control" id="last_name" required placeholder="Example: Doe">
            <div class="invalid-feedback">
                Please provide a last name.
            </div>
        </div>

        <div class="mb-3">
            <label for="address" class="form-label required-label">Street Address</label>
            <input type="text" class="form-control" id="address" required placeholder="Example: 123 Fairfax St">
            <div class="invalid-feedback">
                Please provide a street address.
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="city" class="form-label required-label">City</label>
                <input type="text" class="form-control" id="city" required placeholder="Example: Fairfax">
                <div class="invalid-feedback">
                    Please provide a city.
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="state" class="form-label required-label">State</label>
                <input type="text" class="form-control" id="state" required placeholder="Example: VA">
                <div class="invalid-feedback">
                    Please provide a state.
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <label for="zip" class="form-label required-label">Zip</label>
                <input type="text" class="form-control" id="zip" required placeholder="Example: 22102">
                <div class="invalid-feedback">
                    Please provide a zip code.
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label for="telephone" class="form-label required-label">Telephone Number</label>
            <input type="tel" class="form-control" id="telephone" required placeholder="Example: (123) 456-7890">
            <div class="invalid-feedback">
                Please provide a valid telephone number.
            </div>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label required-label">Email</label>
            <input type="email" class="form-control" id="email" required placeholder="Example: johndoe@gmu.edu">
            <div class="invalid-feedback">
                Please provide a valid email address.
            </div>
        </div>

        <div class="mb-3">
            <label for="survey-date" class="form-label required-label">Date of Survey</label>
            <input type="date" class="form-control" id="survey-date" required>
            <div class="invalid-feedback">
                Please select a date.
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">What did you like most about the campus?</label>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="liked-campus-students">
                <label class="form-check-label" for="liked-campus-students">Students</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="liked-campus-location">
                <label class="form-check-label" for="liked-campus-location">Location</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="liked-campus-atmosphere">
                <label class="form-check-label" for="liked-campus-atmosphere">Atmosphere</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="liked-campus-dorms">
                <label class="form-check-label" for="liked-campus-dorms">Dorm Rooms</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="liked-campus-sports">
                <label class="form-check-label" for="liked-campus-sports">Sports</label>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">How did you become interested in the university?</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="interest" id="interest-friends">
                <label class="form-check-label" for="interest-friends">Friends</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="interest" id="interest-television">
                <label class="form-check-label" for="interest-television">Television</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="interest" id="interest-internet">
                <label class="form-check-label" for="interest-internet">Internet</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="interest" id="interest-other">
                <label class="form-check-label" for="interest-other">Other</label>
            </div>
        </div>

        <div class="mb-3">
            <label for="likelihood" class="form-label">Likelihood of Recommending</label>
            <select class="form-select" id="likelihood">
                <option value="Very Likely">Very Likely</option>
                <option value="Likely">Likely</option>
                <option value="Unlikely">Unlikely</option>
            </select>
        </div>

        <!-- Raffle numbers -->
        <div class="mb-3">
            <label class="form-label required-label" for="raffle">Enter at least ten comma-separated numbers (1-100) for
                the Raffle</label>
            <input type="text" class="form-control" id="raffle" name="raffle" required
                   placeholder="Example: 1,2,3,4..."
                   onblur="checkRaffleInput()" onsubmit="return validateRaffle()">
            <div class="invalid-feedback">
                Please provide at least 10 numbers.
            </div>
        </div>

        <div class="mb-3">
            <label for="comments" class="form-label">Additional Comments</label>
            <textarea class="form-control" id="comments" rows="4"
                      placeholder="Example: Your feedback is important to us."></textarea>
        </div>

        <!-- Submit and cancel buttons -->
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="button" class="btn btn-secondary" onclick="cancelAndReload()">Cancel</button>
        <a href="http://gmu-swe-645-aphill5.s3-website-us-east-1.amazonaws.com" class="btn btn-dark mr-3">Back to
            Class Homepage</a>
    </form>
</div>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
    const forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });

    function cancelAndReload() {
        window.location.reload();
        document.getElementById("first_name").focus();
    }
</script>

<script>
    function checkRaffleInput() {
        var raffleInput = document.getElementById("raffle").value;
        var numbers = raffleInput.split(",").map(Number).filter(num => !isNaN(num) && num >= 1 && num <= 100);
        if (numbers.length < 10) {
            document.getElementById("raffle").setCustomValidity("Please provide at least ten valid numbers.");
        } else {
            document.getElementById("raffle").setCustomValidity("");
        }
    }

    function validateRaffle() {
        checkRaffleInput();
        var raffleInput = document.getElementById("raffle").value;
        var numbers = raffleInput.split(",").map(Number).filter(num => !isNaN(num) && num >= 1 && num <= 100);
        return numbers.length >= 10;
    }
</script>
</body>
</html>
