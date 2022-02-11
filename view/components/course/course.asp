<%

  if session("username") = "" then
    response.redirect("/login/login.asp")
    session("loginMessage") = "You have to login first"
  end if
%>

<!--#include file="/../../database/connect.asp"-->
<!-- #include virtual="/../header.asp" -->

<div class="container-fluid">
  <h1 align=center>Classes of nuce </h1>

  <form method=post style="display: flex; justify-content: center; align-items: center; padding:18px">
    <input style="width:500px;" type=text name=TitlePost value="<%=Request.Form("TitlePost")%>" placeholder="Enter class name">
    <input type=submit value="Tìm kiếm">
  </form>

  <div class="row gx-6 ">
    <div class="col-9">
      <div class="row ">

        <%
            ClassName=Request.Form("TitlePost")
            rs.CursorLocation=3 'mặc định
            rs.pagesize = 6		'số bản ghi trên 1 trang X + 5
            sql = "select * from Class WHERE cname LIKE '%" & ClassName & "%' order by corder"
            rs.open sql, conn,0,1
            count = rs.pagecount
            page = CInt(Request("page"))
            if (page ="") then
                page = 1 		
            end if
            if (page<0) then
                page = 1		'xử lý khi người dùng truyền giá trị âm
            end if
            if (page>count) then
                page = count	'xử lý khi người dùng truyền vào quá số trang hiện có thì đẩy về trang cuối
            end if
            rs.absolutepage = page

            if (rs.eof) then	
              %>
              <h5>List is Empty</h5>
              <%
            else 
              while not rs.eof and rs.absolutepage=page
        %>
        
        <div class="col-4" >
          <div class="card" >
            <a href="/student/students.asp?cid=<%=rs("cid")%>&cname=<%=rs("cname")%>" style="color:black; text-decoration: none;">
              <img src="<%=rs("cimage")%>" class="card-img-top" alt="card-img-top"style="height:150px" >
              <div class="card-body">
                <h5 class="card-title"><%=rs("cname")%></h5>
                <p class="card-text" my-2> class is 
                <% 
                if (rs("cstatus")=true) then 
                  response.write("Active, get errol now ")
                else 
                  response.write("Not Active, get back latter ")
                end if
                %>
              </p>
            </a>
              <button 
                class="btn btn-primary" 
                onclick="updateFromInput(<%=rs("cid")%>, '<%=rs("cname")%>', <%=rs("cstatus")%>, <%=rs("corder")%>,  '<%=rs("cimage")%>' )" > Edit </button>
              <a href="/course/deleteCourse.asp?cid=<%=rs("cid")%>" class="btn btn-danger">Delete</a>
              
            </div>
          </div>
        </div>

        <%
            rs.moveNext  'di chuyen den ban ghi tiep theo
            wend
          end if
          rs.close 'dong tap ban ghi lai sau khi dung xong 
          conn.close 'dong ket noi voi co so du lieu
        %>

      </div>
    </div>

    <div class="col-3 pl-1 formInput" >

      <h1 style="color:blue; text-align:center; font-size:24px">Add new Class</h1>

      <form action="/course/addCourse.asp" method=post>
        <div class="mb-3 row">
          <input type="text"  placeholder="class name" name="txtClassName">
        </div>
        <div class="mb-3 row">
          <input type="text"  placeholder="class order" name="txtClassOrder">
        </div>

        <div class="mb-3 row">
          <input type="text" placeholder="image link" name="fClassImage">
        </div>

        <div class="mb-3 row" class="form-select form-select-lg">
          <select name=slClassStatus>
          <option value=1>Active</option>
          <option value=0>Not Active</option>
        </select>
        </div>

        <div class="mb-3 row">
          <input type=submit value=Submit>
          <input type=reset value=Reset>
        </div>
      </form>

    </div>

  </div>



  <!-- hiện phần danh sách page -->
  <div style="padding:18px; text-align:center;">
    <%
        for i=1 to count
            if (i=page) then
                    response.write("<a class='btn btn-success'>" & i & "<a>")
            else 
                    response.write(" <a class='btn btn-info' href='?page=" & i & "'>" & i & "</a>")
            end if
        next
    %>
  </div>

</div>





<script>
  const formInput = document.querySelector('.formInput')

  function updateFromInput(id,name,status, order, image) {
      const html = `
        <h1 style="color:blue; text-align:center; font-size:24px">update Class</h1>

        <form action="/course/editCourse.asp" method=post>
          <div class="mb-3 row">
            <input type="text"  placeholder="class id" name="cid" value=${id}>
          </div>
          <div class="mb-3 row">
            <input type="text"  placeholder="class name" name="txtClassName" value=${name}>
          </div>
          <div class="mb-3 row">
            <input type="text"  placeholder="class order" name="txtClassOrder" value=${order}>
          </div>

          <div class="mb-3 row">
            <input type="text" placeholder="image link" name="fClassImage" value=${image}>
          </div>

          <div class="mb-3 row" class="form-select form-select-lg">
            <select name=slClassStatus value=${status}>
            <option value=1>Active</option>
            <option value=0>Not Active</option>
          </select>
          </div>

          <div class="mb-3 row">
            <input type=submit value=Update>
          </div>
        </form>
      `

      formInput.innerHTML = html
  }
</script>