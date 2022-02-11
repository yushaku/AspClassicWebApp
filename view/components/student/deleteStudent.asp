<!--#include file="../../database/connect.asp"-->
<%
	sid = request("sid")
	sql = "delete from student where sid = " & sid
	'response.write sql
	conn.execute sql
	conn.close
	response.redirect("/student/students.asp")
%>