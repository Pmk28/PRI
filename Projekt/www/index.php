<?php
session_start();
if (!isset($_SESSION['loggedin'])) {
    header('Location: login.php');
    exit;
}
include 'templates/header.php';
include 'templates/navbar.php';
?>


<h1>NBA INFO</h1>

<h2>Struktura NBA</h2>
<p>
NBA se dělí na Západní konferenci (Western Conference) a Východní konferenci (Eastern Conference), 
z nichž každá se aktuálně skládá ze tří divizí po pěti družstvech. Sezóna NBA se skládá z dlouhodobé části 
(hrané systémem každý s každým) a závěrečného play-off hraného vylučovacím systémem. Play-off se hraje zvlášť v každé konferenci, 
vítězové východní a západní konference se na závěr utkávají ve Finále NBA. Každé družstvo odehraje celkem 82 zápasů a ze západní 
a východní konference postoupí vždy 16 týmů do play-off (8 týmů ze západní konference a 8 týmů z východní konference)
</p>
<h2>Vznik NBA</h2>
<p>
NBA byla založena pod názvem BAA (Basketball Association of America) roku 1946 s pouze 11 týmy, 
měla sloužit jako konkurence NBL existující už od roku 1937. První zápas se hrál 1. listopadu 1946 v Torontu mezi Toronto 
Huskies a New York Knicks. Vůbec prvním skórujícím hráčem v zápase NBA se stal Ossie Schectman z týmu New Yorku. 
Struktura NBA je od začátku stejná.

V první sezóně postoupili do finále BAA Chicago Stags a Philadelphia Warriors. 4–1 na zápasy vyhrála Philadhelphia 
a tím se stala prvním vítězem NBA v historii. Nejlepším střelcem sezóny se stal Joe Fulks. Roku 1948 vyhráli BAA 
Baltimore Bullets a o rok později Mineapolis Lakers. Během těchto let byl do NBA přidán 1 tým z konkurenční NBL. 
Tyto 3 roky NBL a BAA soupeřili o to, kdo bude mít více fanoušků a větší popularitu. NBL klesla popularita, zbylo v ní pouze 
5 týmů a připojila se k BAA, vznikla legendární NBA.
</p>

