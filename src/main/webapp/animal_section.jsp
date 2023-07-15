<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
 



<%


request.setAttribute("context",request.getServletContext().getContextPath());
request.setAttribute("message",request.getParameter("message"));


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

<script src="districts.js"></script>

<script src="toast.js"></script>

<link rel="stylesheet" href="toast.css">



<title>Animal Section</title>

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
              <a class="nav-link" href="profile.jsp"><font face = "Comic sans MS">Profile</font></a>
            </li>

            <li class="nav-item active">
              <a class="nav-link" href="search_page"><font face = "Comic sans MS">Search</font></a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="animal_registration"><font face = "Comic sans MS">Registration</font></a>
              </li>

          </ul>
        </div>
      </nav>


    <%@ page import="database.Animal,java.util.ArrayList" %>

    <%

response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");


    ArrayList<Animal> animals = (ArrayList<Animal>)request.getAttribute("animals");

    for(Animal animal : animals){


        java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();


        if(animal.getBase64Image()==null) animal.setBase64Image(encoder.encodeToString(animal.getImage().readAllBytes()));


    }



  %>



    <c:if test="${animals != null && animals.size() != 0 }">

    <h2 style="margin-left: 40%; text-shadow: 0px 0px 10px white; font-weight: bold;">Results</h2>

    </c:if>

    <c:if test="${animals == null || animals.size() == 0 }">

        <h2 style="margin-left: 40%; text-shadow: 0px 0px 10px white; font-weight: bold;">No Entry</h2>

        </c:if>



      <section >
        <div class="container py-5">


            <c:forEach var="animal" items="${requestScope.animals}">

          <div class="row justify-content-center mb-3">
            <div class="col-md-10 col-xl-10" >
              <div class="card shadow-0 border rounded-3" style="background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);">
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                      <div class="bg-image hover-zoom ripple rounded ripple-surface">
                        <img src="data:image/${animal.type};base64,${animal.base64Image}"
                          class="w-100" />
                        
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-6">
                      <h5>${animal.location}</h5>
                      <div class="d-flex flex-row">
                        <span>ID : ${animal.id}</span>
                      </div>
                      <div class="mt-1 mb-0  small">
                        <span class="text-success">${animal.timestamp}</span>
                      </div>
                      <p class="text-truncate mb-4 mb-md-0">
                        Description : ${animal.description}
                      </p>
                      <hr>
                      <div>
                        <a href="view_entry?id=${animal.id}" style="text-decoration: none;color:black;"><button class="btn btn-primary btn-sm" type="button">More Info</button></a>
                      </div>
                      <br>
                      <div>
                        <a href="delete_entry?id=${animal.id}" style="text-decoration: none;color:black;"><button class="btn btn-danger btn-sm" type="button">Delete Entry</button></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          </c:forEach>



         
        </div>
      </section>
      



<c:if test="${message!= null}">

    <div id="snackbar">${message}</div>
    
    <script>
    
    myFunction();
    
    
    </script>
    
    
    </c:if>


    

</body>



<footer>
    <div>
      <p><font face = "Comic sans MS" size =" 2">Developed by: Aniket</font></p>
      <p><font face = "Comic sans MS" size =" 2">Contact: aniketranag123@gmail.com</font></p>
      
    </div>
  </footer>
  

</html>