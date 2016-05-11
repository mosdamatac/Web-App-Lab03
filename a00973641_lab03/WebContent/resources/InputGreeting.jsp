<!-- Author ID: A00973641 -->
<!-- Author name: Mara Damatac -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Input and Greet</title>
	<link rel="stylesheet" href="./resources/css/style.css" type="text/css">
	<script language="javascript" type="text/javascript">
		regexName = /^[A-Z|a-z]{2,}$/
		
		function submitIt(myForm) {
			if (!regexName.test(myForm.name.value)) {
				alert("Enter a valid name (2 or more, upper case or lower case alphabets)");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
<div id="wrapper">
	<header>
		<h2>COMP 3613</h2>
		<h4>A00973641 Mara Damatac</h4>
	</header>
	<div id="main">
	<% 
	String name = request.getParameter("name");
	if (name != null && !name.trim().equals("")) {
		name = name.trim();
		if (!name.equals("")) {
			out.println("<span class=\"mainMsg\">Hello, " + name);
			out.println("<br/>");
			out.println(config.getInitParameter("welcomeMsg") + "</span>");	
		}
	} else {
		response.setContentType("text/html");
		out.println("<form name=\"nameForm\" method=\"post\" onSubmit=\"return submitIt(this)\"/>");
		out.println("<span class=\"mainMsg\">" + config.getInitParameter("submitMsg") + "</span>");
		out.println("<br/>");
		out.println("<input type=\"text\" name=\"name\"/>");
		out.println("<input type=\"submit\" value=\"Submit\" class=\"button\"/>");
		out.println("</form>");
	}
	%>
	</div>
	<footer><em>&copy; A00973641 Mara 2016</em></footer>
</div>
</body>
</html>