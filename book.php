<?php

session_start();
require 'db_connect.php';
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {
    header('Location: login.php');
    exit();
}



// Handle booking submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $house_id = $_POST['house_id'];
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];

    $query = "INSERT INTO reservations (user_id, house_id, start_date, end_date) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('iiss', $_SESSION['user_id'], $house_id, $start_date, $end_date);
    $stmt->execute();
    $success = "Booking confirmed!";
}

// Fetch available houses
$query = "SELECT id, name FROM houses WHERE available = 1";
$result = $conn->query($query);
$houses = $result->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a House</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container">
        <h1>Book a House</h1>
        <?php if (isset($success)): ?><div class="alert alert-success"><?= $success ?></div><?php endif; ?>
        <form action="" method="POST">
            <label for="house_id">Select House:</label>
            <select name="house_id" id="house_id" class="form-control">
                <?php foreach ($houses as $house): ?>
                    <option value="<?= $house['id'] ?>"><?= $house['name'] ?></option>
                <?php endforeach; ?>
            </select>
            <label for="start_date">Start Date:</label>
            <input type="date" name="start_date" class="form-control" required>
            <label for="end_date">End Date:</label>
            <input type="date" name="end_date" class="form-control" required>
            <button type="submit" class="btn btn-primary mt-3">Book Now</button>
        </form>
    </div>
</body>
</html>
