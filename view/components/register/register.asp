<!-- #include virtual="/../header.asp" -->

<div class="container p-5" style="   display: flex; justify-content: center; align-items: center;flex-direction: column;">
  <h1 style="text-align: center; color:blue">Register</h1>
  <form action="/register/registerAction.asp" method=post style="width: 50%;">

    <div class="mb-3">
      <input name="txtFullName" type="text" class="form-control" id="name" placeholder="full name">
    </div>

    <div class="mb-3">
      <input name="txtUsername" type="text" class="form-control" id="userName" placeholder="user name">
    </div>

    <div class="mb-3">
      <input name="txtEmail" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="email">
    </div>

    <div class="mb-3">
      <input name="txtPassword" type="password" class="form-control" id="password1" placeholder="password">
    </div>

    <p>You have a account <span> </span><a href=/login/login.asp>login here</a></p>

    <div class="mb-3">
      <input class="btn btn-primary" type=submit value="Register">
      <input class="btn btn-secondary" type=reset value="Reset">
    </div>

  </form>

</div>

