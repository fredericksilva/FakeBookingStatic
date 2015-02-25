<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:url value="/json/fake.json" var="fake"/>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<style>
			table, th, td {
				border: thin solid gray;
			}
		</style>
	</head> 
	<body>
		<table id="fakeBookingTable"></table>
	<script src='<c:url value="/js/jquery-2.1.3.js"/>'></script>
	<script>
		$(document).ready(function () {
			$.getJSON('${fake}', function (data) {
				(function () {
					var tr = $('<tr>');
					for (key in data[0]) {
						tr.append('<th>' + key + '</th>');
					}
					$('table#fakeBookingTable').append(tr);
				})();
				
				(function () {
					for (datum in data) {
						var tr = $('<tr>');
						for (key in data[datum]) {
							console.log(key + ": " + data[datum][key]);
							tr.append('<td>' + data[datum][key] + '</td>');
						}
						$('table#fakeBookingTable').append(tr);
					}
				})();
			});
		});
	</script>
	</body>
</html>
