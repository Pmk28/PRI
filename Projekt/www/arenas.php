<?php
session_start();
if (!isset($_SESSION['loggedin'])) {
    header('Location: login.php');
    exit;
}
include 'templates/header.php';
include 'templates/navbar.php';
include 'validate.php';


if (validateXML('data/arenas.xml', 'data/schema.xsd')) {
    $xml = new DOMDocument;
    $xml->load('data/arenas.xml');

    $xsl = new DOMDocument;
    $xsl->load('data/arenas.xsl');

    $proc = new XSLTProcessor;
    $proc->importStyleSheet($xsl);
    echo $proc->transformToXML($xml);
} else {
    echo "XML data jsou neplatná.";
}

include 'templates/footer.php';
?>