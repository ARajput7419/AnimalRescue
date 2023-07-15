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

<title>Registration</title>

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

          </ul>
        </div>
      </nav>

<h2 style="margin-left: 40%; margin-top: 3%; text-shadow: 0px 0px 10px white; font-weight: bold;"><font face = "Comic sans MS">Registration</font></h2>


<div style="border-radius:10%; padding: 5%; background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
margin-left:20%;margin-right: 20%;margin-bottom: 5%;margin-top: 2%;">

    <form class="container" method="post" action="registration_handler" enctype="multipart/form-data" >

      <div class="row">
        <div class="col">
          <label for="inputusername" class="form-label">Username</label>
          <input type="text" class="form-control" id="inputusername" name="username" value="${requestScope.user.username}" required>
        </div>
        </div>

        <br>

        <div class ="row">
        <div class="col">
          <label for="inputfname" class="form-label">First Name</label>
          <input type="text" class="form-control" id="inputfname" name="fName" value="${requestScope.user.fName}" required>
        </div>
        <div class="col">
          <label for="inputlname" class="form-label">Last Name</label>
          <input type="text" class="form-control" id="inputlname" name="lName"  value="${requestScope.user.lName}" >
        </div>
        </div>

        <br>

        <div class="row">
          <div class="col">
            <label for="inputemail" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="inputemail" placeholder="example@gmail.com" name="email" value="${requestScope.user.email}" required>
          </div>
          </div>

          <br>

          <div class="row">
            <div class="col">
              <label for="inputmobile" class="form-label">Mobile Number</label>
              <input type="text" class="form-control" id="inputmobile" name="mobile" value="${requestScope.user.mobile}" required>
            </div>
            </div>

            <br>

        <div class="row">
        <div class="col">
          <label for="inputAddress" class="form-label">Address</label>
          <input type="text" class="form-control" id="inputAddress" placeholder="673 MP Road" name="location" value="${requestScope.user.location}"  required>
        </div>
        </div>
        
        <br><br>
        
        <div class="row">
        
        
        
          <div class="col">
          <label for="inputState" class="form-label">State </label>
          <select style="margin-left: 2%;" id="inputState" class="form-select" onchange="statechange(this)" name="state">

              <option value="Chandigarh" <c:if test="${requestScope.user.state=='Chandigarh'}">selected</c:if> >Chandigarh</option>
              <option value="Andhra Pradesh"  <c:if test="${requestScope.user.state=='Andhra Pradesh'}">selected</c:if>>Andhra Pradesh</option>
              <option value="Andaman and Nicobar Islands" <c:if test="${requestScope.user.state=='Andaman and Nicobar Islands'}">selected</c:if> >Andaman and Nicobar Islands</option>
              <option value="Arunachal Pradesh" <c:if test="${requestScope.user.state=='Arunachal Pradesh'}">selected</c:if> >Arunachal Pradesh</option>
              <option value="Assam" <c:if test="${requestScope.user.state=='Assam'}">selected</c:if> >Assam</option>
              <option value="Bihar" <c:if test="${requestScope.user.state=='Bihar'}">selected</c:if> >Bihar</option>
              <option value="Chhattisgarh" <c:if test="${requestScope.user.state=='Chhattisgarh'}">selected</c:if> >Chhattisgarh</option>
              <option value="Dadar and Nagar Haveli" <c:if test="${requestScope.user.state=='Dadar and Nagar Haveli'}">selected</c:if> >Dadar and Nagar Haveli</option>
              <option value="Daman and Diu" <c:if test="${requestScope.user.state=='Daman and Diu'}">selected</c:if> >Daman and Diu</option>
              <option value="Delhi" <c:if test="${requestScope.user.state=='Delhi'}">selected</c:if> >Delhi</option>
              <option value="Lakshadeep" <c:if test="${requestScope.user.state=='Lakshadeep'}">selected</c:if> >Lakshadeep</option>
              <option value="Pondicherry" <c:if test="${requestScope.user.state=='Pondicherry'}">selected</c:if> >Pondicherry</option>
              <option value="Goa" <c:if test="${requestScope.user.state=='Goa'}">selected</c:if>>Goa</option>
              <option value="Gujarat" <c:if test="${requestScope.user.state=='Gujarat'}">selected</c:if>>Gujarat</option>
              <option value="Haryana" <c:if test="${requestScope.user.state=='Haryana'}">selected</c:if> >Haryana</option>
              <option value="Himachal Pradesh" <c:if test="${requestScope.user.state=='Himachal Pradesh'}">selected</c:if> >Himachal Pradesh</option>
              <option value="Jammu and Kashmir" <c:if test="${requestScope.user.state=='Jammu and Kashmir'}">selected</c:if> >Jammu and Kashmir</option>
              <option value="Jharkhand" <c:if test="${requestScope.user.state=='Jharkhand'}">selected</c:if> >Jharkhand</option>
              <option value="Karnataka" <c:if test="${requestScope.user.state=='Karnataka'}">selected</c:if> >Karnataka</option>
              <option value="Kerala" <c:if test="${requestScope.user.state=='Kerala'}">selected</c:if> >Kerala</option>
              <option value="Madhya Pradesh" <c:if test="${requestScope.user.state=='Madhya Pradesh'}">selected</c:if> >Madhya Pradesh</option>
              <option value="Maharashtra" <c:if test="${requestScope.user.state=='Maharashtra'}">selected</c:if> >Maharashtra</option>
              <option value="Manipur" <c:if test="${requestScope.user.state=='Manipur'}">selected</c:if> >Manipur</option>
              <option value="Meghalaya" <c:if test="${requestScope.user.state=='Meghalaya'}">selected</c:if> >Meghalaya</option>
              <option value="Mizoram" <c:if test="${requestScope.user.state=='Mizoram'}">selected</c:if> >Mizoram</option>
              <option value="Nagaland" <c:if test="${requestScope.user.state=='Nagaland'}">selected</c:if> >Nagaland</option>
              <option value="Odisha" <c:if test="${requestScope.user.state=='Odisha'}">selected</c:if> >Odisha</option>
              <option value="Punjab" <c:if test="${requestScope.user.state=='Punjab'}">selected</c:if> >Punjab</option>
              <option value="Rajasthan" <c:if test="${requestScope.user.state=='Rajasthan'}">selected</c:if> >Rajasthan</option>
              <option value="Sikkim" <c:if test="${requestScope.user.state=='Sikkim'}">selected</c:if> >Sikkim</option>
              <option value="Tamil Nadu" <c:if test="${requestScope.user.state=='Tamil Nadu'}">selected</c:if> >Tamil Nadu</option>
              <option value="Telangana" <c:if test="${requestScope.user.state=='Telangana'}">selected</c:if> >Telangana</option>
              <option value="Tripura" <c:if test="${requestScope.user.state=='Tripura'}">selected</c:if> >Tripura</option>
              <option value="Uttar Pradesh" <c:if test="${requestScope.user.state=='Uttar Pradesh'}">selected</c:if> >Uttar Pradesh</option>
              <option value="Uttarakhand" <c:if test="${requestScope.user.state=='Uttarakhand'}">selected</c:if> >Uttarakhand</option>
              <option value="West Bengal" <c:if test="${requestScope.user.state=='West Bengal'}">selected</c:if> >West Bengal</option>

          </select>
        </div>

        </div>



        <br><br>




        <div class="row">

          <div class="col">
            <label for="inputdistrict" class="form-label">District </label>
            <select style="margin-left: 2%;" id="inputdistrict" class="form-select" name="district" value="${requestScope.user.district}" >

              <option value="Chandigarh" selected>Chandigarh</option>

            </select>
          </div>

        </div>

        <br>

        <c:if test="${requestScope.user.state != null}">

                               <script>

                                 window.onload = function(){
                                  helper("${requestScope.user.state}");
                                  }

                                  </script>

                </c:if>


        <div class="row">
          <div class="col">
            <label for="inputpincode" class="form-label">Pin Code</label>
            <input type="text" class="form-control" id="inputpincode" name="pinCode" value="${requestScope.user.pinCode}" required>
          </div>
          </div>

          <br>

          <div class="row">
            <div class="col">
              <label for="inputpassword" class="form-label">Password</label>
              <input type="password" class="form-control" id="inputpassword" name="password" value="${requestScope.user.password}"  required>
            </div>
            </div>


            <br>



            <div class="custom-file">
          
              <label class="form-label" for="photo">Choose photo</label>
              <input type="file" class="form-control" id="photo" name="image" />

            </div>

            <br><br>

        <div style="margin-top: 10%;" class="row">
        <div class="col">
          <button type="submit" class="btn btn-primary">Register</button>
        </div>
        </div>
      </form>

</div>
    

</body>

<c:if test="${message!= null}">

<div id="snackbar">${message}</div>

<script>

myFunction();


</script>


</c:if>



<footer>
    <div>
      <p><font face = "Comic sans MS" size =" 2">Developed by: Aniket</font></p>
      <p><font face = "Comic sans MS" size =" 2">Contact: aniketranag123@gmail.com</font></p>
      
    </div>
  </footer>
  

</html>