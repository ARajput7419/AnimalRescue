<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<%


request.setAttribute("context",request.getServletContext().getContextPath());


%>

<html>

<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<style>




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

  
</style>

<title>Animal Resue</title>

</head>


<body style="background-color: black; ">


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
              <a class="nav-link" href="registration"><font face = "Comic sans MS">Registration</font></a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="login"><font face = "Comic sans MS">Login</font></a>
            </li>

           

            <li class="nav-item active">
              <a class="nav-link" href="#aboutus"><font face = "Comic sans MS">About Us</font></a>
            </li>

            <li class="nav-item active">
              <a class="nav-link" href="#ourmission"><font face = "Comic sans MS">Our Mission</font></a>
            </li>

            <li class="nav-item active">
              <a class="nav-link" href="#ourhistory"><font face = "Comic sans MS">Our History</font></a>
            </li>  
          </ul>
        </div>
      </nav>



    <div  id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="dog1.jpg" height="90%" alt="First slide">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="dog2.jpg" height="90%" alt="Second slide">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="dog3.jpg" height="90%" alt="Third slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>


     






<div id="aboutus" class="container-fluid bg-success text-white" style="padding:100px 20px; margin-top: 5%;">
  <h1>About Us</h1>
  <p><font face = "Comic sans MS" size =" 5">Welcome to Animal Rescue, where we are dedicated to helping animals in need. We are a non-profit organization that works to rescue animals from shelters, abuse, neglect, and abandonment, and find them loving forever homes.</font></p>
</div>

<div id="ourmission" class="container-fluid bg-warning" style="padding:100px 20px;">
  <h1>Our Mission</h1>
  <p><font face = "Comic sans MS" size =" 5">Our mission is to provide a safe and loving environment for all animals in need, and to advocate for their welfare through education and outreach programs.</font></p>
</div>

<div id="ourhistory" class="container-fluid bg-secondary text-white" style="padding:100px 20px;">
  <h1>Our History</h1>
    <p><font face = "Comic sans MS" size =" 5">Animal Rescue was founded in 2023 by Aniket, who saw a need for an organization dedicated to rescuing animals in his community. Since then, we have rescued many animals and helped them find loving homes.</font></p>
</div>



</body>

<footer>
  <div>
    <p><font face = "Comic sans MS" size =" 2">Developed by: Aniket</font></p>
    <p><font face = "Comic sans MS" size =" 2">Contact: aniketranag123@gmail.com</font></p>
    
  </div>
</footer>



</html>