<!--#include file="/../../database/connect.asp"-->

<%
	username=Request.Form("txtUsername")
	password = Request.Form("txtPassword")
	'password=Hash("md5",password1)

	'response.write(username)
	session("username") = username
	Response.Redirect("/course/course.asp?page=1")

	'sql = "select * from users where username='" & username & "' and password = '" & password & "'"
	'rs.open sql, conn

	'if rs.eof then 
		'session("ErrorLogin")="User not Exist or Password Wrong!"
		'session("login")=false
		'Response.Redirect("/login/login.asp")
	'else 
		'Response.Cookies("user")("username") = rs("username")
		'Session("username") = rs("username")
		'session("login")=true
		'Response.Redirect("/course/course.asp")
	'end if
%>
