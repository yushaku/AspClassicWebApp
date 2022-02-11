
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="charset=utf-8">
</head>
<body>
  <!-- #include virtual="/../header.asp" -->
  <div class="container p-5" style="   display: flex; justify-content: center; align-items: center;flex-direction: column;">
    <h1 style='text-align: center; color:blue'>Login</h1>
    <%
    if (session("loginMessage") ="") then
      response.write("")
    else
      response.write("<p>"& session("loginMessage") &"</p>")
    end if
    %>
    <form action="/login/loginAction.asp" method=post style="width: 50%;padding-top:8px">
  
      <div class="mb-3">
        <label for="user" class="form-label">User name</label>
        <input name="txtUsername" type="text" class="form-control" id="user" >
      </div>
  
      <div class="mb-3">
        <label for="password1" class="form-label">Password</label>
        <input name="txtPassword" type="password" class="form-control" id="password1">
      </div>
  
      <p>Don't have any account <span> </span><a href=/register/register.asp>Register here</a></p>
  
      <div class="mb-3">
        <input class="btn btn-primary" type=submit value="Login">
        <input class="btn btn-secondary" type=reset value="Reset">
      </div>
  
    </form>
  
  </div>
</body>
</html>

