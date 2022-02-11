<!--#include file="/../../database/connect.asp"-->

<%
	cid=request.form("cid")
	sfirstname = request.form("txtFirstName")
	slastname = request.form("txtLastName")
	simage = request.form("txtImgLink")
	sbirthday = request.form("txtBirthday")
	saddress = request.form("txtAddress")
	gender = request.form("gender")

	sql = "INSERT INTO Student(sfirstname, slastname, simage, sbirthday, saddress, cid, status) VALUES ('" & sfirstname & "','" & slastname &"','" & simage &"','" & sbirthday &"','"& saddress &"'," & cid &","& gender & ")"
	'response.write(cid)
	conn.execute sql
	response.redirect("/student/students.asp")
	conn.close
%>


