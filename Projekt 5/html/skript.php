<?php

// Vytvoření základního elementu <fakulta>
$xml = new SimpleXMLElement('<fakulta></fakulta>');
$xml->addAttribute('děkan', 'prof. Ing. Jan Novák, Ph.D.');

// Přidání katedry
$katedra = $xml->addChild('katedra');
$katedra->addAttribute('zkratka_katedry', 'KIV');
$katedra->addAttribute('webové_stránky', 'https://www.kiv.ujep.cz');

// Přidání vedoucího katedry
$vedouci = $katedra->addChild('vedoucí');
$vedouciJmeno = $vedouci->addChild('jméno', 'Dr. Karel Veselý');

// Přidání kontaktů vedoucího (telefon a email)
$vedouci->addChild('telefon', '123456789');
$vedouci->addChild('email', 'karel.vesely@kiv.ujep.cz');

// Přidání seznamu zaměstnanců
$zamestnanci = $katedra->addChild('zaměstnanci');

// Přidání jednoho zaměstnance
$zamestnanec = $zamestnanci->addChild('zaměstnanec');
$zamestnanec->addChild('jméno', 'Jan Nový');
$zamestnanec->addChild('telefon', '987654321');
$zamestnanec->addChild('email', 'jan.novy@kiv.ujep.cz');

// Přidání pozice zaměstnance
$pozice = $zamestnanec->addChild('pozice');
$pozice->addChild('lektor', 'Lektor');

// Přidání seznamu předmětů
$predmety = $katedra->addChild('předměty');

// Přidání jednoho předmětu
$predmet = $predmety->addChild('předmět');
$predmet->addAttribute('zkratka', 'PROGRAMOVANI1');
$predmet->addAttribute('typ', 'přednáška');
$predmet->addChild('název', 'Programování I');
$predmet->addChild('popis', 'Úvod do programování v jazyce C++');

// Přidání dalšího předmětu
$predmet2 = $predmety->addChild('předmět');
$predmet2->addAttribute('zkratka', 'WEBOVKY');
$predmet2->addAttribute('typ', 'seminář');
$predmet2->addChild('název', 'Webové technologie');
$predmet2->addChild('popis', 'Kurz zaměřený na tvorbu webových aplikací.');

// Převod SimpleXML na DOMDocument pro formátování
$dom = new DOMDocument('1.0', 'UTF-8');
$dom->preserveWhiteSpace = false;
$dom->formatOutput = true;
$dom->loadXML($xml->asXML());

// Cesta k uložení souboru ve složce "xml"
$file_path = __DIR__ . '/xml/fakulta.xml';

// Kontrola, zda složka "xml" existuje, pokud ne, vytvoření složky
if (!is_dir(__DIR__ . '/xml')) {
    mkdir(__DIR__ . '/xml', 0755, true);
}

// Uložení formátovaného XML do souboru
$dom->save($file_path);

echo "XML soubor byl úspěšně vygenerován a uložen jako " . $file_path . "\n";
?>
