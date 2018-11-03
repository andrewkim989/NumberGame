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
		#main {
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
			width: 100px;
			font-size: 22px;
			background-color: rgb(67, 67, 190);
			padding: 8px;
			margin-top: 10px;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div id = "main">
			<h1>Welcome to the Great Number Game (Ver 2.0) !</h1>
			<h2>Before we get started, please set the number range below.
			Then press "Start!" to start the game!</h2>
			<form method = "get" action = "/NumberGameTwo/set">
				Minimum: <input type = "text" name = "min" />
				Maximum: <input type = "text" name = "max" />
				<br/>
				<input type = "submit" value = "Start!"/>
			</form>
		</div>
	</div>
</body>
</html>