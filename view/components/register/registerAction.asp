<!--#include file="/../../database/connect.asp"-->

<%
   fullName = request.form("txtFullName")
   Username = request.form("txtUsername")
   Email = request.form("txtEmail")
   password = request.form("txtPassword")

	sql = "INSERT INTO user (fullName, userName, password, email) VALUES ('" & fullName & "', '" & Username &"', '" & password &"', '" & email & "');"

   Response.Cookies("user")("fullName") = fullName
   Response.Cookies("user")("Username") = Username
   Response.Cookies("user")("email") = Email

   session("username")=username
   'session.Timeout = 0.5

   'response.write(sql)
	'conn.execute sql
	response.redirect("/course/course.asp?page=1")
	'conn.close
%>
