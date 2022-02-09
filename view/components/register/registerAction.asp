<!--#include file="/../../database/connect.asp"-->

<%
   fullName = request.form("txtFullName")
   Username = request.form("txtUsername")
   Email = request.form("txtEmail")
   password = request.form("txtPassword")

	sql = "insert into user(fullName,userName, password, email) values ('" & fullName & "', '" & Username &"', '" & password &"', '" & email & "')"

   response.write(sql)
	conn.execute sql
	response.redirect("/course/course.asp")
	conn.close
%>