<?php

// Připojení k databázi
$db = new mysqli("database", "admin", "heslo", "univerzita");

// Kontrola připojení
if ($db->connect_error) {
    die("Připojení k databázi selhalo: " . $db->connect_error);
}

// Vytvoření nového DOM dokumentu
$dom = new DOMDocument('1.0', 'UTF-8');
$dom->formatOutput = true;

// Přidání instrukce pro stylování
$xslt = $dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="xml/fakulta.xsl"');
$dom->appendChild($xslt);

// Vytvoření základního XML elementu
$fakultyElement = $dom->createElement('fakulty');
$dom->appendChild($fakultyElement);

// Načtení fakult z databáze
$fakulty_result = $db->query('SELECT id, nazev, dekan_id FROM Fakulta');

if ($fakulty_result) {
    while ($fakulta_row = $fakulty_result->fetch_assoc()) {
        $fakultaElement = $dom->createElement('fakulta');
        $fakultyElement->appendChild($fakultaElement);

        $dekan_id = $fakulta_row['dekan_id'];
        if ($dekan_id) {
            $dekan_result = $db->query("SELECT jmeno, prijmeni, email FROM Osoba WHERE id=$dekan_id");
            $dekan_row = $dekan_result->fetch_assoc();

            $dekanElement = $dom->createElement('dekan');
            $fakultaElement->appendChild($dekanElement);

            $dekanElement->appendChild($dom->createElement('jmeno', $dekan_row['jmeno']));
            $dekanElement->appendChild($dom->createElement('prijmeni', $dekan_row['prijmeni']));
            $dekanElement->appendChild($dom->createElement('email', $dekan_row['email']));
        }

        // Načtení kateder pro konkrétní fakultu
        $katedry_result = $db->query("SELECT id, zkratka, vedouci_id, webove_stranky FROM Katedra WHERE fakulta_id = {$fakulta_row['id']}");

        if ($katedry_result) {
            while ($katedra_row = $katedry_result->fetch_assoc()) {
                $katedraElement = $dom->createElement('katedra');
                $fakultaElement->appendChild($katedraElement);

                $katedraElement->setAttribute('zkratka_katedry', $katedra_row['zkratka']);
                $katedraElement->setAttribute('webové_stránky', $katedra_row['webove_stranky']);

                // Načtení vedoucího katedry
                if ($katedra_row['vedouci_id']) {
                    $vedouci_result = $db->query("SELECT jmeno, telefon, email FROM Osoba WHERE id = {$katedra_row['vedouci_id']}");
                    $vedouci_row = $vedouci_result->fetch_assoc();

                    $vedouciElement = $dom->createElement('vedoucí');
                    $katedraElement->appendChild($vedouciElement);

                    $vedouciElement->appendChild($dom->createElement('jméno', $vedouci_row['jmeno']));

                    if (!empty($vedouci_row['telefon'])) {
                        $vedouciElement->appendChild($dom->createElement('telefon', $vedouci_row['telefon']));
                    }
                    if (!empty($vedouci_row['email'])) {
                        $vedouciElement->appendChild($dom->createElement('email', $vedouci_row['email']));
                    }
                }

                // Načtení zaměstnanců katedry
                $zamestnanci_result = $db->query("SELECT id, jmeno, telefon, email FROM Zamestnanec WHERE katedra_id = {$katedra_row['id']}");
                $zamestnanciElement = $dom->createElement('zaměstnanci');
                $katedraElement->appendChild($zamestnanciElement);

                while ($zamestnanec_row = $zamestnanci_result->fetch_assoc()) {
                    $zamestnanecElement = $dom->createElement('zaměstnanec');
                    $zamestnanciElement->appendChild($zamestnanecElement);

                    $zamestnanecElement->appendChild($dom->createElement('jméno', $zamestnanec_row['jmeno']));

                    if (!empty($zamestnanec_row['telefon'])) {
                        $zamestnanecElement->appendChild($dom->createElement('telefon', $zamestnanec_row['telefon']));
                    }
                    if (!empty($zamestnanec_row['email'])) {
                        $zamestnanecElement->appendChild($dom->createElement('email', $zamestnanec_row['email']));
                    }

                    // Načtení pozice zaměstnance
                    $pozice_result = $db->query("SELECT nazev FROM Pozice WHERE zamestnanec_id = {$zamestnanec_row['id']}");
                    $pozice_row = $pozice_result->fetch_assoc();

                    if ($pozice_row) {
                        $poziceElement = $dom->createElement('pozice');
                        $poziceElement->appendChild($dom->createElement($pozice_row['nazev'], $pozice_row['nazev']));
                        $zamestnanecElement->appendChild($poziceElement);
                    }
                }

                // Načtení předmětů katedry
                $predmety_result = $db->query("SELECT zkratka, nazev, popis, typ FROM Predmet WHERE katedra_id = {$katedra_row['id']}");
                $predmetyElement = $dom->createElement('předměty');
                $katedraElement->appendChild($predmetyElement);

                while ($predmet_row = $predmety_result->fetch_assoc()) {
                    $predmetElement = $dom->createElement('předmět');
                    $predmetElement->setAttribute('zkratka', $predmet_row['zkratka']);
                    $predmetElement->setAttribute('typ', $predmet_row['typ']);
                    $predmetElement->appendChild($dom->createElement('název', $predmet_row['nazev']));

                    if (!empty($predmet_row['popis'])) {
                        $predmetElement->appendChild($dom->createElement('popis', $predmet_row['popis']));
                    }

                    $predmetyElement->appendChild($predmetElement);
                }
            }
        }
    }
}

// Cesta k uložení souboru ve složce "xml"
$file_path = __DIR__ . '/xml/fakulta.xml';

// Kontrola, zda složka "xml" existuje, pokud ne, vytvoření složky
if (!is_dir(__DIR__ . '/xml')) {
    mkdir(__DIR__ . '/xml', 0755, true);
}

// Uložení formátovaného XML do souboru
$dom->save($file_path);

echo "XML soubor byl úspěšně vygenerován a uložen jako " . $file_path . "\n";

// Zavření databázového připojení
$db->close();
?>
