<!--#include file="/../../database/connect.asp"-->
<%
	cid = request.form("cid")
	cname=request.form("txtClassName")
	cimage=request.form("fClassImage")
	corder=request.form("txtClassOrder")
	cstatus=request.form("slClassStatus")
	
	sql = "update class set cname='" & cname & "', cimage='" & cimage & "', corder = " & corder & ", cstatus=" & cstatus & " where cid=" & cid
	'response.write sql
	conn.execute sql
	conn.close
	response.redirect("/course/course.asp")
%>