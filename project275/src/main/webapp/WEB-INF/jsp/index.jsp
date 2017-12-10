<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Demo</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width" />
<base href="/" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
	

<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body ng-app="app" ng-controller="home as home">
	<h1>Login</h1>
	<div class="container" ng-show="!home.authenticated">
		<div>
			With Facebook: <a href="/connect/facebook">click here</a>
		</div>
		<div>
			With Google: <a href="/connect/google">click here</a>
		</div>
		<div>
			With LinkedIn: <a href="/connect/linkedIn">click here</a>
		</div>
		<div>
			With Twitter: <a href="/connect/twitter">click here</a>
		</div>
	</div>
	<div class="container" ng-show="home.authenticated">
		Logged in as: <span ng-bind="home.user"></span>
	</div>
	<div>
		<button ng-click="home.logout()" class="btn btn-primary">Logout</button>
	</div>
</body>
<script type="text/javascript" src="/webjars/angularjs/angular.min.js"></script>
<script type="text/javascript">
	angular.module("app", []).controller("home", function($http) {
		var self = this;
		$http.get("/user").success(function(data) {
			self.user = data.userAuthentication.details.name;
			self.authenticated = true;
		}).error(function() {
			self.user = "N/A";
			self.authenticated = false;
		});
		self.logout = function() {
			$http.post('/logout', {}).success(function() {
				self.authenticated = false;
				$location.path("/");
			}).error(function(data) {
				console.log("Logout failed")
				self.authenticated = false;
			});
		};
	});
</script>
</html>