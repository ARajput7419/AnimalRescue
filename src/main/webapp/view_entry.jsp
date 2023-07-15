
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
 



<%


request.setAttribute("context",request.getServletContext().getContextPath());



%>


<%@ page import="database.Animal" %>

<% 

java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();

Animal animal = (Animal)request.getAttribute("animal");

if(animal.getBase64Image()==null) animal.setBase64Image(encoder.encodeToString(animal.getImage().readAllBytes()));


%>

<html>
<head>

<style>

body{
    background: linear-gradient(to right, #ec77ab 0%, #7873f5 100%);

}



body{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);    
}
.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background:linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
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


*{
    font-family: “Comic Sans MS”, “Comic Sans”, cursive;

}



    

</style>



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>





<title>Animal Entry</title>

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
              <a class="nav-link" href="search_page"><font face = "Comic sans MS">Search</font></a>
            </li>


            <li class="nav-item active">
                <a class="nav-link" href="profile.jsp"><font face = "Comic sans MS">Profile</font></a>
              </li>

           
         


          </ul>
        </div>
      </nav>




      <div class="container">
        <div class="main-body">
        
             
        
              <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center text-center">
                        <img src="data:image/${animal.type};base64,${animal.base64Image}" alt="Admin"  width="200">
                        <div class="mt-3">
                          <p class="text-muted font-size-sm">${animal.location}</p>
                          <p class="text-danger">Posted By : ${user.fName} ${user.lName} </p>

                        </div>
                      </div>
                    </div>
                  </div>

                
                  
                  
                </div>
                <div class="col-md-8">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Email</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${user.email}
                        </div>
                      </div>
                      <hr>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Mobile</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${user.mobile}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Location</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${animal.location}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">State</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${animal.state}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">District</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${animal.district}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Pincode</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${animal.pinCode}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Category</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${animal.category}
                        </div>
                      </div>
                        <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Description</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${animal.description}
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Reg. Time</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          ${animal.timestamp}
                        </div>
                      </div>

                      <hr>

                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Status</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          <c:if test="${animal.served}">
                            Rescued
                          </c:if>
                          <c:if test="${!animal.served}">
                          Not Rescued
                          </c:if>
                        </div>
                      </div>

                    </div>
                  </div>
    
                
    
                </div>
              </div>
    
            </div>
        </div>





</body>


<footer>
    <div>
      <p><font face = "Comic sans MS" size =" 2">Developed by: Aniket</font></p>
      <p><font face = "Comic sans MS" size =" 2">Contact: aniketranag123@gmail.com</font></p>
      
    </div>
  </footer>
  

</html>