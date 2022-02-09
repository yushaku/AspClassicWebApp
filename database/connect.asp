<% 

   set conn = Server.CreateObject("ADODB.Connection")
	set rs = Server.CreateObject("ADODB.Recordset")

	strconn = "Provider = Microsoft.ACE.OLEDB.12.0; Data Source=" & Server.MapPath("/../database/database.accdb")
	conn.open strconn

%>