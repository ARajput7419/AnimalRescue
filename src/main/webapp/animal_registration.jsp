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

<title>Animal Registration</title>

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

<h2 style="margin-left: 40%; margin-top: 3%; text-shadow: 0px 0px 10px white; font-weight: bold;"><font face = "Comic sans MS">Registration</font></h2>


<div style="border-radius:10%; padding: 5%; background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
margin-left:20%;margin-right: 20%;margin-bottom: 5%;margin-top: 2%;">

    <form class="container" method="post" action="animal_registration_handler" enctype="multipart/form-data">

      

       

        <div class="row">
        <div class="col">
          <label for="inputAddress" class="form-label">Address</label>
          <input type="text" class="form-control" id="inputAddress" placeholder="673 MP Road" name="location" required>
        </div>
        </div>
        
        <br><br>
        
        <div class="row">
        
        
        
          <div class="col">
          <label for="inputState" class="form-label">State </label>
          <select style="margin-left: 2%;" id="inputState" class="form-select" onchange="statechange(this)" name="state">
            
              <option value="Andhra Pradesh">Andhra Pradesh</option>
              <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
              <option value="Arunachal Pradesh">Arunachal Pradesh</option>
              <option value="Assam">Assam</option>
              <option value="Bihar">Bihar</option>
              <option value="Chandigarh" selected>Chandigarh</option>
              <option value="Chhattisgarh">Chhattisgarh</option>
              <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
              <option value="Daman and Diu">Daman and Diu</option>
              <option value="Delhi">Delhi</option>
              <option value="Lakshadeep">Lakshadeep</option>
              <option value="Pondicherry">Pondicherry</option>
              <option value="Goa">Goa</option>
              <option value="Gujarat">Gujarat</option>
              <option value="Haryana">Haryana</option>
              <option value="Himachal Pradesh">Himachal Pradesh</option>
              <option value="Jammu and Kashmir">Jammu and Kashmir</option>
              <option value="Jharkhand">Jharkhand</option>
              <option value="Karnataka">Karnataka</option>
              <option value="Kerala">Kerala</option>
              <option value="Madhya Pradesh">Madhya Pradesh</option>
              <option value="Maharashtra">Maharashtra</option>
              <option value="Manipur">Manipur</option>
              <option value="Meghalaya">Meghalaya</option>
              <option value="Mizoram">Mizoram</option>
              <option value="Nagaland">Nagaland</option>
              <option value="Odisha">Odisha</option>
              <option value="Punjab">Punjab</option>
              <option value="Rajasthan">Rajasthan</option>
              <option value="Sikkim">Sikkim</option>
              <option value="Tamil Nadu">Tamil Nadu</option>
              <option value="Telangana">Telangana</option>
              <option value="Tripura">Tripura</option>
              <option value="Uttar Pradesh">Uttar Pradesh</option>
              <option value="Uttarakhand">Uttarakhand</option>
              <option value="West Bengal">West Bengal</option>

          </select>
        </div>

        </div>



        <br><br>

        <div class="row">

          <div class="col">
            <label for="inputdistrict" class="form-label">District </label>
            <select style="margin-left: 2%;" id="inputdistrict" class="form-select" name="district">
              <option value="Chandigarh" selected>Chandigarh</option>
            </select>
          </div>

        </div>

        <br>


        <div class="row">
          <div class="col">
            <label for="inputpincode" class="form-label">Pin Code</label>
            <input type="text" class="form-control" id="inputpincode" name="pinCode" required>
          </div>
          </div>

          <br>


          <div class="row">
            <div class="col">
              <label for="inputcategory" class="form-label">Category</label>
              <input type="text" class="form-control" id="inputcategory" name="category" required>
            </div>
            </div>

            <br>


            <div class="row">
                <div class="col">
                  <label for="inputdescription" class="form-label">Description</label>
                  <input type="text" class="form-control" id="inputdescription" name="description" required>
                </div>
                </div>
    
                <br>
          





            <div class="custom-file">
          
              <label class="form-label" for="photo">Choose photo</label>
              <input type="file" class="form-control" id="photo" name="image"/>

            </div>

            <br><br>

        <div style="margin-top: 10%;" class="row">
        <div class="col">
          <button type="submit" class="btn btn-primary">Register</button>
        </div>
        </div>
      </form>

</div>
    



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