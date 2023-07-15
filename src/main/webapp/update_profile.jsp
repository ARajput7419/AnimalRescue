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




<title>Update Profile</title>

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

<h2 style="margin-left: 40%; margin-top: 3%; text-shadow: 0px 0px 10px white; font-weight: bold;"><font face = "Comic sans MS">Update Profile</font></h2>


<div style="border-radius:10%; padding: 5%; background: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
margin-left:20%;margin-right: 20%;margin-bottom: 5%;margin-top: 2%;">

    <form class="container" method="post" action="update_profile_handler" enctype="multipart/form-data">

      <div class="row">
        <div class="col">
          <label for="inputusername" class="form-label">Username</label>
          <input type="text" class="form-control" name="username" id="inputusername" value="${sessionScope.user.username}"  required readonly>
        </div>
        </div>

        <br>

        <div class ="row">
        <div class="col">
          <label for="inputfname" class="form-label">First Name</label>
          <input type="text" class="form-control" id="inputfname" name="fName" value="${sessionScope.user.fName}" required>
        </div>
        <div class="col">
          <label for="inputlname" class="form-label">Last Name</label>
          <input type="text" class="form-control" id="inputlname"  name="lName" value="${sessionScope.user.lName}" >
        </div>
        </div>

        <br>

        <div class="row">
          <div class="col">
            <label for="inputemail" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="inputemail" placeholder="example@gmail.com" name="email" value="${sessionScope.user.email}" required>
          </div>
          </div>

          <br>

          <div class="row">
            <div class="col">
              <label for="inputmobile" class="form-label">Mobile Number</label>
              <input type="text" class="form-control" id="inputmobile" name="mobile" value="${sessionScope.user.mobile}" required>
            </div>
            </div>

            <br>

        <div class="row">
        <div class="col">
          <label for="inputAddress" class="form-label">Address</label>
          <input type="text" class="form-control" id="inputAddress" placeholder="673 MP Road"  name="location" value="${sessionScope.user.location}" required>
        </div>
        </div>
        
        <br><br>
        
        <div class="row">
        
        
        
          <div class="col">
          <label for="inputState" class="form-label">State </label>


          <select style="margin-left: 2%;" id="inputState" class="form-select" onchange="statechange(this)" name="state">

                        <option value="Chandigarh" <c:if test="${sessionScope.user.state=='Chandigarh'}">selected</c:if> >Chandigarh</option>
                        <option value="Andhra Pradesh"  <c:if test="${sessionScope.user.state=='Andhra Pradesh'}">selected</c:if>>Andhra Pradesh</option>
                        <option value="Andaman and Nicobar Islands" <c:if test="${sessionScope.user.state=='Andaman and Nicobar Islands'}">selected</c:if> >Andaman and Nicobar Islands</option>
                        <option value="Arunachal Pradesh" <c:if test="${sessionScope.user.state=='Arunachal Pradesh'}">selected</c:if> >Arunachal Pradesh</option>
                        <option value="Assam" <c:if test="${sessionScope.user.state=='Assam'}">selected</c:if> >Assam</option>
                        <option value="Bihar" <c:if test="${sessionScope.user.state=='Bihar'}">selected</c:if> >Bihar</option>
                        <option value="Chhattisgarh" <c:if test="${sessionScope.user.state=='Chhattisgarh'}">selected</c:if> >Chhattisgarh</option>
                        <option value="Dadar and Nagar Haveli" <c:if test="${sessionScope.user.state=='Dadar and Nagar Haveli'}">selected</c:if> >Dadar and Nagar Haveli</option>
                        <option value="Daman and Diu" <c:if test="${sessionScope.user.state=='Daman and Diu'}">selected</c:if> >Daman and Diu</option>
                        <option value="Delhi" <c:if test="${sessionScope.user.state=='Delhi'}">selected</c:if> >Delhi</option>
                        <option value="Lakshadeep" <c:if test="${sessionScope.user.state=='Lakshadeep'}">selected</c:if> >Lakshadeep</option>
                        <option value="Pondicherry" <c:if test="${sessionScope.user.state=='Pondicherry'}">selected</c:if> >Pondicherry</option>
                        <option value="Goa" <c:if test="${sessionScope.user.state=='Goa'}">selected</c:if>>Goa</option>
                        <option value="Gujarat" <c:if test="${sessionScope.user.state=='Gujarat'}">selected</c:if>>Gujarat</option>
                        <option value="Haryana" <c:if test="${sessionScope.user.state=='Haryana'}">selected</c:if> >Haryana</option>
                        <option value="Himachal Pradesh" <c:if test="${sessionScope.user.state=='Himachal Pradesh'}">selected</c:if> >Himachal Pradesh</option>
                        <option value="Jammu and Kashmir" <c:if test="${sessionScope.user.state=='Jammu and Kashmir'}">selected</c:if> >Jammu and Kashmir</option>
                        <option value="Jharkhand" <c:if test="${sessionScope.user.state=='Jharkhand'}">selected</c:if> >Jharkhand</option>
                        <option value="Karnataka" <c:if test="${sessionScope.user.state=='Karnataka'}">selected</c:if> >Karnataka</option>
                        <option value="Kerala" <c:if test="${sessionScope.user.state=='Kerala'}">selected</c:if> >Kerala</option>
                        <option value="Madhya Pradesh" <c:if test="${sessionScope.user.state=='Madhya Pradesh'}">selected</c:if> >Madhya Pradesh</option>
                        <option value="Maharashtra" <c:if test="${sessionScope.user.state=='Maharashtra'}">selected</c:if> >Maharashtra</option>
                        <option value="Manipur" <c:if test="${sessionScope.user.state=='Manipur'}">selected</c:if> >Manipur</option>
                        <option value="Meghalaya" <c:if test="${sessionScope.user.state=='Meghalaya'}">selected</c:if> >Meghalaya</option>
                        <option value="Mizoram" <c:if test="${sessionScope.user.state=='Mizoram'}">selected</c:if> >Mizoram</option>
                        <option value="Nagaland" <c:if test="${sessionScope.user.state=='Nagaland'}">selected</c:if> >Nagaland</option>
                        <option value="Odisha" <c:if test="${sessionScope.user.state=='Odisha'}">selected</c:if> >Odisha</option>
                        <option value="Punjab" <c:if test="${sessionScope.user.state=='Punjab'}">selected</c:if> >Punjab</option>
                        <option value="Rajasthan" <c:if test="${sessionScope.user.state=='Rajasthan'}">selected</c:if> >Rajasthan</option>
                        <option value="Sikkim" <c:if test="${sessionScope.user.state=='Sikkim'}">selected</c:if> >Sikkim</option>
                        <option value="Tamil Nadu" <c:if test="${sessionScope.user.state=='Tamil Nadu'}">selected</c:if> >Tamil Nadu</option>
                        <option value="Telangana" <c:if test="${sessionScope.user.state=='Telangana'}">selected</c:if> >Telangana</option>
                        <option value="Tripura" <c:if test="${sessionScope.user.state=='Tripura'}">selected</c:if> >Tripura</option>
                        <option value="Uttar Pradesh" <c:if test="${sessionScope.user.state=='Uttar Pradesh'}">selected</c:if> >Uttar Pradesh</option>
                        <option value="Uttarakhand" <c:if test="${sessionScope.user.state=='Uttarakhand'}">selected</c:if> >Uttarakhand</option>
                        <option value="West Bengal" <c:if test="${sessionScope.user.state=='West Bengal'}">selected</c:if> >West Bengal</option>

                    </select>
                  </div>

                  </div>



                  <br><br>






        <div class="row">

          <div class="col">
            <label for="inputdistrict" class="form-label">District </label>
            <select style="margin-left: 2%;" id="inputdistrict" class="form-select" name="district" value="${sessionScope.user.district}" >
              <option value="Chandigarh" selected>Chandigarh</option>
            </select>
          </div>

        </div>

        <br>

        <c:if test="${sessionScope.user.state != null}">

                       <script>

                          window.onload = function(){
                          helper("${sessionScope.user.state}");
                          }

                          </script>

        </c:if>


        <div class="row">
          <div class="col">
            <label for="inputpincode" class="form-label">Pin Code</label>
            <input type="text" class="form-control" id="inputpincode" name="pinCode"  value="${sessionScope.user.pinCode}" required>
          </div>
          </div>

          <br>

          <div class="row">
            <div class="col">
              <label for="inputpassword" class="form-label">Password</label>
              <input type="password" class="form-control" id="inputpassword" name="password" value="${sessionScope.user.password}" required>
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
          <button type="submit" class="btn btn-primary">Update</button>
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