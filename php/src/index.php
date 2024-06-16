<!DOCTYPE html>
<html lang="cs">

<?php $title = 'XML validátor' ?>

<head>
    <title>
        <?= $title ?>
    </title>
</head>

<body>
    <h1>
        <?= $title ?>
    </h1>

    <p>Nahrajte XML soubor, případně také XSD soubor pro validaci.</p>
    <hr>
    <form enctype="multipart/form-data" method="POST">
        <table>
            <tr>
                <td>XML soubor:</td>
                <td><input type="file" name="xml" accept="text/xml" data-max-file-size="2M"></td>
            </tr>
            <tr>
                <td>XSD soubor:</td>
                <td><input type="file" name="xsd" accept="application/xml" data-max-file-size="2M"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Odeslat"></td>
            </tr>
        </table>
    </form>
    <hr>

    <?php
    function printErrors()
    { ?>
        <table>
            <?php foreach (libxml_get_errors() as $error) { ?>
                <tr>
                    <td>
                        <?= $error->line ?>
                    </td>
                    <td>
                        <?= $error->message ?>
                    </td>
                </tr>
            <?php } ?>
        </table>
    <?php
    }

    function validate($xmlPath, $xsdPath)
    {
        $doc = new DOMDocument;

        // Kontrola well-formed
        libxml_use_internal_errors(true);
        $doc->loadXML(file_get_contents($xmlPath));
        printErrors();
        libxml_use_internal_errors(false);

        // Validace pomocí XSD
        if ($xsdPath) {
            $isValid = $doc->schemaValidate($xsdPath);
            if ($isValid) {
                echo "<p>Validace pomocí XSD byla úspěšná.</p>";
            } else {
                echo "<p>Chyby při validaci pomocí XSD:</p>";
                printErrors();
            }
            return $isValid;
        } else {
            echo "<p>Nebyl zadán XSD soubor pro validaci.</p>";
            return false;
        }
    }

    // Zpracování odeslaného formuláře
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $xmlFile = @$_FILES['xml'];
        $xsdFile = @$_FILES['xsd'];

        // Zpracování nahraných souborů
        if ($xmlFile && $xmlFile['error'] === UPLOAD_ERR_OK) {
            $xmlTmpName = $xmlFile['tmp_name'];
            $xsdTmpName = $xsdFile['tmp_name'];

            $isValid = validate($xmlTmpName, $xsdTmpName);
            if ($isValid) {
                echo "<p>Nahraný XML soubor je validní.</p>";
            }
        } else {
            echo "<p>Nastala chyba při nahrávání XML souboru.</p>";
        }
    }
    ?>
</body>

</html>
