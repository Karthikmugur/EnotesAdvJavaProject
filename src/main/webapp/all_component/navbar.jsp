<%@ page import="com.User.UserList"%>
<%@ page import="com.Dao.UserDao"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
  <div class="container-fluid">
    <span class="navbar-brand" Style="font-size: 30px;">
    <i class="fa fa-book" aria-hidden="true"></i>ENotes</span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">
          <i class="fa fa-home" aria-hidden="true"></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="addNotes.jsp">
          <i class="fa fa-plus-circle" aria-hidden="true"></i>Add Notes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="showNotes.jsp">
          <i class="fa fa-address-book" aria-hidden="true"></i>Show Notes</a>
        </li>
      </ul>
      
      <%
      
      UserList user = (UserList) session.getAttribute("userl");
      
      if(user!=null){
    	  %>
    	        <form class="d-flex">
        <a class="btn btn-light me-3" href="" type="submit" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <i class="fa fa-user-circle-o" aria-hidden="true"></i> <%= user.getName() %></a>
        <a class="btn btn-light" href="logoutServlet" type="submit">
        <i class="fa fa-sign-out" aria-hidden="true"></i>  Logout</a>
      </form>
    	  
    	  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container" style="text-align-center">
        <i class="fa fa-user fs-2" aria-hidden="true"></i>
        
        <table class="table">
        <tbody>
        
        <tr>
        <th>User Id : </th>
        <td><%= user.getId() %></td>
        </tr>
        
        <tr>
        <th>Full Name : </th>
        <td><%= user.getName() %></td>
        </tr>
        
        <tr>
        <th>Email Id : </th>
        <td><%= user.getEmail() %></td>
        </tr>
        
        </tbody>
        </table>
        </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

    	  <%
      }
      else{
    	  %>
    	  <form class="d-flex">
        <a class="btn btn-light me-3" href="login.jsp" type="submit">
        <i class="fa fa-sign-in" aria-hidden="true"></i>  Login</a>
        <a class="btn btn-light" href="register.jsp" type="submit">
        <i class="fa fa-user-plus" aria-hidden="true"></i>  Register</a>
      </form>
    	  <%
      }
      %>
      
    </div>
    




  </div>
</nav>