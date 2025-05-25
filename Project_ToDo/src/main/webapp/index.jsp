<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Todo List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa;
	font-family: Arial, sans-serif;
}

.container {
	max-width: 700px;
}

.card {
	width: 500px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.task-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	padding: 10px;
}

.input-group {
    width: 100%;
}

.navbar {
	background-color: #007bff;
	border-radius: 5px;
	padding: 10px;
}

.navbar-brand, .nav-link {
	color: white !important;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation Bar Inside Card -->
			<nav class="navbar navbar-expand-lg">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="#">GQT TODO APP</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarNav">
			      <ul class="navbar-nav">
			        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
			        <li class="nav-item"><a class="nav-link" href="Features.html">Features</a></li>
			        <li class="nav-item"><a class="nav-link" href="Pricing.html">Pricing</a></li>
			      </ul>
			    </div>
			  </div>
			</nav>
<!-- Centered Card -->
<div class="d-flex justify-content-center align-items-center vh-100">
	<div class="card">
		<div class="card-body text-center">

		

			<h2 class="mt-3">Todo List</h2>
			<form action="Todo" method="post" class="mb-3">
				<div class="input-group">
					<input type="text" id="task" name="task" class="form-control" placeholder="Enter a task" required>
					<div class="input-group-append">
						<button type="submit" class="btn btn-primary">Add Task</button>
					</div>
				</div>
			</form>

			<h3>Tasks:</h3>
			<ul class="list-group">
				<%
	            ArrayList<String> taskList = (ArrayList<String>) request.getAttribute("taskList");
	            if (taskList == null || taskList.isEmpty()) {
	            %>
				<p class="text-muted">No tasks found. Please add one!</p>
				<%
	            } else {
	                for (String task : taskList) {
	            %>
				<li class="list-group-item task-item"><%= task %>
					<form action="Todo" method="post" style="display: inline;">
						<input type="hidden" name="deleteTask" value="<%= task %>">
						<button type="submit" class="btn btn-danger btn-sm">Delete</button>
					</form></li>
				<%
	                }
	            }
	            %>
			</ul>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>