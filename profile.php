<?php
require_once('class/User.class.php');
require_once('class/Profile.class.php');
session_start();

if(isset($_REQUEST['profileID'])) {
    $profileID = $_REQUEST['profileID'];
    $p = Profile::Get($profileID);

} else {
    if(isset($_SESSION['user'])) {
        //jest zalogowany użytkownik - pokaż jego profil
        //załaduj profil zalogowanego użytkownika
        $p = Profile::GetUserProfile($_SESSION['user']->GetID());
    } else {
        //pokaż domyślny profil
        $p = Profile::Get(3);
    }
    
}
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>profil</title>
    <link rel="stylesheet" href="profil.css">
</head>
<body>
    <div class="naglowek">
    <h1>Profil</h1>
    </div>
    <div class="zdjecie">
        <img src="https://picsum.photos/800/600" alt="">
    </div>
    <div class="info">
        <p> Imie i Nazwisko: <?php echo $p->getFullName(); ?> </p> 
        <p>E-Mail: <?php echo $_SESSION['user']->GetEmail();?> </p>
    </div>
</body>
</html>
