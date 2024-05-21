<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fejsbuk</title>
    <link rel="stylesheet" href="stronka.css">
</head>
<body>
    <header>
        <h1>Strona główna</h1>
            <a href="login.php">
            <button class="btn btn-primary">Logowanie</button>
            </a>
            <a href="register.php">
            <button class="btn btn-primary">Rejestracja</button>
            </a>
            <a href="profile.php">
            <button class="btn btn-primary">Profil</button>
            </a>
            <a href="listaprofili.php">
                <button class="btn btn-primary">Lista Profili</button>
                </a>
    </header>
    <div id="conteiner">

        <div class="post">
            <h2 class="tytul-posta">Tytuł posta</h3>
            <h3 class="autor">Autor</h3>
            <img src="https://picsum.photos/800/600" alt="post-image" class="post-image">
            <p class="opis-posta">opis posta</p>
            <div class="stopka-posta">
                <span class="data-dodania">Data i czas</span>
                <span class="wynik">+ i</span>
            </div>
        </div>

        <div class="post">
            <h2 class="tytul-posta">Tytuł posta</h3>
            <h3 class="autor">Autor</h6>
            <img src="https://picsum.photos/800/600" alt="zdj post" class="post-image">
            <p class="opis posta">opis posta</p>
            <div class="stopka-posta">
                <span class="data-dodania">Data i czas</span>
                <span class="wynik">+ i</span>
            </div>
        </div>

    </div>
</body>
</html>