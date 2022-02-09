<!--#include file="/../database/connect.asp"-->

<%
	cname = request.form("txtClassName")
	cimage = request.form("fClassImage")
	corder = request.form("txtClassOrder")
	cstatus = request.form("slClassStatus")

	sql = "insert into class(cname,cimage,corder,cstatus) values ('" & cname &"','" & cimage &"'," & corder &"," & cstatus & ")"
	
	'response.write sql
	conn.execute sql
	response.redirect("/components/course/course.asp")
	conn.close
%>