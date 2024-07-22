<%@ page pageEncoding="utf-8" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<title>Online Shopping Mall</title>
			<link rel = "icon" type = "image/png" href="/static/images/ico-cart.png">
			<tiles:insertAttribute name="head" />
		</head>

		<body>
			<div class="container">
				<header class="row">
					<h1 class="alert alert-success">Online Shopping Mall</h1>
				</header>
				<nav class="row">
					<tiles:insertAttribute name="menu" />
				</nav>
				<div class="row">
					<article class="col-sm-9">
						<tiles:insertAttribute name="body" />
					</article>
					<aside class="col-sm-3">
						<tiles:insertAttribute name="aside" />
					</aside>
				</div>
				<footer class="row">
					<p class="text-center">&copy 2024 Nguyen Ngoc Thien Phuc. All Rights Reserved</p>
				</footer>
			</div>
		</body>
		
		<script src="https://uhchat.net/code.php?f=caa7fd"></script>
		
		</html>