<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
</head>
<body style="background:url(img/p5.jpg); background-size:cover; background-attachment:fixed;">
   <div class="container">
     <div class="row">
       <div class="col m6 offset-m3">
       
         <div class="card"> 
             <div class="card-content">
	             <h3 style="margin-top:10px;" class="center-align">Register here !!</h3>
	             <h6 id="msg" class="center-align"></h6>
	             
	             <div class="form center-align">
	             
	               <form action="s1" method="post" id="myform">
	                 <input type="text" name="username" placeholder="Enter your name">
	                 <input type="password" name="password" placeholder="Enter your password">
	                 <input type="email" name="email" placeholder="Enter your Email-ID">
	                 
	                 <div class="file-field input-field">
				      <div class="btn purple accent-2">
				        <span>File</span>
				        <input name="image" type="file">
				      </div>
				      <div class="file-path-wrapper">
				        <input class="file-path validate" type="text">
				      </div>
				    </div>
				    
	                 <button type="submit" class="btn blue lighten-1">Submit</button>
	               </form>
	             </div>
	             
	             <div class="loader center-align" style="margin-top:10px;display:none;">
	                    <div class="preloader-wrapper active">
					    <div class="spinner-layer spinner-red-only">
					      <div class="circle-clipper left">
					        <div class="circle"></div>
					      </div><div class="gap-patch">
					        <div class="circle"></div>
					      </div><div class="circle-clipper right">
					        <div class="circle"></div>
					      </div>
					    </div>
					  </div>
					  <h6>Please wait !!</h6>
	                  
	             </div>
             
             </div>
         
         
         </div>
       
       </div>
     
     
     </div>
   
   
   </div>
   <script
  src="https://code.jquery.com/jquery-3.6.3.min.js"
  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
  crossorigin="anonymous">
   </script>
   
  <script>
  			$(document).ready(function(){
  			  console.log("page is ready.......")
  			  
  			  $("#myform").on('submit',function(event){
  				  event.preventDefault();
  				  //var f =$(this).serialize();
  				  let f=new FormData(this);
  				  
  				  console.log(f);
  				  
  				  $(".loader").show();
  				  $(".form").hide();
  				  
  				  $.ajax({
  					  url:"s1",
  					  data:f,
  					  type:'post',
  					  success: function(data,textStatus,jqXHR){
  						  console.log(data);
  						  console.log("success............")
  						  $(".loader").hide();
  		  				  $(".form").show();
  		  				  if(data.trim() === 'done'){
  		  					  
  		  					  $('#msg').html("Successfully Registered")
  		  					  $('#msg').addClass('green-text')
  		  				  }
  		  				  else{
  		  					$('#msg').html("Something went Wrong On The Server")
  		  					 $('#msg').addClass('red-text')
  		  				  }
  						  
  						  
  					  },
  					  error:function(jqXHR , textStatus , errorThrown){
  						 console.log(data);
 						  console.log("error............")
 						  $(".loader").hide();
 		  				  $(".form").show();
 		  				  $('#msg').html("Something went Wrong On The Server")
 		  				   $('#msg').addClass('red-text')
 		  				  
  						  
  					  },
  					  processData:false,
  					  contentType: false

  					 		  
  				  })
  			  })
 			
  			})
 
  
  </script>
</body>
</html>