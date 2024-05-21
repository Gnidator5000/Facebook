<?php
require_once('class/User.class.php');
require_once('class/Profile.class.php');
session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista Profili</title>
    <link rel="stylesheet" href="lista.css">
</head>
<body>
<div class="container">
<?php
$profiles = Profile::GetAll();
foreach ($profiles as $profile) {
    echo '<div class="profile-item">';
    echo '<img src="'.$profile->getProfilePhotoURL($profile->getProfileID()).'" style="width: 100px ,height: 100px">';
    echo '<div class="profile-details">';
    echo $profile->getFullName();
    echo '</div>';
    echo "</div>";
}
?>
</div>
</body>
</html>