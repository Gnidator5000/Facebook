<?php 
    
$showAlert = false;  
$showError = false;  
$exists=false;

if($_SERVER["REQUEST_METHOD"] == "POST") { 
      

    include 'dbconnect.php';    
    
    $username = $_POST["email"];  
    $password = $_POST["password"];  
    $cpassword = $_POST["passwordRepeat"]; 
            
    
    $sql = "Select * from user where email='$username'"; 
    
    $result = mysqli_query($conn, $sql); 
    
    $num = mysqli_num_rows($result);  
    
    if(!isset($_POST['regulamin'])){
        $showError = "Nie zaakaceptowano regulaminu"; 
        echo "<script type='text/javascript'>alert('$showError');</script>";
    }

    if($num == 0) { 
        if(($password == $cpassword) && $exists==false) { 
    
            $hash = password_hash($password,  
                                PASSWORD_DEFAULT); 
                
            $sql = "INSERT INTO `user` (`email`,  
                `password`) VALUES ('$username',  
                '$hash')"; 
    
            $result = mysqli_query($conn, $sql); 
    
        }  
        else {  
            $showError = "Haslo nie jest takie samo"; 
            echo "<script type='text/javascript'>alert('$showError');</script>";
            
        }       
    }
    
   if($num>0)  
   { 
      $exists="email juz jest zajety";  
      echo "<script type='text/javascript'>alert('$exists');</script>";
   }  
    
}   
    
?> 

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rejestracja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form action="register.php" method = "post">

        <h1 style="text-align: center">Rejestracja</h1>
        <div class="row">
                <div class="mb-3 col-6 offset-3">
                    <label class="form-label w-100" for="emailInput">Email:</label>
                    <input class="form-control w-100" type="email" name="email" id="emailInput">
                </div>
                <div class="mb-3 col-6 offset-3">
                    <label class="form-label w-100" for="passwordInput">hasło:</label>
                    <input class="form-control w-100" type="password" name="password" id="passwordInput">
                </div>
                <div class="mb-3 col-6 offset-3">
                    <label class="form-label w-100" for="passwordRepeatInput">Powtórz hasło:</label>
                    <input class="form-control w-100" type="password" name="passwordRepeat" id="passwordRepeatInput">
                    <input name= "regulamin" type="checkbox">Potwierdź regulamin
                </div>
                <div class="mb-3 col-6 offset-3">
                    <button type="submit"class="btn btn-primary w-100">Zarejestruj</button>
                </div>     
    </form>

        </div>
        <div class="mb-3 col-6 offset-3">
                <a href="strona.html">
                    <button class="btn btn-primary w-100">Powrót do strony głównej</button>
                </a>
            </div>
</div>  

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>