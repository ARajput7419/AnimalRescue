<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>




<%


request.setAttribute("context",request.getServletContext().getContextPath());



%>


<html>
<head>



<style>

body{
    background: linear-gradient(to right, #ec77ab 0%, #7873f5 100%);

}




footer {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
  font-size: 16px;
}

footer p {
  margin: 5px 0;
}

footer p:hover {
  text-decoration: underline;
}


.navbar .navbar-nav .nav-link:hover {
    background-color: #7873f5;
    color:white;

  }

.nav-item{

padding: 1%;

}

.navbar .navbar-nav .nav-link {

  padding: 0.7em;
  font-size: 1.2em;
  transition: all 0.5s;
}
.navbar .navbar-brand {
  padding: 0 0.6em;
  font-size: 1.5em;
  font-weight: bold;
}

@media only screen and (min-width: 992px) {
  .navbar {
    padding: 0;
  }
  .navbar .navbar-nav .nav-link {
    padding: 1em 0.7em;

  }
  .navbar .navbar-brand {
    padding: 0 0.8em;
  }







}

@media (max-width: 767.98px) { .border-sm-start-none { border-left: none !important; } }





*{
    font-family: “Comic Sans MS”, “Comic Sans”, cursive;

}

</style>




<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



<title>Deletion</title>

</head>

<body>

    <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="${context}"><font face = "Comic sans MS">Animal Rescue</font></a>
        <button style="margin-bottom: 1em;"class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">

            <li class="nav-item active">
              <a class="nav-link" href="${context}"><font face = "Comic sans MS">Home</font></a>
            </li>

            <li class="nav-item active">
              <a class="nav-link" href="login"><font face = "Comic sans MS">Login</font></a>
            </li>

            <li class="nav-item active">
              <a class="nav-link" href="registration"><font face = "Comic sans MS">Registration</font></a>
            </li>



          </ul>
        </div>
      </nav>





<br><br>
<h2 style="color:black;">Status &nbsp: ${status}</h2>

<h3 style="color:black;">Message : ${message}</h3>












</body>

</html>