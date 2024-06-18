<?php
function validateXML($xmlFile, $xsdFile) {
    $xml = new DOMDocument();
    $xml->load($xmlFile);

    if ($xml->schemaValidate($xsdFile)) {
        return true;
    } else {
        return false;
    }
}
?>