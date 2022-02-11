<%
  if session("username") = "" then
    response.redirect("/login/login.asp")
  end if
%>


<!--#include file="/../../database/connect.asp"-->

<html>
<!-- #include virtual="/../header.asp" -->
<head>
  <meta http-equiv="content-type" content="charset=utf-8">
</head>
<div class="container-fluid">
  <% 
    className = request("cname")
    if className="" then
      response.write("<h2 align=center>Student of <span style='color:blue;'>this class</span> </h2>" )
    else
      response.write("<h2 align=center>Student of <span style='color:blue;'> " & className &"</span> </h2>" )
    end if
  %>

  <div class="row gx-6 ">
    <div class="col-9">
      <div class="row ">

      <%
        sql2 = "select student.*, class.cname from student, class where student.cid = class.cid "
        rs.open  sql2, conn
			if (rs.eof) then	
			%>
				<h1>List is Empty</h1>
			<%
			else 
				while not rs.eof
			%>

        <div class="col-3" >
          <div class="card" >
            <img src="<%=rs("simage")%>" class="card-img-top" alt="card-img-top"style="height:150px" >
            <div class="card-body">
              <h5 class="card-title"><%=rs("sfirstname")%><span> </span><%=rs("slastname")%></h5>
              <div style="   display: flex; justify-content: space-between; align-items: center;">
                <span style="color:blue"><%
                  if (rs("status")=true) then  
                    response.write("female") 
                    else 
                    response.write("male")
                  end if %>
                </span>
                <span class="card-text"><%=rs("sbirthday")%></span>
              </div>

              <p class="card-text" style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">address: <%=rs("saddress")%></p>

              <button  class="btn btn-primary" 
                onclick="updateFromInput(<%=rs("sid")%>, '<%=rs("sfirstname")%>','<%=rs("slastname")%>', <%=rs("status")%>,'<%=rs("sbirthday")%>','<%=rs("saddress")%>','<%=rs("simage")%>', '<%=rs("cid")%>' )" >
                  Edit 
              </button>
              <a href="/student/deleteStudent.asp?sid=<%=rs("sid")%>" class="btn btn-danger">Delete</a>
              
            </div>
          </div>
        </div>

        <%
            rs.moveNext  'di chuyen den ban ghi tiep theo
            wend
          end if
          rs.close 'dong tap ban ghi lai sau khi dung xong 
          conn.close 
        %>

      </div>
    </div>

    <div class="col-3 pl-1 formInput" >

      <h1 style="color:blue; text-align:center; font-size:24px">Add new student</h1>

      <form action="/student/addStudent.asp" method=post>
        <div class="mb-3 row">
          <input type="text"  placeholder="first name" name="txtFirstName">
        </div>
        <div class="mb-3 row">
          <input type="text"  placeholder="last name" name="txtLastName">
        </div>
        <div class="mb-3 row">
          <input type="date"  placeholder="birthday" name="txtBirthday">
        </div>
        <div class="mb-3 row">
          <input type="text"  placeholder="address" name="txtAddress">
        </div>
        <div class="mb-3 row">
          <input type="text" placeholder="image link" name="txtImgLink">
        </div>
        <%
          cid = request("cid")
          response.write("<input type='hidden' name='cid' value=" & cid & ">" )
        %>
        <div class="mb-3 row" class="form-select form-select-lg">
          <select name=gender>
          <option value=1>female</option>
          <option value=0>male</option>
        </select>
        </div>
        <div class="mb-3 row">
          <input type=submit value=Submit>
          <input type=reset value=Reset>
        </div>
      </form>
    </div>
</div>
</div>
</html>

<script>
  const formInput = document.querySelector('.formInput')

  function updateFromInput(id,firstName, lastName,status, birthday, address, image, classId) {
      const html = `
        <h1 style="color:blue; text-align:center; font-size:24px">Add new student</h1>

        <form action="/student/addStudent.asp" method=post>
        <div class="mb-3 row">
            <input type="hidden" name="studentId" value=${id}>
          </div>
          <div class="mb-3 row">
            <input type="text"  placeholder="first name" name="txtFirstName" value=${firstName}>
          </div>
          <div class="mb-3 row">
            <input type="text"  placeholder="last name" name="txtLastName" value=${lastName}>
          </div>
          <div class="mb-3 row">
            <input type="date"  placeholder="birthday" name="txtBirthday" value=${birthday}>
          </div>
          <div class="mb-3 row">
            <input type="text"  placeholder="address" name="txtAddress" value=${address}>
          </div>
          <div class="mb-3 row">
            <input type="text" placeholder="image link" name="txtImgLink" value=${image}>
          </div>

          <div class='mb-3 row'>
            <input type='hidden' name='cid' value=${classId}>
          </div>

          <div class="mb-3 row" class="form-select form-select-lg">
            <select name=gender value=${status}>
            <option value=1>female</option>
            <option value=0>male</option>
          </select>
          </div>
          <div class="mb-3 row">
            <input type=submit value=Submit>
            <input type=reset value=Reset>
          </div>
        </form>
      `

      formInput.innerHTML = html
  }
</script>