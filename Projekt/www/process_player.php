<?php
function validateXML($xmlFile, $xsdFile) {
    $xml = new DOMDocument();
    $xml->load($xmlFile);
    return $xml->schemaValidate($xsdFile);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $age = $_POST['age'];
    $total_points = $_POST['total_points'];
    $number_of_rings = $_POST['number_of_rings'];

    $xmlFile = 'data/players.xml';
    $xsdFile = 'data/schema.xsd';

    $xml = new DOMDocument();
    $xml->preserveWhiteSpace = false; // Přidáno: zajistí kompaktní ukládání
    $xml->formatOutput = true; // Nastavení formátování výstupu
    $xml->load($xmlFile);

    // Vytvoření instance DOMXPath
    $xpath = new DOMXPath($xml);

    // Vyhledání hráče podle jména
    $query = "//player[name='$name']";
    $playerNodeList = $xpath->query($query);

    if ($playerNodeList->length > 0) {
        // Hráč již existuje
        $message = "Player with the name '$name' already exists.";
    } else {
        // Přidání nového hráče, protože neexistuje
        $players = $xml->getElementsByTagName('players')->item(0);

        $newPlayer = $xml->createElement('player');

        $nameElement = $xml->createElement('name', $name);
        $ageElement = $xml->createElement('age', $age);
        $totalPointsElement = $xml->createElement('total_points', $total_points);
        $numberOfRingsElement = $xml->createElement('number_of_rings', $number_of_rings);

        $newPlayer->appendChild($nameElement);
        $newPlayer->appendChild($ageElement);
        $newPlayer->appendChild($totalPointsElement);
        $newPlayer->appendChild($numberOfRingsElement);

        $players->appendChild($newPlayer);

        $xml->save($xmlFile);

        if (validateXML($xmlFile, $xsdFile)) {
            $message = "Player added successfully!";
        } else {
            $message = "Error: The XML file is invalid!";
        }
    }
} else {
    $message = "Invalid request method.";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Player Addition Result</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1><?php echo $message; ?></h1>
        <a href="index.php">Go back to Home Page</a>
    </div>
</body>
</html>