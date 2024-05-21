-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Maj 2024, 22:19
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `facebook`
--
CREATE DATABASE IF NOT EXISTS `facebook` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `facebook`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `friend`
--

CREATE TABLE `friend` (
  `id` int(11) NOT NULL,
  `profile1ID` int(11) NOT NULL,
  `profile2ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `profileID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `profileID` int(11) NOT NULL,
  `url` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `photo`
--

INSERT INTO `photo` (`id`, `profileID`, `url`) VALUES
(1, 1, 'https://picsum.photos/200/300'),
(2, 2, 'https://picsum.photos/300/400');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `FirstName` varchar(128) NOT NULL,
  `LastName` varchar(128) NOT NULL,
  `profilePhotoD` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `profile`
--

INSERT INTO `profile` (`id`, `userid`, `FirstName`, `LastName`, `profilePhotoD`, `description`) VALUES
(1, 4, 'Braian', 'Kropidlowski', 1, 'dupa'),
(2, 3, 'Felek', 'Felczasty', 2, 'dupa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `profiletype`
--

CREATE TABLE `profiletype` (
  `id` int(11) NOT NULL,
  `profileID` int(11) NOT NULL,
  `url` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(3, 'protoplast1221@gmail.com', '$2y$10$7wKfPVvlwJSkM4C3Yjw2F.TESkB0WWscQgSz9To4/opJlqTomhwcy'),
(4, 'a@wp.pl', '$2y$10$46IXLYiuU4VmIby/i9Usq.8.dpi1qw2wpQ4/Z0WYJoP1V19WE9ZIe'),
(6, 'brandon@brandon.com', '$2y$10$XzGI3AZgX5x9X.GpV6kzYefx.YKdINNTr0yZTvhfiRgqhkL5ajywC');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profileID` (`profileID`);

--
-- Indeksy dla tabeli `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indeksy dla tabeli `profiletype`
--
ALTER TABLE `profiletype`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `friend`
--
ALTER TABLE `friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `profiletype`
--
ALTER TABLE `profiletype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`profileID`) REFERENCES `profile` (`id`);

--
-- Ograniczenia dla tabeli `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);
--
-- Baza danych: `fb`
--
CREATE DATABASE IF NOT EXISTS `fb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fb`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `likes`
--

CREATE TABLE `likes` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Zrzut danych tabeli `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `value`) VALUES
(1, 11, 20, 1),
(2, 11, 13, -1),
(3, 8, 11, 1),
(4, 18, 12, 1),
(5, 20, 16, -1),
(6, 2, 10, 1),
(7, 16, 2, -1),
(8, 7, 4, 1),
(9, 19, 9, -1),
(10, 15, 3, 1),
(11, 5, 13, 0),
(12, 6, 10, 1),
(13, 15, 15, 1),
(14, 2, 1, -1),
(15, 17, 5, -1),
(16, 4, 13, -1),
(17, 10, 2, -1),
(18, 6, 14, -1),
(19, 5, 10, 1),
(20, 18, 18, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posts`
--

CREATE TABLE `posts` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Zrzut danych tabeli `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `timestamp`) VALUES
(1, 13, 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', '2023-04-27 17:44:49'),
(2, 7, 'at turpis donec posuere metus vitae ipsum aliquam non mauris', '2023-04-27 17:44:49'),
(3, 5, 'nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia', '2023-04-27 17:44:49'),
(4, 5, 'vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede', '2023-04-27 17:44:49'),
(5, 11, 'rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi', '2023-04-27 17:44:49'),
(6, 15, 'turpis eget elit sodales scelerisque mauris sit', '2023-04-27 17:44:49'),
(7, 11, 'non pretium quis lectus suspendisse', '2023-04-27 17:44:49'),
(8, 15, 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor', '2023-04-27 17:44:49'),
(9, 3, 'morbi odio odio elementum eu interdum eu tincidunt in leo maecenas', '2023-04-27 17:44:49'),
(10, 3, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis', '2023-04-27 17:44:49'),
(11, 9, 'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', '2023-04-27 17:44:49'),
(12, 5, 'sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel', '2023-04-27 17:44:49'),
(13, 18, 'curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est', '2023-04-27 17:44:49'),
(14, 19, 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium', '2023-04-27 17:44:49'),
(15, 20, 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', '2023-04-27 17:44:49'),
(16, 11, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices', '2023-04-27 17:44:49'),
(17, 17, 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', '2023-04-27 17:44:49'),
(18, 15, 'mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', '2023-04-27 17:44:49'),
(19, 17, 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', '2023-04-27 17:44:49'),
(20, 19, 'varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus', '2023-04-27 17:44:49');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_bio`
--

CREATE TABLE `users_bio` (
  `id` int(11) DEFAULT NULL,
  `bio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_bio`
--

INSERT INTO `users_bio` (`id`, `bio`) VALUES
(1, 'Salter-Harris Type IV physeal fracture of lower en'),
(2, 'Focal chorioretin inflam, macular or paramacular, '),
(3, 'Unsp fx first MC bone, unsp hand, subs for fx w ma'),
(4, 'Nondisp fx of lateral condyle of r femr, 7thE'),
(5, 'Corrosions involving 30-39% of body surface'),
(6, 'Frostbite with tissue necrosis of right toe(s)'),
(7, 'Unspecified superficial injury of left upper arm, '),
(8, 'Mucopolysaccharidosis, unspecified'),
(9, 'Laceration without foreign body of thyroid gland, '),
(10, 'Nondisp fx of body of left calcaneus, init for clo'),
(11, 'Unsp physl fx lower end r fibula, subs for fx w ro'),
(12, 'Parasomnia in conditions classified elsewhere'),
(13, 'Salter-Harris Type IV physeal fracture of right ca'),
(14, 'Corrosion of cornea and conjunctival sac, unsp eye'),
(15, 'Myositis ossificans traumatica, unspecified site'),
(16, 'Displacmnt of cardiac and vascular devices and imp'),
(17, 'Corros 30-39% of body surface w 30-39% third degre'),
(18, 'Other streptococcal arthritis, left hand'),
(19, 'Displaced unspecified fracture of unspecified less'),
(20, 'Unspecified open wound, unspecified thigh, subs en');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_email`
--

CREATE TABLE `users_email` (
  `id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_email`
--

INSERT INTO `users_email` (`id`, `email`) VALUES
(1, 'jnewell0@smugmug.com'),
(2, 'pstukings1@illinois.edu'),
(3, 'avallery2@businessinsider.com'),
(4, 'agauge3@uol.com.br'),
(5, 'ltooting4@yandex.ru'),
(6, 'jhaszard5@toplist.cz'),
(7, 'khammonds6@skyrock.com'),
(8, 'nrolley7@cdbaby.com'),
(9, 'rsyalvester8@amazonaws.com'),
(10, 'jcoie9@uiuc.edu'),
(11, 'klambertoa@uol.com.br'),
(12, 'mlocalb@google.ru'),
(13, 'rrubenovicc@gravatar.com'),
(14, 'afeckeyd@angelfire.com'),
(15, 'shruse@biblegateway.com'),
(16, 'fwidocksf@prweb.com'),
(17, 'cenochssong@i2i.jp'),
(18, 'agarthlandh@slate.com'),
(19, 'dbarenskiei@theguardian.com'),
(20, 'dfoggoj@1und1.de');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_firstname`
--

CREATE TABLE `users_firstname` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_firstname`
--

INSERT INTO `users_firstname` (`id`, `first_name`) VALUES
(1, 'Brian'),
(2, 'Peterus'),
(3, 'Ruddy'),
(4, 'Shaine'),
(5, 'Gustave'),
(6, 'Giles'),
(7, 'Corey'),
(8, 'Moses'),
(9, 'Lind'),
(10, 'Barry'),
(11, 'Ian'),
(12, 'Tandy'),
(13, 'Bradly'),
(14, 'Ettie'),
(15, 'Cati'),
(16, 'Eunice'),
(17, 'Giselle'),
(18, 'Amanda'),
(19, 'Faunie'),
(20, 'Nisse');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_gender`
--

CREATE TABLE `users_gender` (
  `id` int(11) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_gender`
--

INSERT INTO `users_gender` (`id`, `gender`) VALUES
(1, 'Facet'),
(2, 'Facet'),
(3, 'Kobieta'),
(4, 'Facet'),
(5, 'Facet'),
(6, 'Facet'),
(7, 'Kobieta'),
(8, 'Facet'),
(9, 'Kobieta'),
(10, 'Facet'),
(11, 'Facet'),
(12, 'Facet'),
(13, 'Facet'),
(14, 'Kobieta'),
(15, 'Kobieta'),
(16, 'Kobieta'),
(17, 'Kobieta'),
(18, 'Facet'),
(19, 'Facet'),
(20, 'Facet');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_lastname`
--

CREATE TABLE `users_lastname` (
  `id` int(11) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_lastname`
--

INSERT INTO `users_lastname` (`id`, `last_name`) VALUES
(1, 'Kropidłowski'),
(2, 'Prydie'),
(3, 'Wilcock'),
(4, 'Caro'),
(5, 'Stoodale'),
(6, 'Tynnan'),
(7, 'Blakeborough'),
(8, 'Ferney'),
(9, 'Dundendale'),
(10, 'Disman'),
(11, 'Mont'),
(12, 'Sperski'),
(13, 'Nibley'),
(14, 'Bonny'),
(15, 'Mc Caghan'),
(16, 'Itzkin'),
(17, 'Marklew'),
(18, 'Barr'),
(19, 'Cribbins'),
(20, 'MacCulloch');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_password`
--

CREATE TABLE `users_password` (
  `id` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_password`
--

INSERT INTO `users_password` (`id`, `password`) VALUES
(1, 'ByAiETV'),
(2, 'QczCmSdF'),
(3, 'SCpZWiWCVtE5'),
(4, 'cnJYlIaVSH'),
(5, 'ctcf5FNq'),
(6, 'GlUres'),
(7, 'mGoO0j'),
(8, 'jguG3FN3IY'),
(9, 'M7lbf2Qk'),
(10, '8bMnJJ'),
(11, '2d8avYsp'),
(12, 'PMMuII9cP'),
(13, 'u70yb4'),
(14, 'Vy6hNj'),
(15, '7fhyFsdhXI3'),
(16, 'CBHnV28'),
(17, '2vg18e'),
(18, 'Tz034VJjLxbP'),
(19, 'kKSTMAV'),
(20, '5KagPBt2wXaW');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_profile_picture`
--

CREATE TABLE `users_profile_picture` (
  `id` int(11) DEFAULT NULL,
  `profile_picture` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_profile_picture`
--

INSERT INTO `users_profile_picture` (`id`, `profile_picture`) VALUES
(1, '3aogQjBXYTTI'),
(2, 'wyoKnYA'),
(3, '5pzspmPKxUhx'),
(4, 'pwU6jiOGf4'),
(5, 'ZI6fKevosNb3'),
(6, 'IBXcgR3WRS'),
(7, '7fqTObzYafB'),
(8, 'iOds6G3Q2Pb'),
(9, 'bbWOV2zRZWK'),
(10, 'oTtw6Q'),
(11, 'DRoY2Y'),
(12, 'CPFRXPn'),
(13, '9PVo0S'),
(14, 'z8peUW'),
(15, '8mDqkFX'),
(16, 'RgZXJ4tgUF'),
(17, 'tLoplSW7EW8'),
(18, 'fBH56P'),
(19, 'ryvsUvem5'),
(20, '41O4Bv4hLF3B');
--
-- Baza danych: `kino`
--
CREATE DATABASE IF NOT EXISTS `kino` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kino`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `id` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `rezyser` varchar(255) NOT NULL,
  `rok_produkcji` year(4) NOT NULL,
  `czas_trwania` time NOT NULL,
  `gatunek` varchar(255) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `filmy`
--

INSERT INTO `filmy` (`id`, `tytul`, `rezyser`, `rok_produkcji`, `czas_trwania`, `gatunek`, `opis`) VALUES
(1, 'Szybcy i wściekli 9', 'Justin Lin', 2021, '02:23:00', 'Akcja', 'Dominic Toretto i jego załoga stają do walki z najgroźniejszym wrogiem - Domem, który stał się ich największym zagrożeniem.'),
(2, 'Łowcy skarbów', 'Jon Turteltaub', 2004, '02:10:00', 'Przygodowy', 'Ben Gates poszukuje skarbu, który miał zostać ukryty podczas wojny secesyjnej.'),
(3, 'Avengers: Wojna bez granic', 'Anthony Russo, Joe Russo', 2018, '02:29:00', 'Akcja', 'Thanos chce zdobyć wszystkie Kamienie Nieskończoności, by zrealizować swoje chore marzenie.'),
(4, 'Król Lew', 'Roger Allers, Rob Minkoff', 1994, '01:28:00', 'Animacja', 'Afrykański król zwierząt musi zmierzyć się z rywalizacją w swojej królewskiej rodzinie.'),
(5, 'Piraci z Karaibów: Klątwa Czarnej Perły', 'Gore Verbinski', 2003, '02:23:00', 'Przygodowy', 'Kapitan Jack Sparrow poszukuje mitycznego statku, na którego pokładzie ukryto skarb.'),
(6, 'Zielona Mila', 'Frank Darabont', 1999, '03:08:00', 'Dramat', 'Więzień skazany na śmierć zostaje strażnikiem więzienia, gdzie dochodzi do niezwykłych wydarzeń.'),
(7, 'Harry Potter i Kamień Filozoficzny', 'Chris Columbus', 2001, '02:32:00', 'Fantasy', 'Młody chłopak odkrywa, że jest czarodziejem i wkracza do magicznego świata.'),
(8, 'Gwiezdne wojny: Ostatni Jedi', 'Rian Johnson', 2017, '02:32:00', 'Science fiction', 'Rey poszukuje Luke\'a Skywalkera, by pomógł w walce z Pierwszym Porządkiem.'),
(9, 'Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, '02:16:00', 'Science fiction', 'Programista odkrywa, że świat, w którym żyje, jest tylko iluzją i dołącza do walki przeciwko systemowi.'),
(10, 'Mad Max: Na drodze gniewu', 'George Miller', 2015, '02:00:00', 'Akcja', 'Max zostaje porwany przez kult zwiadowców i musi walczyć o swoje przetrwanie.'),
(11, 'Szybcy i wściekli 9', 'Justin Lin', 2021, '02:23:00', 'Akcja', 'Dominic Toretto i jego załoga stają do walki z najgroźniejszym wrogiem - Domem, który stał się ich największym zagrożeniem.'),
(12, 'Łowcy skarbów', 'Jon Turteltaub', 2004, '02:10:00', 'Przygodowy', 'Ben Gates poszukuje skarbu, który miał zostać ukryty podczas wojny secesyjnej.'),
(13, 'Avengers: Wojna bez granic', 'Anthony Russo, Joe Russo', 2018, '02:29:00', 'Akcja', 'Thanos chce zdobyć wszystkie Kamienie Nieskończoności, by zrealizować swoje chore marzenie.'),
(14, 'Król Lew', 'Roger Allers, Rob Minkoff', 1994, '01:28:00', 'Animacja', 'Afrykański król zwierząt musi zmierzyć się z rywalizacją w swojej królewskiej rodzinie.'),
(15, 'Piraci z Karaibów: Klątwa Czarnej Perły', 'Gore Verbinski', 2003, '02:23:00', 'Przygodowy', 'Kapitan Jack Sparrow poszukuje mitycznego statku, na którego pokładzie ukryto skarb.'),
(16, 'Zielona Mila', 'Frank Darabont', 1999, '03:08:00', 'Dramat', 'Więzień skazany na śmierć zostaje strażnikiem więzienia, gdzie dochodzi do niezwykłych wydarzeń.'),
(17, 'Harry Potter i Kamień Filozoficzny', 'Chris Columbus', 2001, '02:32:00', 'Fantasy', 'Młody chłopak odkrywa, że jest czarodziejem i wkracza do magicznego świata.'),
(18, 'Gwiezdne wojny: Ostatni Jedi', 'Rian Johnson', 2017, '02:32:00', 'Science fiction', 'Rey poszukuje Luke\'a Skywalkera, by pomógł w walce z Pierwszym Porządkiem.'),
(19, 'Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, '02:16:00', 'Science fiction', 'Programista odkrywa, że świat, w którym żyje, jest tylko iluzją i dołącza do walki przeciwko systemowi.'),
(20, 'Mad Max: Na drodze gniewu', 'George Miller', 2015, '02:00:00', 'Akcja', 'Max zostaje porwany przez kult zwiadowców i musi walczyć o swoje przetrwanie.'),
(21, 'Szybcy i wściekli 9', 'Justin Lin', 2021, '02:23:00', 'Akcja', 'Dominic Toretto i jego załoga stają do walki z najgroźniejszym wrogiem - Domem, który stał się ich największym zagrożeniem.'),
(22, 'Łowcy skarbów', 'Jon Turteltaub', 2004, '02:10:00', 'Przygodowy', 'Ben Gates poszukuje skarbu, który miał zostać ukryty podczas wojny secesyjnej.'),
(23, 'Avengers: Wojna bez granic', 'Anthony Russo, Joe Russo', 2018, '02:29:00', 'Akcja', 'Thanos chce zdobyć wszystkie Kamienie Nieskończoności, by zrealizować swoje chore marzenie.'),
(24, 'Król Lew', 'Roger Allers, Rob Minkoff', 1994, '01:28:00', 'Animacja', 'Afrykański król zwierząt musi zmierzyć się z rywalizacją w swojej królewskiej rodzinie.'),
(25, 'Piraci z Karaibów: Klątwa Czarnej Perły', 'Gore Verbinski', 2003, '02:23:00', 'Przygodowy', 'Kapitan Jack Sparrow poszukuje mitycznego statku, na którego pokładzie ukryto skarb.'),
(26, 'Zielona Mila', 'Frank Darabont', 1999, '03:08:00', 'Dramat', 'Więzień skazany na śmierć zostaje strażnikiem więzienia, gdzie dochodzi do niezwykłych wydarzeń.'),
(27, 'Harry Potter i Kamień Filozoficzny', 'Chris Columbus', 2001, '02:32:00', 'Fantasy', 'Młody chłopak odkrywa, że jest czarodziejem i wkracza do magicznego świata.'),
(28, 'Gwiezdne wojny: Ostatni Jedi', 'Rian Johnson', 2017, '02:32:00', 'Science fiction', 'Rey poszukuje Luke\'a Skywalkera, by pomógł w walce z Pierwszym Porządkiem.'),
(29, 'Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, '02:16:00', 'Science fiction', 'Programista odkrywa, że świat, w którym żyje, jest tylko iluzją i dołącza do walki przeciwko systemowi.'),
(30, 'Mad Max: Na drodze gniewu', 'George Miller', 2015, '02:00:00', 'Akcja', 'Max zostaje porwany przez kult zwiadowców i musi walczyć o swoje przetrwanie.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `data_urodzenia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`, `data_urodzenia`) VALUES
(1, 'Karolina', 'Kowalczyk', 'kowalczyk.karolina@gmail.com', '2000-01-15'),
(2, 'Michał', 'Adamczyk', 'adamczyk.michal@gmail.com', '1998-06-02'),
(3, 'Marta', 'Wiśniewska', 'wisniewska.marta@gmail.com', '1995-12-21'),
(4, 'Tomasz', 'Kaczmarek', 'kaczmarek.tomasz@gmail.com', '1989-09-11'),
(5, 'Kamil', 'Nowicki', 'nowicki.kamil@gmail.com', '1993-04-05'),
(6, 'Agnieszka', 'Kubiak', 'kubiak.agnieszka@gmail.com', '2002-11-28'),
(7, 'Krzysztof', 'Szymański', 'szymanski.krzysztof@gmail.com', '1991-03-14'),
(8, 'Dominika', 'Kowal', 'kowal.dominika@gmail.com', '1997-08-30'),
(9, 'Jan', 'Jasiński', 'jasinski.jan@gmail.com', '1985-02-10'),
(10, 'Katarzyna', 'Woźniak', 'wozniak.katarzyna@gmail.com', '2001-07-18');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownika` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `stanowisko` varchar(255) NOT NULL,
  `data_zatrudnienia` date NOT NULL,
  `pensja` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `stanowisko`, `data_zatrudnienia`, `pensja`) VALUES
(1, 'Adam', 'Nowak', 'Kasjer', '2021-03-01', '2000.00'),
(2, 'Anna', 'Kowalska', 'Sprzątaczka', '2021-05-01', '1800.00'),
(3, 'Braian', 'Kropidłowski', 'Menedżer', '2021-01-01', '8000.00'),
(4, 'Katarzyna', 'Lewandowska', 'Kierownik', '2021-02-15', '4500.00'),
(5, 'Jan', 'Dąbrowski', 'Ochroniarz', '2021-04-01', '2500.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `numer` int(11) NOT NULL,
  `liczba_miejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `sale`
--

INSERT INTO `sale` (`id`, `numer`, `liczba_miejsc`) VALUES
(1, 1, 150),
(2, 2, 100),
(3, 3, 200);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seanse`
--

CREATE TABLE `seanse` (
  `id` int(11) NOT NULL,
  `id_sali` int(11) NOT NULL,
  `id_filmu` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `cena` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `seanse`
--

INSERT INTO `seanse` (`id`, `id_sali`, `id_filmu`, `data`, `cena`) VALUES
(1, 1, 1, '2023-05-15 17:30:00', '15.00'),
(2, 1, 2, '2023-05-15 20:00:00', '18.00'),
(3, 1, 3, '2023-05-16 15:00:00', '20.00'),
(4, 2, 4, '2023-05-16 17:30:00', '12.00'),
(5, 2, 5, '2023-05-16 20:00:00', '16.00'),
(6, 2, 6, '2023-05-17 15:00:00', '18.00'),
(7, 3, 7, '2023-05-17 17:30:00', '20.00'),
(8, 3, 8, '2023-05-17 20:00:00', '18.00'),
(9, 3, 9, '2023-05-18 15:00:00', '15.00'),
(10, 3, 10, '2023-05-18 17:30:00', '18.00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `filmy`
--
ALTER TABLE `filmy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_filmy_seanse` (`id_filmu`),
  ADD KEY `FK_sale_seanse` (`id_sali`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `filmy`
--
ALTER TABLE `filmy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `seanse`
--
ALTER TABLE `seanse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `FK_filmy_seanse` FOREIGN KEY (`id_filmu`) REFERENCES `filmy` (`id`),
  ADD CONSTRAINT `FK_sale_seanse` FOREIGN KEY (`id_sali`) REFERENCES `sale` (`id`),
  ADD CONSTRAINT `seanse_ibfk_1` FOREIGN KEY (`id_sali`) REFERENCES `sale` (`id`),
  ADD CONSTRAINT `seanse_ibfk_2` FOREIGN KEY (`id_filmu`) REFERENCES `filmy` (`id`);
--
-- Baza danych: `kinohelios`
--
CREATE DATABASE IF NOT EXISTS `kinohelios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kinohelios`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `id` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `rezyser` varchar(255) NOT NULL,
  `gatunek` varchar(255) NOT NULL,
  `rok_produkcji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `filmy`
--

INSERT INTO `filmy` (`id`, `tytul`, `rezyser`, `gatunek`, `rok_produkcji`) VALUES
(1, 'Avengers: Wojna bez granic', 'Anthony Russo, Joe Russo', 'Akcja', 2018),
(2, 'Król lew', 'Jon Favreau', 'Animacja', 2019),
(3, 'Joker', 'Todd Phillips', 'Dramat', 2019),
(4, 'Bohemian Rhapsody', 'Bryan Singer', 'Biograficzny', 2018),
(5, 'Gwiezdne wojny: Ostatni Jedi', 'Rian Johnson', 'Sci-Fi', 2017),
(6, 'Titanic', 'James Cameron', 'Dramat', 1997),
(7, 'Harry Potter i Kamień Filozoficzny', 'Chris Columbus', 'Fantasy', 2001),
(8, 'The Shawshank Redemption', 'Frank Darabont', 'Dramat', 1994),
(9, 'Pulp Fiction', 'Quentin Tarantino', 'Kryminał', 1994),
(10, 'Forrest Gump', 'Robert Zemeckis', 'Dramat', 1994);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`) VALUES
(1, 'Adam', 'Nowak', 'adam.nowak@example.com'),
(2, 'Ewa', 'Kowalska', 'ewa.kowalska@example.com'),
(3, 'Michał', 'Wiśniewski', 'michal.wisniewski@example.com'),
(4, 'Katarzyna', 'Wójcik', 'katarzyna.wojcik@example.com'),
(5, 'Piotr', 'Kwiatkowski', 'piotr.kwiatkowski@example.com'),
(6, 'Magdalena', 'Kaczmarek', 'magdalena.kaczmarek@example.com'),
(7, 'Tomasz', 'Zieliński', 'tomasz.zielinski@example.com'),
(8, 'Karolina', 'Szymańska', 'karolina.szymanska@example.com'),
(9, 'Marcin', 'Dąbrowski', 'marcin.dabrowski@example.com'),
(10, 'Anna', 'Kamińska', 'anna.kaminska@example.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Braian', 'Kropidłowski'),
(2, 'Anna', 'Nowak'),
(3, 'Michał', 'Wiśniewski'),
(4, 'Katarzyna', 'Wójcik'),
(5, 'Piotr', 'Kwiatkowski'),
(6, 'Magdalena', 'Kaczmarek'),
(7, 'Tomasz', 'Zieliński'),
(8, 'Karolina', 'Szymańska'),
(9, 'Marcin', 'Dąbrowski'),
(10, 'Ewa', 'Kamińska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `liczba_miejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `sale`
--

INSERT INTO `sale` (`id`, `nazwa`, `liczba_miejsc`) VALUES
(1, 'Sala 1', 100),
(2, 'Sala 2', 150),
(3, 'Sala 3', 120),
(4, 'Sala 4', 200),
(5, 'Sala 5', 180),
(6, 'Sala 6', 160),
(7, 'Sala 7', 140),
(8, 'Sala 8', 110),
(9, 'Sala 9', 130),
(10, 'Sala 10', 170);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seanse`
--

CREATE TABLE `seanse` (
  `id` int(11) NOT NULL,
  `id_filmu` int(11) NOT NULL,
  `id_sali` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `seanse`
--

INSERT INTO `seanse` (`id`, `id_filmu`, `id_sali`, `data`) VALUES
(1, 1, 1, '2023-05-15 18:00:00'),
(2, 2, 2, '2023-05-15 20:30:00'),
(3, 3, 3, '2023-05-16 15:00:00'),
(4, 4, 4, '2023-05-16 18:30:00'),
(5, 5, 5, '2023-05-17 19:00:00'),
(6, 6, 6, '2023-05-18 17:30:00'),
(7, 7, 7, '2023-05-19 21:00:00'),
(8, 8, 8, '2023-05-20 14:30:00'),
(9, 9, 9, '2023-05-21 16:00:00'),
(10, 10, 10, '2023-05-22 19:30:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `filmy`
--
ALTER TABLE `filmy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_filmu` (`id_filmu`),
  ADD KEY `id_sali` (`id_sali`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `filmy`
--
ALTER TABLE `filmy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `seanse`
--
ALTER TABLE `seanse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `seanse_ibfk_1` FOREIGN KEY (`id_filmu`) REFERENCES `filmy` (`id`),
  ADD CONSTRAINT `seanse_ibfk_2` FOREIGN KEY (`id_sali`) REFERENCES `sale` (`id`);
--
-- Baza danych: `lotnisko`
--
CREATE DATABASE IF NOT EXISTS `lotnisko` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `lotnisko`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bagaż`
--

CREATE TABLE `bagaż` (
  `ID_bagażu` int(11) NOT NULL,
  `ID_pasażera` int(11) DEFAULT NULL,
  `Waga_kg` int(11) DEFAULT NULL,
  `Opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilety`
--

CREATE TABLE `bilety` (
  `ID_biletu` int(11) NOT NULL,
  `ID_pasażera` int(11) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL,
  `Klasa` varchar(50) DEFAULT NULL,
  `Data_wylotu` datetime DEFAULT NULL,
  `Data_przylotu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `linie_lotnicze`
--

CREATE TABLE `linie_lotnicze` (
  `ID_linii` int(11) NOT NULL,
  `Nazwa` varchar(255) DEFAULT NULL,
  `Kraj_pochodzenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pasażerowie`
--

CREATE TABLE `pasażerowie` (
  `ID_pasażera` int(11) NOT NULL,
  `Imię` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Data_urodzenia` date DEFAULT NULL,
  `Kraj_pochodzenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `pasażerowie`
--

INSERT INTO `pasażerowie` (`ID_pasażera`, `Imię`, `Nazwisko`, `Data_urodzenia`, `Kraj_pochodzenia`) VALUES
(1, 'Braian', 'Kropidłowski', '2005-06-02', 'Polska'),
(2, 'Anna', 'Nowak', '1985-12-08', 'Niemcy'),
(3, 'Marek', 'Wiśniewski', '1978-07-21', 'Francja'),
(4, 'Ewa', 'Dąbrowska', '1995-02-03', 'Włochy'),
(5, 'Adam', 'Lewandowski', '1980-09-17', 'Hiszpania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `Imię` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Stanowisko` varchar(255) DEFAULT NULL,
  `Wynagrodzenie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przyloty_odloty`
--

CREATE TABLE `przyloty_odloty` (
  `ID_lotu` int(11) NOT NULL,
  `ID_samolotu` int(11) DEFAULT NULL,
  `ID_linii` int(11) DEFAULT NULL,
  `Data_lotu` datetime DEFAULT NULL,
  `Lotnisko_wylotu` varchar(255) DEFAULT NULL,
  `Lotnisko_przylotu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samoloty`
--

CREATE TABLE `samoloty` (
  `ID_samolotu` int(11) NOT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Producent` varchar(255) DEFAULT NULL,
  `Liczba_miejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bagaż`
--
ALTER TABLE `bagaż`
  ADD PRIMARY KEY (`ID_bagażu`),
  ADD KEY `ID_pasażera` (`ID_pasażera`);

--
-- Indeksy dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD PRIMARY KEY (`ID_biletu`),
  ADD KEY `ID_pasażera` (`ID_pasażera`);

--
-- Indeksy dla tabeli `linie_lotnicze`
--
ALTER TABLE `linie_lotnicze`
  ADD PRIMARY KEY (`ID_linii`);

--
-- Indeksy dla tabeli `pasażerowie`
--
ALTER TABLE `pasażerowie`
  ADD PRIMARY KEY (`ID_pasażera`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`);

--
-- Indeksy dla tabeli `przyloty_odloty`
--
ALTER TABLE `przyloty_odloty`
  ADD PRIMARY KEY (`ID_lotu`),
  ADD KEY `ID_samolotu` (`ID_samolotu`),
  ADD KEY `ID_linii` (`ID_linii`);

--
-- Indeksy dla tabeli `samoloty`
--
ALTER TABLE `samoloty`
  ADD PRIMARY KEY (`ID_samolotu`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bagaż`
--
ALTER TABLE `bagaż`
  ADD CONSTRAINT `bagaż_ibfk_1` FOREIGN KEY (`ID_pasażera`) REFERENCES `pasażerowie` (`ID_pasażera`);

--
-- Ograniczenia dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD CONSTRAINT `bilety_ibfk_1` FOREIGN KEY (`ID_pasażera`) REFERENCES `pasażerowie` (`ID_pasażera`);

--
-- Ograniczenia dla tabeli `przyloty_odloty`
--
ALTER TABLE `przyloty_odloty`
  ADD CONSTRAINT `przyloty_odloty_ibfk_1` FOREIGN KEY (`ID_samolotu`) REFERENCES `samoloty` (`ID_samolotu`),
  ADD CONSTRAINT `przyloty_odloty_ibfk_2` FOREIGN KEY (`ID_linii`) REFERENCES `linie_lotnicze` (`ID_linii`);
--
-- Baza danych: `lotnisko1`
--
CREATE DATABASE IF NOT EXISTS `lotnisko1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lotnisko1`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bagaż`
--

CREATE TABLE `bagaż` (
  `ID_bagażu` int(11) NOT NULL,
  `ID_pasażera` int(11) DEFAULT NULL,
  `Waga_kg` int(11) DEFAULT NULL,
  `Opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `bagaż`
--

INSERT INTO `bagaż` (`ID_bagażu`, `ID_pasażera`, `Waga_kg`, `Opis`) VALUES
(1, 1, 20, 'Bagaż podręczny'),
(2, 2, 25, 'Walizka duża'),
(3, 3, 15, 'Plecak'),
(4, 4, 30, 'Walizka średnia'),
(5, 5, 18, 'Bagaż podręczny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilety`
--

CREATE TABLE `bilety` (
  `ID_biletu` int(11) NOT NULL,
  `ID_pasażera` int(11) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL,
  `Klasa` varchar(50) DEFAULT NULL,
  `Data_wylotu` datetime DEFAULT NULL,
  `Data_przylotu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `bilety`
--

INSERT INTO `bilety` (`ID_biletu`, `ID_pasażera`, `Cena`, `Klasa`, `Data_wylotu`, `Data_przylotu`) VALUES
(1, 1, 500, 'Business', '2023-12-01 12:00:00', '2023-12-01 15:00:00'),
(2, 2, 300, 'Economy', '2023-11-28 08:30:00', '2023-11-28 11:45:00'),
(3, 3, 700, 'Business', '2023-12-05 18:15:00', '2023-12-05 21:30:00'),
(4, 4, 400, 'Economy', '2023-11-30 14:45:00', '2023-11-30 18:00:00'),
(5, 5, 600, 'Business', '2023-11-29 10:00:00', '2023-11-29 13:15:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `linie_lotnicze`
--

CREATE TABLE `linie_lotnicze` (
  `ID_linii` int(11) NOT NULL,
  `Nazwa` varchar(255) DEFAULT NULL,
  `Kraj_pochodzenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `linie_lotnicze`
--

INSERT INTO `linie_lotnicze` (`ID_linii`, `Nazwa`, `Kraj_pochodzenia`) VALUES
(1, 'LOT Polish Airlines', 'Polska'),
(2, 'Lufthansa', 'Niemcy'),
(3, 'Air France', 'Francja'),
(4, 'Alitalia', 'Włochy'),
(5, 'Iberia', 'Hiszpania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pasażerowie`
--

CREATE TABLE `pasażerowie` (
  `ID_pasażera` int(11) NOT NULL,
  `Imię` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Data_urodzenia` date DEFAULT NULL,
  `Kraj_pochodzenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pasażerowie`
--

INSERT INTO `pasażerowie` (`ID_pasażera`, `Imię`, `Nazwisko`, `Data_urodzenia`, `Kraj_pochodzenia`) VALUES
(1, 'Braian', 'Kropidłowski', '2005-06-02', 'Polska'),
(2, 'Anna', 'Nowak', '1985-12-08', 'Niemcy'),
(3, 'Marek', 'Wiśniewski', '1978-07-21', 'Francja'),
(4, 'Ewa', 'Dąbrowska', '1995-02-03', 'Włochy'),
(5, 'Adam', 'Lewandowski', '1980-09-17', 'Hiszpania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `Imię` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Stanowisko` varchar(255) DEFAULT NULL,
  `Wynagrodzenie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_pracownika`, `Imię`, `Nazwisko`, `Stanowisko`, `Wynagrodzenie`) VALUES
(1, 'Michał', 'Nowak', 'Obsługa naziemna', 6000),
(2, 'Katarzyna', 'Kowalczyk', 'Pilot', 12000),
(3, 'Angelika', 'Kowalewska', 'Stewardessa', 5500),
(4, 'Agnieszka', 'Wojciechowska', 'Technik', 7000),
(5, 'Grzegorz', 'Zając', 'Kontroler ruchu', 8000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przyloty_odloty`
--

CREATE TABLE `przyloty_odloty` (
  `ID_lotu` int(11) NOT NULL,
  `ID_samolotu` int(11) DEFAULT NULL,
  `ID_linii` int(11) DEFAULT NULL,
  `Data_lotu` datetime DEFAULT NULL,
  `Lotnisko_wylotu` varchar(255) DEFAULT NULL,
  `Lotnisko_przylotu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `przyloty_odloty`
--

INSERT INTO `przyloty_odloty` (`ID_lotu`, `ID_samolotu`, `ID_linii`, `Data_lotu`, `Lotnisko_wylotu`, `Lotnisko_przylotu`) VALUES
(1, 1, 1, '2023-12-01 12:00:00', 'Warszawa', 'Berlin'),
(2, 2, 2, '2023-11-28 08:30:00', 'Frankfurt', 'Paryż'),
(3, 3, 3, '2023-12-05 18:15:00', 'Paryż', 'Rzym'),
(4, 4, 4, '2023-11-30 14:45:00', 'Mediolan', 'Barcelona'),
(5, 5, 5, '2023-11-29 10:00:00', 'Madryt', 'Amsterdam');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samoloty`
--

CREATE TABLE `samoloty` (
  `ID_samolotu` int(11) NOT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Producent` varchar(255) DEFAULT NULL,
  `Liczba_miejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `samoloty`
--

INSERT INTO `samoloty` (`ID_samolotu`, `Model`, `Producent`, `Liczba_miejsc`) VALUES
(1, 'Boeing 737', 'Boeing', 180),
(2, 'Airbus A320', 'Airbus', 150),
(3, 'Boeing 777', 'Boeing', 300),
(4, 'Embraer E190', 'Embraer', 100),
(5, 'Bombardier Q400', 'Bombardier', 80);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bagaż`
--
ALTER TABLE `bagaż`
  ADD PRIMARY KEY (`ID_bagażu`),
  ADD KEY `ID_pasażera` (`ID_pasażera`);

--
-- Indeksy dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD PRIMARY KEY (`ID_biletu`),
  ADD KEY `ID_pasażera` (`ID_pasażera`);

--
-- Indeksy dla tabeli `linie_lotnicze`
--
ALTER TABLE `linie_lotnicze`
  ADD PRIMARY KEY (`ID_linii`);

--
-- Indeksy dla tabeli `pasażerowie`
--
ALTER TABLE `pasażerowie`
  ADD PRIMARY KEY (`ID_pasażera`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`);

--
-- Indeksy dla tabeli `przyloty_odloty`
--
ALTER TABLE `przyloty_odloty`
  ADD PRIMARY KEY (`ID_lotu`),
  ADD KEY `ID_samolotu` (`ID_samolotu`),
  ADD KEY `ID_linii` (`ID_linii`);

--
-- Indeksy dla tabeli `samoloty`
--
ALTER TABLE `samoloty`
  ADD PRIMARY KEY (`ID_samolotu`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bagaż`
--
ALTER TABLE `bagaż`
  ADD CONSTRAINT `bagaż_ibfk_1` FOREIGN KEY (`ID_pasażera`) REFERENCES `pasażerowie` (`ID_pasażera`);

--
-- Ograniczenia dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD CONSTRAINT `bilety_ibfk_1` FOREIGN KEY (`ID_pasażera`) REFERENCES `pasażerowie` (`ID_pasażera`);

--
-- Ograniczenia dla tabeli `przyloty_odloty`
--
ALTER TABLE `przyloty_odloty`
  ADD CONSTRAINT `przyloty_odloty_ibfk_1` FOREIGN KEY (`ID_samolotu`) REFERENCES `samoloty` (`ID_samolotu`),
  ADD CONSTRAINT `przyloty_odloty_ibfk_2` FOREIGN KEY (`ID_linii`) REFERENCES `linie_lotnicze` (`ID_linii`);
--
-- Baza danych: `lotnisko2`
--
CREATE DATABASE IF NOT EXISTS `lotnisko2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lotnisko2`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bagaż`
--

CREATE TABLE `bagaż` (
  `ID_bagażu` int(11) NOT NULL,
  `ID_pasażera` int(11) DEFAULT NULL,
  `Waga_kg` int(11) DEFAULT NULL,
  `Opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `bagaż`
--

INSERT INTO `bagaż` (`ID_bagażu`, `ID_pasażera`, `Waga_kg`, `Opis`) VALUES
(1, 1, 20, 'Bagaż podręczny'),
(2, 2, 25, 'Walizka duża'),
(3, 3, 15, 'Plecak'),
(4, 4, 30, 'Walizka średnia'),
(5, 5, 18, 'Bagaż podręczny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilety`
--

CREATE TABLE `bilety` (
  `ID_biletu` int(11) NOT NULL,
  `ID_pasażera` int(11) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL,
  `Klasa` varchar(50) DEFAULT NULL,
  `Data_wylotu` datetime DEFAULT NULL,
  `Data_przylotu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `bilety`
--

INSERT INTO `bilety` (`ID_biletu`, `ID_pasażera`, `Cena`, `Klasa`, `Data_wylotu`, `Data_przylotu`) VALUES
(1, 1, 500, 'Business', '2023-12-01 12:00:00', '2023-12-01 15:00:00'),
(2, 2, 300, 'Economy', '2023-11-28 08:30:00', '2023-11-28 11:45:00'),
(3, 3, 700, 'Business', '2023-12-05 18:15:00', '2023-12-05 21:30:00'),
(4, 4, 400, 'Economy', '2023-11-30 14:45:00', '2023-11-30 18:00:00'),
(5, 5, 600, 'Business', '2023-11-29 10:00:00', '2023-11-29 13:15:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `linie_lotnicze`
--

CREATE TABLE `linie_lotnicze` (
  `ID_linii` int(11) NOT NULL,
  `Nazwa` varchar(255) DEFAULT NULL,
  `Kraj_pochodzenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `linie_lotnicze`
--

INSERT INTO `linie_lotnicze` (`ID_linii`, `Nazwa`, `Kraj_pochodzenia`) VALUES
(1, 'LOT Polish Airlines', 'Polska'),
(2, 'Lufthansa', 'Niemcy'),
(3, 'Air France', 'Francja'),
(4, 'Alitalia', 'Włochy'),
(5, 'Iberia', 'Hiszpania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pasażerowie`
--

CREATE TABLE `pasażerowie` (
  `ID_pasażera` int(11) NOT NULL,
  `Imię` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Data_urodzenia` date DEFAULT NULL,
  `Kraj_pochodzenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pasażerowie`
--

INSERT INTO `pasażerowie` (`ID_pasażera`, `Imię`, `Nazwisko`, `Data_urodzenia`, `Kraj_pochodzenia`) VALUES
(1, 'Oskar', 'Kloskowski', '2005-09-30', 'Polska'),
(2, 'Anna', 'Nowak', '1985-12-08', 'Niemcy'),
(3, 'Marek', 'Wiśniewski', '1978-07-21', 'Francja'),
(4, 'Ewa', 'Dąbrowska', '1995-02-03', 'Włochy'),
(5, 'Adam', 'Lewandowski', '1980-09-17', 'Hiszpania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `Imię` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Stanowisko` varchar(255) DEFAULT NULL,
  `Wynagrodzenie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_pracownika`, `Imię`, `Nazwisko`, `Stanowisko`, `Wynagrodzenie`) VALUES
(1, 'Michał', 'Nowak', 'Obsługa naziemna', 6000),
(2, 'Katarzyna', 'Kowalczyk', 'Pilot', 12000),
(3, 'Anastazja', 'Kownacka', 'Stewardessa', 5500),
(4, 'Agnieszka', 'Wojciechowska', 'Technik', 7000),
(5, 'Grzegorz', 'Zając', 'Kontroler ruchu', 8000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przyloty_odloty`
--

CREATE TABLE `przyloty_odloty` (
  `ID_lotu` int(11) NOT NULL,
  `ID_samolotu` int(11) DEFAULT NULL,
  `ID_linii` int(11) DEFAULT NULL,
  `Data_lotu` datetime DEFAULT NULL,
  `Lotnisko_wylotu` varchar(255) DEFAULT NULL,
  `Lotnisko_przylotu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `przyloty_odloty`
--

INSERT INTO `przyloty_odloty` (`ID_lotu`, `ID_samolotu`, `ID_linii`, `Data_lotu`, `Lotnisko_wylotu`, `Lotnisko_przylotu`) VALUES
(1, 1, 1, '2023-12-01 12:00:00', 'Warszawa', 'Berlin'),
(2, 2, 2, '2023-11-28 08:30:00', 'Frankfurt', 'Paryż'),
(3, 3, 3, '2023-12-05 18:15:00', 'Paryż', 'Rzym'),
(4, 4, 4, '2023-11-30 14:45:00', 'Mediolan', 'Barcelona'),
(5, 5, 5, '2023-11-29 10:00:00', 'Madryt', 'Amsterdam');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samoloty`
--

CREATE TABLE `samoloty` (
  `ID_samolotu` int(11) NOT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Producent` varchar(255) DEFAULT NULL,
  `Liczba_miejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `samoloty`
--

INSERT INTO `samoloty` (`ID_samolotu`, `Model`, `Producent`, `Liczba_miejsc`) VALUES
(1, 'Boeing 737', 'Boeing', 180),
(2, 'Airbus A320', 'Airbus', 150),
(3, 'Boeing 777', 'Boeing', 300),
(4, 'Embraer E190', 'Embraer', 100),
(5, 'Bombardier Q400', 'Bombardier', 80);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bagaż`
--
ALTER TABLE `bagaż`
  ADD PRIMARY KEY (`ID_bagażu`),
  ADD KEY `ID_pasażera` (`ID_pasażera`);

--
-- Indeksy dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD PRIMARY KEY (`ID_biletu`),
  ADD KEY `ID_pasażera` (`ID_pasażera`);

--
-- Indeksy dla tabeli `linie_lotnicze`
--
ALTER TABLE `linie_lotnicze`
  ADD PRIMARY KEY (`ID_linii`);

--
-- Indeksy dla tabeli `pasażerowie`
--
ALTER TABLE `pasażerowie`
  ADD PRIMARY KEY (`ID_pasażera`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`);

--
-- Indeksy dla tabeli `przyloty_odloty`
--
ALTER TABLE `przyloty_odloty`
  ADD PRIMARY KEY (`ID_lotu`),
  ADD KEY `ID_samolotu` (`ID_samolotu`),
  ADD KEY `ID_linii` (`ID_linii`);

--
-- Indeksy dla tabeli `samoloty`
--
ALTER TABLE `samoloty`
  ADD PRIMARY KEY (`ID_samolotu`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bagaż`
--
ALTER TABLE `bagaż`
  ADD CONSTRAINT `bagaż_ibfk_1` FOREIGN KEY (`ID_pasażera`) REFERENCES `pasażerowie` (`ID_pasażera`);

--
-- Ograniczenia dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD CONSTRAINT `bilety_ibfk_1` FOREIGN KEY (`ID_pasażera`) REFERENCES `pasażerowie` (`ID_pasażera`);

--
-- Ograniczenia dla tabeli `przyloty_odloty`
--
ALTER TABLE `przyloty_odloty`
  ADD CONSTRAINT `przyloty_odloty_ibfk_1` FOREIGN KEY (`ID_samolotu`) REFERENCES `samoloty` (`ID_samolotu`),
  ADD CONSTRAINT `przyloty_odloty_ibfk_2` FOREIGN KEY (`ID_linii`) REFERENCES `linie_lotnicze` (`ID_linii`);
--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Zrzut danych tabeli `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Zrzut danych tabeli `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'Braian zadanie', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"aktorzy\",\"box_office\",\"filmy\",\"gatunek\",\"rezyserzy\",\"seriale\"],\"table_structure[]\":[\"aktorzy\",\"box_office\",\"filmy\",\"gatunek\",\"rezyserzy\",\"seriale\"],\"table_data[]\":[\"aktorzy\",\"box_office\",\"filmy\",\"gatunek\",\"rezyserzy\",\"seriale\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Zawartość tabeli @TABLE@\",\"latex_data_continued_caption\":\"Zawartość tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'table', 'Piotr tocki', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Zawartość tabeli @TABLE@\",\"latex_data_continued_caption\":\"Zawartość tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'table', 'facebook', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Zawartość tabeli @TABLE@\",\"latex_data_continued_caption\":\"Zawartość tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(4, 'root', 'server', 'facebook', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"facebook\",\"fb\",\"kino\",\"kinohelios\",\"lotnisko\",\"lotnisko1\",\"lotnisko2\",\"phpmyadmin\",\"piotrek\",\"piotr tocki\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Zawartość tabeli @TABLE@\",\"latex_data_continued_caption\":\"Zawartość tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"facebook\",\"table\":\"photo\"},{\"db\":\"facebook\",\"table\":\"profile\"},{\"db\":\"facebook\",\"table\":\"user\"},{\"db\":\"facebook\",\"table\":\"profiletype\"},{\"db\":\"facebook\",\"table\":\"friend\"},{\"db\":\"facebook\",\"table\":\"owner\"},{\"db\":\"lotnisko1\",\"table\":\"samoloty\"},{\"db\":\"lotnisko1\",\"table\":\"przyloty_odloty\"},{\"db\":\"lotnisko1\",\"table\":\"pracownicy\"},{\"db\":\"lotnisko1\",\"table\":\"pasa\\u017cerowie\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('facebook', 'photo', 'url'),
('facebook', 'profile', 'FirstName');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'kinohelios', 'pracownicy', '{\"CREATE_TIME\":\"2023-05-14 23:47:06\",\"col_order\":[0,2,1],\"col_visib\":[1,1,1]}', '2023-05-14 22:07:58'),
('root', 'piotr tocki', 'filmy', '{\"sorted_col\":\"dlugosc_filmu ASC\"}', '2023-03-12 21:31:08'),
('root', 'piotr tocki', 'seriale', '{\"sorted_col\":\"`seriale`.`ilosc_sezonow` DESC\"}', '2023-03-12 21:31:09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-05-21 20:19:27', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pl\",\"NavigationWidth\":260}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Zrzut danych tabeli `pma__users`
--

INSERT INTO `pma__users` (`username`, `usergroup`) VALUES
('piotr_tocki', '');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `piotrek`
--
CREATE DATABASE IF NOT EXISTS `piotrek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `piotrek`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `aktorzy`
--

CREATE TABLE `aktorzy` (
  `id` int(11) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `kraj` varchar(50) DEFAULT NULL,
  `rok_debiutu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `aktorzy`
--

INSERT INTO `aktorzy` (`id`, `imie`, `nazwisko`, `kraj`, `rok_debiutu`) VALUES
(25, 'Piotr', 'Tocki', 'Poland', '2020');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `box_office`
--

CREATE TABLE `box_office` (
  `id` int(11) DEFAULT NULL,
  `w_usa` int(11) DEFAULT NULL,
  `poza_usa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `box_office`
--

INSERT INTO `box_office` (`id`, `w_usa`, `poza_usa`) VALUES
(1, 428055, 501769),
(2, 746436, 291277),
(3, 839620, 411491),
(4, 685687, 993773),
(5, 910489, 849574),
(6, 180582, 612551),
(7, 842404, 624911),
(8, 456865, 820237),
(9, 400527, 246270),
(10, 290965, 580497),
(11, 674065, 808923),
(12, 363127, 817079),
(13, 224325, 684596),
(14, 736673, 395442),
(15, 489095, 404438),
(16, 627640, 963463),
(17, 282815, 701853),
(18, 808966, 878785),
(19, 634442, 716880),
(20, 740466, 782266),
(21, 125375, 518377),
(22, 658543, 424108),
(23, 532386, 128191),
(24, 375580, 124348),
(25, 536389, 141086),
(26, 786772, 234404),
(27, 108424, 764632),
(28, 167431, 501942),
(29, 724961, 572127),
(30, 442209, 473947),
(31, 963886, 752532),
(32, 723426, 932679),
(33, 138424, 479140),
(34, 424082, 424206),
(35, 227578, 178501),
(36, 687374, 175934),
(37, 349685, 588392),
(38, 706535, 218036),
(39, 723842, 405886),
(40, 360574, 917016),
(41, 984853, 328319),
(42, 414867, 378507),
(43, 942511, 654668),
(44, 651219, 333971),
(45, 731077, 559729),
(46, 900545, 121959),
(47, 590486, 506622),
(48, 958297, 927282),
(49, 760306, 582511),
(50, 527515, 139071),
(51, 739420, 795264),
(52, 585559, 588271),
(53, 361052, 948476),
(54, 876056, 437225),
(55, 200854, 877344),
(56, 954957, 600493),
(57, 905027, 713229),
(58, 835788, 720630),
(59, 351467, 868235),
(60, 223406, 827298),
(61, 664749, 786251),
(62, 200291, 187976),
(63, 642392, 820714),
(64, 780221, 769621),
(65, 656594, 773726),
(66, 357336, 276493),
(67, 853179, 132032),
(68, 825512, 462650),
(69, 767840, 236937),
(70, 747793, 247134),
(71, 337358, 995117),
(72, 313068, 129750),
(73, 579003, 821538),
(74, 930755, 130579),
(75, 270655, 245732),
(76, 592353, 976969),
(77, 672103, 562490),
(78, 984503, 294564),
(79, 441685, 482599),
(80, 529529, 343440),
(81, 992119, 314207),
(82, 898910, 453417),
(83, 803963, 248302),
(84, 199974, 935679),
(85, 276724, 724323);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `id` int(11) DEFAULT NULL,
  `tytul` varchar(50) DEFAULT NULL,
  `gatunek` varchar(50) DEFAULT NULL,
  `typ` varchar(50) DEFAULT NULL,
  `dlugosc_filmu` int(11) DEFAULT NULL,
  `rezyser` varchar(50) DEFAULT NULL,
  `aktor` varchar(50) DEFAULT NULL,
  `kraj_produkcji` varchar(50) DEFAULT NULL,
  `premiera` varchar(50) DEFAULT NULL,
  `box_office` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `filmy`
--

INSERT INTO `filmy` (`id`, `tytul`, `gatunek`, `typ`, `dlugosc_filmu`, `rezyser`, `aktor`, `kraj_produkcji`, `premiera`, `box_office`) VALUES
(14, 'One Little Indian', 'Comedy|Western', 'Drama|Thriller', 235, 'Mella Wolfenden', 'Oberon MacAne', 'Serbia', '2012', 6833288),
(17, 'Only the Strong Survive - A Celebration of Soul', 'Documentary|Musical', 'Horror', 144, 'Viole Andraud', 'Candra Krysztofowicz', 'Indonesia', '2012', 7579298),
(18, 'Space Battleship Yamato', 'Action|Adventure|Drama', 'Drama|Musical|Romance', 344, 'Edee Lay', 'Gretna Jennions', 'Morocco', '2012', 1016714),
(51, 'Achilles and the Tortoise (Akiresu to kame)', 'Comedy', 'Drama|Thriller', 301, 'Berri Deeks', 'Dotty Pittaway', 'Venezuela', '2012', 5669115),
(65, 'World Without Thieves, A (Tian xia wu zei)', 'Action|Crime|Drama', 'Fantasy|Romance', 67, 'Umberto Hunt', 'Westleigh Badsey', 'Lebanon', '2012', 4390345),
(70, 'Godzilla\'s Revenge (Gojira-Minira-Gabara: Oru Kaij', 'Children', 'Children|Comedy|Fantasy', 355, 'Aindrea Domelow', 'Harman Arnold', 'Brazil', '2012', 6218293),
(1, 'Hobbit', 'Fantasy', 'Fantasy', 169, 'Peter Jackson', 'Martin Freeman', 'Ameryka', '2012', 817468);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunek`
--

CREATE TABLE `gatunek` (
  `id` int(11) DEFAULT NULL,
  `gatunek` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `gatunek`
--

INSERT INTO `gatunek` (`id`, `gatunek`) VALUES
(1, 'Comedy|Drama'),
(2, 'Children'),
(3, 'Drama|Mystery|Sci-Fi|Thriller'),
(4, 'Comedy|Drama'),
(5, 'Drama'),
(6, 'Drama'),
(7, 'Adventure|Comedy|Fantasy|Musical'),
(8, 'Action|Comedy'),
(9, 'Drama'),
(10, 'Western');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezyserzy`
--

CREATE TABLE `rezyserzy` (
  `id` int(11) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `kraj` varchar(50) DEFAULT NULL,
  `rok_debiutu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rezyserzy`
--

INSERT INTO `rezyserzy` (`id`, `imie`, `nazwisko`, `kraj`, `rok_debiutu`) VALUES
(6, 'Rhys', 'Huitson', 'China', '2012'),
(20, 'Gonzalo', 'Mattimoe', 'Cameroon', '2013'),
(25, 'Piotr', 'Tocki', 'Poland', '2020');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seriale`
--

CREATE TABLE `seriale` (
  `id` int(11) DEFAULT NULL,
  `tytul` varchar(50) DEFAULT NULL,
  `gatunek` varchar(50) DEFAULT NULL,
  `typ` varchar(50) DEFAULT NULL,
  `ilosc_sezonow` int(11) DEFAULT NULL,
  `ilosc_odcinkow` int(11) DEFAULT NULL,
  `dlugosc_odcinkow` int(11) DEFAULT NULL,
  `rezyser` varchar(50) DEFAULT NULL,
  `aktor` varchar(50) DEFAULT NULL,
  `kraj_pochodzenia` varchar(50) DEFAULT NULL,
  `premiera` varchar(50) DEFAULT NULL,
  `box_office` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `seriale`
--

INSERT INTO `seriale` (`id`, `tytul`, `gatunek`, `typ`, `ilosc_sezonow`, `ilosc_odcinkow`, `dlugosc_odcinkow`, `rezyser`, `aktor`, `kraj_pochodzenia`, `premiera`, `box_office`) VALUES
(73, 'Iron Lady, The', 'Drama', 'Drama', 1, 13, 55, 'Moreen Pettegree', 'Dane Castilla', 'China', '2012', 986851),
(86, 'Legendy Polskie', 'Fantasy', 'Fantasy', 1, 5, 10, 'Tomasz Baginski', 'Michalina Olszanska', 'Polska', '2015', 3000000);
--
-- Baza danych: `piotr tocki`
--
CREATE DATABASE IF NOT EXISTS `piotr tocki` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `piotr tocki`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `aktorzy`
--

CREATE TABLE `aktorzy` (
  `id` int(11) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `kraj` varchar(50) DEFAULT NULL,
  `rok_debiutu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `aktorzy`
--

INSERT INTO `aktorzy` (`id`, `imie`, `nazwisko`, `kraj`, `rok_debiutu`) VALUES
(25, 'Piotr', 'Tocki', 'Polska', '2020');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `box_office`
--

CREATE TABLE `box_office` (
  `id` int(11) DEFAULT NULL,
  `w_usa` int(11) DEFAULT NULL,
  `poza_usa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `box_office`
--

INSERT INTO `box_office` (`id`, `w_usa`, `poza_usa`) VALUES
(1, 547183, 503911),
(2, 554722, 126414),
(3, 166925, 18416),
(4, 224707, 112613),
(5, 870769, 225586),
(6, 403541, 297080),
(7, 568067, 858144),
(8, 735938, 966861),
(9, 321297, 465428),
(10, 102537, 125815),
(11, 222383, 248536),
(12, 243415, 322809),
(13, 345471, 252125),
(14, 108525, 365418),
(15, 873360, 69446),
(16, 228485, 978272),
(17, 388105, 653477),
(18, 91305, 218706),
(19, 115007, 772691),
(20, 274174, 400341),
(21, 385600, 619606),
(22, 943353, 77800),
(23, 670685, 197124),
(24, 763471, 141865),
(25, 327681, 642217),
(26, 135563, 838646),
(27, 208136, 204117),
(28, 158749, 719892),
(29, 885177, 321358),
(30, 983101, 776133),
(31, 707432, 388517),
(32, 128052, 588895),
(33, 335213, 616560),
(34, 935948, 13602),
(35, 992351, 925046),
(36, 80948, 963068),
(37, 501173, 552081),
(38, 359367, 642114),
(39, 531773, 962030),
(40, 489077, 772580),
(41, 946155, 822613),
(42, 654658, 757297),
(43, 904581, 37407),
(44, 960242, 231305),
(45, 237702, 437723),
(46, 894903, 540776),
(47, 494398, 108176),
(48, 793625, 215922),
(49, 450009, 319096),
(50, 421713, 996018),
(51, 416072, 343717),
(52, 967623, 714922),
(53, 548172, 268920),
(54, 290968, 682374),
(55, 42394, 208403),
(56, 577018, 798203),
(57, 499969, 293058),
(58, 156557, 878889),
(59, 117311, 635791),
(60, 172317, 208425),
(61, 288076, 97070),
(62, 248032, 832689),
(63, 989333, 383568),
(64, 982932, 282602),
(65, 668872, 295939),
(66, 914247, 849307),
(67, 939045, 257655),
(68, 285407, 580093),
(69, 530986, 852971),
(70, 921716, 934101),
(71, 164884, 659778),
(72, 653160, 116184),
(73, 588746, 181567),
(74, 922565, 326817),
(75, 388635, 78421),
(76, 51668, 346885),
(77, 997598, 823047),
(78, 473574, 730329),
(79, 25216, 140509),
(80, 624340, 487128),
(81, 346259, 947764),
(82, 463224, 294445),
(83, 27780, 907295),
(84, 228871, 704843),
(85, 149262, 984422);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `id` int(11) DEFAULT NULL,
  `tytul` varchar(50) DEFAULT NULL,
  `gatunek` varchar(50) DEFAULT NULL,
  `typ` varchar(50) DEFAULT NULL,
  `dlugosc_filmu` int(11) DEFAULT NULL,
  `rezyser` varchar(50) DEFAULT NULL,
  `aktor` varchar(50) DEFAULT NULL,
  `kraj_produkcji` varchar(50) DEFAULT NULL,
  `premiera` varchar(50) DEFAULT NULL,
  `box_office` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `filmy`
--

INSERT INTO `filmy` (`id`, `tytul`, `gatunek`, `typ`, `dlugosc_filmu`, `rezyser`, `aktor`, `kraj_produkcji`, `premiera`, `box_office`) VALUES
(13, 'Push', 'Sci-Fi|Thriller', 'Action|Crime|Thriller', 228, 'Arabelle Twatt', 'Caty Sikora', 'Lebanon', '2012', 575280),
(39, 'Merlin\'s Apprentice', 'Adventure|Fantasy', 'Comedy|Drama', 240, 'Jed Cossans', 'Raymund Ravenscroftt', 'North Korea', '2012', 304511),
(47, 'Bad Lieutenant: Port of Call New Orleans', 'Crime|Drama', 'Drama', 151, 'Tamar Ranns', 'Vivienne MacCorley', 'China', '2012', 314559),
(53, 'Oscar and the Lady in Pink', 'Drama', 'Drama|War', 310, 'Launce Pendergast', 'Marcellina Mallinder', 'Poland', '2013', 165929),
(58, 'Love Lasts Three Years (L\'amour dure trois ans)', 'Comedy|Drama|Romance', 'Action|Horror|Mystery', 90, 'Filmore Whimp', 'Inna Upstone', 'China', '2012', 594147),
(72, 'Suspect Zero', 'Crime|Thriller', 'Drama|Film-Noir', 243, 'Sollie Cusick', 'Sara Briggdale', 'China', '2012', 931300),
(1, 'Hobbit', 'Fantasy', 'Fantasy', 169, 'Peter Jackson', 'Martin Freeman', 'Ameryka', '2012', 817468);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunek`
--

CREATE TABLE `gatunek` (
  `id` int(11) DEFAULT NULL,
  `gatunek` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `gatunek`
--

INSERT INTO `gatunek` (`id`, `gatunek`) VALUES
(1, 'Drama'),
(2, 'Comedy|Drama|Romance|Sci-Fi'),
(3, 'Drama'),
(4, 'Comedy'),
(5, '(no genres listed)'),
(6, 'Drama|Mystery|Thriller'),
(7, 'Comedy'),
(8, 'Documentary|Musical'),
(9, 'Drama'),
(10, 'Action|Fantasy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezyserzy`
--

CREATE TABLE `rezyserzy` (
  `id` int(11) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `kraj` varchar(50) DEFAULT NULL,
  `rok_debiutu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rezyserzy`
--

INSERT INTO `rezyserzy` (`id`, `imie`, `nazwisko`, `kraj`, `rok_debiutu`) VALUES
(25, 'Piotr', 'Tocki', 'Polska', '2020');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seriale`
--

CREATE TABLE `seriale` (
  `id` int(11) DEFAULT NULL,
  `tytul` varchar(50) DEFAULT NULL,
  `gatunek` varchar(50) DEFAULT NULL,
  `typ` varchar(50) DEFAULT NULL,
  `ilosc_sezonow` int(11) DEFAULT NULL,
  `ilosc_odcinkow` int(11) DEFAULT NULL,
  `dlugosc_odcinka` int(11) DEFAULT NULL,
  `rezyser` varchar(50) DEFAULT NULL,
  `aktor` varchar(50) DEFAULT NULL,
  `kraj_produkcji` varchar(50) DEFAULT NULL,
  `premiera` varchar(50) DEFAULT NULL,
  `box_office` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `seriale`
--

INSERT INTO `seriale` (`id`, `tytul`, `gatunek`, `typ`, `ilosc_sezonow`, `ilosc_odcinkow`, `dlugosc_odcinka`, `rezyser`, `aktor`, `kraj_produkcji`, `premiera`, `box_office`) VALUES
(1, 'Beauty and the Beast: The Enchanted Christmas', 'Animation|Children|Fantasy|Musical', 'Documentary', 1, 1, 27, 'Eamon Clapton', 'Waylen Stanistrete', 'Peru', '2012', 575932),
(10, 'Ball, The (Le bal)', 'Musical', 'Drama', 10, 10, 29, 'Udall Spenley', 'Sully Wollacott', 'Indonesia', '2012', 452137),
(40, 'Shaft, The (a.k.a. Down)', 'Action|Horror|Mystery|Sci-Fi', 'Drama|Mystery|Romance', 40, 40, 20, 'Niccolo Fydoe', 'Elle Hassey', 'Poland', '2012', 184981),
(63, 'Mr. Bean\'s Holiday', 'Comedy', 'Drama|Sci-Fi|Thriller', 63, 63, 63, 'Andras Bending', 'Kania Gajownik', 'Poland', '2012', 881243),
(77, 'Sacro GRA', 'Documentary', 'Drama', 77, 77, 32, 'Boothe Ellam', 'Hortensia Barke', 'Philippines', '2012', 949644),
(83, 'Time That Remains, The', 'Drama', 'Comedy|Horror|Thriller', 83, 83, 55, 'Andres Rennolds', 'Homer Tythe', 'Finland', '2012', 412728),
(86, 'Legendy Polskie', 'Fantasy', 'Fantasy', 1, 5, 10, 'Tomasz Bagiński', 'Michalina Olszańska', 'Polska', '2015', 3000000);
--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `Id_filmu` int(11) DEFAULT NULL,
  `Tytul` varchar(50) DEFAULT NULL,
  `Gatunek` varchar(50) DEFAULT NULL,
  `Czas_trwania` int(11) DEFAULT NULL,
  `Rok_produkcji` varchar(50) DEFAULT NULL,
  `Rezyser` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `filmy`
--

INSERT INTO `filmy` (`Id_filmu`, `Tytul`, `Gatunek`, `Czas_trwania`, `Rok_produkcji`, `Rezyser`) VALUES
(1, 'Class of 1999 II: The Substitute', 'Action|Horror|Sci-Fi|Thriller', 108, '2005', 'Alfred Challender'),
(2, 'Welcome Home, Roscoe Jenkins', 'Comedy', 177, '1993', 'Darell Ellerby'),
(3, 'Brood, The', 'Horror', 182, '2006', 'Pat Happert'),
(4, 'Poultrygeist: Night of the Chicken Dead', 'Comedy|Horror|Musical', 122, '2004', 'Sal Oherlihy'),
(5, 'Fjols til fjells', 'Comedy', 143, '2003', 'Mallory McKomb'),
(6, 'Dead Men Tell', 'Comedy|Crime|Drama|Mystery|Thriller', 166, '2008', 'Hymie Passion'),
(7, 'Question of Silence, A (De stilte rond Christine M', 'Drama', 133, '1993', 'Rudd MacColm'),
(8, 'Identity', 'Crime|Horror|Mystery|Thriller', 134, '1993', 'Mab McGann'),
(9, 'Mann tut was Mann kann', 'Comedy', 201, '1993', 'Angela Van Arsdall'),
(10, 'Stealing Rembrandt (Rembrandt)', 'Action|Comedy|Crime', 115, '1987', 'Kerwin Zapater');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `Id_Klienta` int(11) DEFAULT NULL,
  `Imie_Klienta` varchar(50) DEFAULT NULL,
  `Nazwisko_Klienta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`Id_Klienta`, `Imie_Klienta`, `Nazwisko_Klienta`) VALUES
(1, 'Barris', 'Swallwell'),
(2, 'Nicko', 'Patrone'),
(3, 'Chrissy', 'Dorkin'),
(4, 'Giordano', 'McGivena'),
(5, 'Reggis', 'Pochet'),
(6, 'Cosette', 'Brumen'),
(7, 'Bev', 'Raulston'),
(8, 'Berne', 'Daintier'),
(9, 'Norby', 'Dedham'),
(10, 'Cordie', 'Marples');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `Id_Pracownika` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`Id_Pracownika`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `Id_rezerwacji` int(11) DEFAULT NULL,
  `Id_seansu` int(11) DEFAULT NULL,
  `Numer_klienta` int(11) DEFAULT NULL,
  `liczba_miejsc` int(11) DEFAULT NULL,
  `data_rezerwacji` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rezerwacje`
--

INSERT INTO `rezerwacje` (`Id_rezerwacji`, `Id_seansu`, `Numer_klienta`, `liczba_miejsc`, `data_rezerwacji`) VALUES
(1, 1, 1, 100, '0000-00-00'),
(2, 2, 2, 100, '0000-00-00'),
(3, 3, 3, 100, '0000-00-00'),
(4, 4, 4, 100, '0000-00-00'),
(5, 5, 5, 100, '0000-00-00'),
(6, 6, 6, 100, '0000-00-00'),
(7, 7, 7, 100, '0000-00-00'),
(8, 8, 8, 100, '0000-00-00'),
(9, 9, 9, 100, '0000-00-00'),
(10, 10, 10, 100, '0000-00-00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `Numer_sali` int(11) DEFAULT NULL,
  `Liczba_miejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `sale`
--

INSERT INTO `sale` (`Numer_sali`, `Liczba_miejsc`) VALUES
(1, 100),
(2, 100),
(3, 100),
(4, 100),
(5, 100),
(6, 100),
(7, 100),
(8, 100),
(9, 100),
(10, 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seanse`
--

CREATE TABLE `seanse` (
  `Id_Seansu` int(11) DEFAULT NULL,
  `Id_filmu` int(11) DEFAULT NULL,
  `Numer_sali` int(11) DEFAULT NULL,
  `Dzien_tygodnia` date DEFAULT NULL,
  `Godzina_ropoczecia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `seanse`
--

INSERT INTO `seanse` (`Id_Seansu`, `Id_filmu`, `Numer_sali`, `Dzien_tygodnia`, `Godzina_ropoczecia`) VALUES
(1, 1, 1, '0000-00-00', '15:21'),
(2, 2, 2, '0000-00-00', '4:42'),
(3, 3, 3, '0000-00-00', '18:58'),
(4, 4, 4, '0000-00-00', '1:23'),
(5, 5, 5, '0000-00-00', '12:22'),
(6, 6, 6, '0000-00-00', '18:18'),
(7, 7, 7, '0000-00-00', '11:43'),
(8, 8, 8, '0000-00-00', '13:55'),
(9, 9, 9, '0000-00-00', '15:35'),
(10, 10, 10, '0000-00-00', '20:11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
