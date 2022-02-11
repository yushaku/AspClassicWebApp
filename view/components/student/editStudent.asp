<!--#include file="../../database/connect.asp"-->
<%
	sid = request.form("sid")
	sfirstname=request.form("txtFirstName")
	slastname=request.form("txtLastName")
	simage=request.form("fStudentImage")
	sbirthday=request.form("dBirthday")
	saddress=request.form("txtStudentAddress")
	sorder=request.form("txtStudentOrder")
	cid=request.form("txtStudentCid")
	status=request.form("slStudentStatus")
	sql = "update student set sfirstname='" & sfirstname & "', slastname='" & slastname & "',simage='" & simage & "', sbirthday='" & sbirthday & "', saddress='" & saddress & "', sorder = " & sorder & ", cid = " & cid & ", status=" & status & " where sid=" & sid
	'response.write sql
	conn.execute sql
	conn.close
	response.redirect("/student/students.asp")
%>