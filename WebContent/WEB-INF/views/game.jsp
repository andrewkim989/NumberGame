<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Great Number Game (Ver 2.0)</title>
	<style>
		#wrapper {
			background-color: lightgrey;
			height: 620px;
		}
		#game {
			font-family: "Comic Sans MS", cursive, sans-serif;
			margin: auto;
			width: 600px;
			text-align: center;
			padding-top: 10px;
		}
		input[type = text] {
			border-radius: 8px;
			padding: 5px;
			height: 20px;
			width: 70px;
			font-size: 20px;
		}
		input[type = submit] {
			width: 130px;
			font-size: 22px;
			background-color: rgb(67, 67, 190);
			padding: 8px;
			margin-top: 10px;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		h2 {
			width: 400px;
			padding: 10px;
			background-color: rgb(221, 68, 68);
			color: white;
			text-align: center;
			margin-left: 100px;
		}
		h4 {
			margin-left: 120px;
			background-color: green;
			color: white;
			font-size: 27px;
			text-align: center;
			width: 380px;
			padding: 5px;
		}
		h5 {
			font-size: 20px;
			background-color: lightgreen;
			width: 450px;
			margin-left: 70px;
			padding: 10px;
		}
		h6 {
			font-size: 20px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "game">
			<% int min = (int) session.getAttribute("min"); %>
			<% int max = (int) session.getAttribute("max"); %>
			<% int attempt = (int) session.getAttribute("attempt"); %>
			
			<h1>Welcome to the Great Number Game (Ver 2.0) !</h1>
			<h3>I'm thinking of a number between <%= min %> to <%= max %>!</h3>
			<h3>Take a guess at what it is until you get it correctly!</h3>
			<h3>You have 20 attempts to do so.</h3>
			<% if (session.getAttribute("guess") == "high" && attempt < 20) { %>
				<h2>Your guess is too high! Type in a smaller number!</h2>
			<% } %>
			<% if (session.getAttribute("guess") == "low" && attempt < 20) { %>
				<h2>Your guess is too low! Type in a bigger number!</h2>
			<% } %>
			<% if (attempt < 20 && session.getAttribute("correct") == "incorrect") { %>
				<form name = "guess" method = "post" action = "/NumberGameTwo/guess">
					<input type = "text" name = "guess" />
					<br/>
				    <input type = "submit" value = "Guess!" />
				</form>
				<h6>Attempt: #<%= attempt %></h6>
			<% } %>
			<% if (session.getAttribute("correct") == "correct") { %>
				<h4>You're correct! <c:out value = "${number}"/> was the number! </h4>
				<form method = "post" action = "/NumberGameTwo/reset">
				    <input type = "submit" value = "Play Again!" />
				</form>
			<% } %>
			<% if (attempt == 20 && session.getAttribute("correct") == "incorrect") { %>
				<h5>Game over! You have run out of attempts! <c:out value = "${number}"/> was the number.
				Click "Play Again!" to start a new game!</h5>
				<form method = "post" action = "/NumberGameTwo/reset">
				    <input type = "submit" value = "Play Again!" />
				</form>
			<% } %>
		</div>
	</div>
</body>
</html>