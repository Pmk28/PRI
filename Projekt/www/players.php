<?php
session_start();
if (!isset($_SESSION['loggedin'])) {
    header('Location: login.php');
    exit;
}
include 'templates/header.php';
include 'templates/navbar.php';
include 'validate.php';

if (validateXML('data/players.xml', 'data/schema.xsd')) {
    $xml = new DOMDocument;
    $xml->load('data/players.xml');

    $xsl = new DOMDocument;
    $xsl->load('data/players.xsl');

    $proc = new XSLTProcessor;
    $proc->importStyleSheet($xsl);
    echo $proc->transformToXML($xml);
} else {
    echo "XML data jsou neplatná.";
}

include 'templates/footer.php';
?>