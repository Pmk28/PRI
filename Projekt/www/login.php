<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username == 'admin' && $password == 'heslo') {
        $_SESSION['loggedin'] = true;
        header('Location: index.php');
        exit;
    } else {
        $error = "Špatné uživatelské jméno nebo heslo!";
    }
}
?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Přihlášení</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <form method="post" action="login.php">
        <label for="username">Uživatelské jméno:</label>
        <input type="text" id="username" name="username" autocomplete="off" required>
        <label for="password">Heslo:</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Přihlásit se</button>
        <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>
    </form>
</body>
</html>