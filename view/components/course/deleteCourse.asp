<!--#include file="/../../database/connect.asp"-->

<%
	cid = request("cid")
	sql = "delete from class where cid = " & cid 
	'response.write sql
	conn.execute sql
	response.redirect("/course/course.asp")
	conn.close
%>
