<?php
session_start();

// If the user confirms logout, destroy the session and redirect to index.php
if (isset($_POST['confirm_logout'])) {
    session_destroy();
    header('Location: index.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<?php include 'navbar.php'; ?>
    <div class="container text-center mt-5">
        <h1>Are you sure you want to logout?</h1>
        <form method="POST" action="">
            <button type="submit" name="confirm_logout" class="btn btn-danger">Yes, Logout</button>
            <a href="index.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
