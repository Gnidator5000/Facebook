<?php
    require_once('class/User.class.php');

    session_start();


if (isset($_REQUEST['email']) && isset($_REQUEST['password'])) {
    //wysłano formularz - przechwyć i obrób dane
    $myusername = $_REQUEST['email'];
    $mypassword = $_REQUEST['password'];
    //wywołujemy metodę klasy
    //metody statyczne w PHP wywołuje się poprzez ::
    $result = User::Login($myusername, $mypassword);
    echo $result;
    //$result zawiera true jeśli udało się zalogować lub 
    //fasle w innym wypadku
}
    
   if($_SERVER["REQUEST_METHOD"] == "POST") {
    include("dbconnect.php");

      $myusername = mysqli_real_escape_string($conn, $_POST['email']);
      $mypassword = mysqli_real_escape_string($conn, $_POST['password']);

      $hash = password_hash($mypassword,  
      PASSWORD_DEFAULT); 

      $sql = "Select * from user where email='$myusername'"; 

      $result2 = mysqli_query($conn,$sql);      
      $row = mysqli_num_rows($result2);      
      $count = mysqli_num_rows($result2);
      $user_data_row = mysqli_fetch_assoc($result2);
      echo "<script type='text/javascript'>alert('$sql');</script>";

      //$u = new User($result['id'], $result['email']);
    //   if($count == 1 && password_verify($mypassword, $user_data_row['password'])) {
	  
    //     $u = new User($result['id'], $result['email']);
    //      $_SESSION['login_user'] = $u;
    //      header("location: strona.html");
    //   } else {
    //      $error = "Twoj email lub haslo jest nieprawidlowe!";
    //      echo "<script type='text/javascript'>alert('$error');</script>";
    //   }
   }
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logowanie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container">
    <form action="login.php" method = "post">
        <div class="row text-center mt-5 mb-3">
            <h1>Logowanie</h1>
        </div>
        <div class="row">
                <div class="mb-3 col-6 offset-3">
                    <label class="form-label w-100" for="emailInput">Email:</label>
                    <input class="form-control w-100" type="email" name="email" id="emailInput">
                </div>
                <div class="mb-3 col-6 offset-3">
                <label class="form-label w-100" for="passwordInput">hasło:</label>
                <input class="form-control w-100" type="password" name="password" id="passwordInput">
                </div>
                </div>
                <div class="mb-3 col-6 offset-3">
                <button type="submit"class="btn btn-primary w-100">Zaloguj</button>
                </div>
            </form>
                <div class="mb-3 col-6 offset-3">
                <a href="strona.php">
                <button class="btn btn-primary w-100">Powrót do strony głównej</button>
                </a>
                <?php
            if (isset($result)) {
                if ($result) {
                    header("location: strona.php");
                    
                } else {
                    echo "Użytkownik nie zalogowany";
                }
            }

            ?>
                </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>