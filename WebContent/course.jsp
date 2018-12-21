<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg320mUcww7on3RYdg4Va+PmSTsz/K68v bdEjh4u"
	crossorigin="anonymous">
<title>Courses</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<style type="text/css">
.weekDays-selector input {
	display: none !important;
}

.weekDays-selector input[type=checkbox]+label {
	display: inline-block;
	border-radius: 6px;
	background: #dddddd;
	height: 40px;
	width: 30px;
	margin-right: 3px;
	line-height: 40px;
	text-align: center;
	cursor: pointer;
}

.weekDays-selector input[type=checkbox]:checked+label {
	background: #2AD705;
	color: #ffffff;
}
</style>
</head>
<body>
	<nav class-"navbar navbar-inversenavbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class-'navbar-toggle
					collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			<div id="navbar" class-"collapsenavbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div style="margin-top: 100px"></div>
		<div style="width: 300px">
			<br>
			<br>
			<form action="SchedulerServlet" method="POST">
				Professors <select class="form-control" name="professor">
					<option value="John White">John White</option>
					<option value="Michael Brown">Michael Brown</option>
					<option value="Tina Doe">Tina Doe</option>
					<option value="Emily Winter">Emily Winter</option>
					<option value="Christine Summer">Christine Summer</option>
				</select> <br> Courses <select class="form-control" name="courseName">
					<option value="Java Programming">Java Programming</option>
					<option value="C#">C#</option>
					<option value="C++">C++</option>
					<option value="C">C</option>
					<option value="Ruby on Rails">Ruby on Rails</option>
					<option value="Php">Php</option>
					<option value="SQL">SQL</option>
					<option value="Javascript">Javascript</option>
				</select> <br>
				<div class="weekDays-selector">
					<input type="checkbox" name="weekday" value="MONDAY"
						id="weekday-mon" class="weekday" /> <label for="weekday-mon">M</label>
					<input type="checkbox" name="weekday" value="TUESDAY"
						id="weekday-tue" class="weekday" /> <label for="weekday-tue">T</label>
					<input type="checkbox" name="weekday" value="WEDNESDAY"
						id="weekday-wed" class="weekday" /> <label for="weekday-wed">W</label>
					<input type="checkbox" name="weekday" value="THURSDAY"
						id="weekday-thu" class="weekday" /> <label for="weekday-thu">T
					</label> <input type="checkbox" name="weekday" value="FRIDAY"
						id="weekday-fri" class="weekday" /> <label for="weekday-fri">F</label>
				</div>
				<br>
				<div class="form-group">
					<label for="Room Number">Room Number</label> <input type="text"
						class="form-control" name="roomNumber" id="roomNumber"
						placeholder="Room Number">
				</div>
				<br>
				<p>
					Date: <input type="text" name="startDate" id="datepicker">
				</p>
				<br>
				<div class="form-group">
					<label for="Time">Time</label> <input type="text"
						class="form-control" name="time" id="time" placeholder="Time">
				</div>
				<br>
				<button type="submit">Add course</button>
				<br>
			</form>
		</div>
	</div>
	<c:if test="${courses!=null}">

		<table class="table table-bordered">
			<tr>
				<thead>
					<th>Course Name</th>
					<th>Professors</th>
					<th>Start Date</th>
					<th>Week Days</th>
					<th>Time</th>
					<th>Room number</th>
				</thead>
			</tr>

			<tbody>
				<c:forEach var="course" items="${courses}">
					<tr>
						<td><c:out value="${course.courseName}" /></td>
						<td><c:out value="${course.professor}" /></td>
						<td><c:out value="${course.startDate}" /></td>
						<td><c:forEach var="occurence" items="${course.weekDay}">
								<c:out value="${occurence}" />
								<br>
							</c:forEach></td>				
						<td><c:out value="${course.time}" /></td>
						<td><c:out value="${course.roomNumber}" /></td>
					</tr>
			</tbody>
			</c:forEach>

		</table>

	</c:if>
</body>

</html>
