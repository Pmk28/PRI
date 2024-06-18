<?php include 'templates/header.php'; ?>
<?php include 'templates/navbar.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Player</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<h1>Add a New Player</h1>

<div class="container"> 
    <form action="process_player.php" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" autocomplete="off" required><br>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" autocomplete="off" required><br>

        <label for="total_points">Total Points:</label>
        <input type="number" id="total_points" name="total_points" autocomplete="off" required><br>

        <label for="number_of_rings">Number of Rings:</label>
        <input type="number" id="number_of_rings" name="number_of_rings" autocomplete="off" required><br>

        <input type="submit" value="Add Player">
    </form>
</div>


</body>
</html>