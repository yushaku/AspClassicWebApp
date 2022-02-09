<!--#include file="/../../database/connect.asp"-->
<%
	username=Request.Form("txtUsername")
	password = Request.Form("txtPassword")
	remember = Request.Form("ckRemember")
	
	if (remember=1) then
		session("username")=username
		session("password")=password
	else 
		session("username")=""
		session("password")=""
	end if


	sql = "select * from users where username='" & username & "' and password = '" & password & "'"
	rs.open sql, conn

	if rs.eof then 
		session("ErrorLogin")="User not Exist or Password Wrong!"
		session("login")=false
		Response.Redirect("/login/login.asp")
	else 

		if (rs("status")=0)  then	
				session("ErrorLogin") = "User inactive, please contact administrator!"
				session("login")=false
				Response.Redirect("login.asp")
		else 
				Session("ErrorLogin")=""
				Session("fullname") = rs("fullname")
				session("login")=true
				if (rs("level")=1) then		
					response.redirect("class_view.asp")
				else 
					if (rs("level")=2) then 
						response.redirect("student_view.asp")
					else
						response.redirect("admin.asp")
					end if
				end if
		end if
	end if
%>