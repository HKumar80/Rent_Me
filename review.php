<?php
session_start();
require 'db_connect.php';

if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {
    header('Location: login.php');
    exit();
}

// Ensure user_id is available
$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;
if (!$user_id) {
    die("Error: User ID not found in session.");
}

// Generate a CAPTCHA
if (!isset($_SESSION['captcha'])) {
    $_SESSION['captcha'] = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 6);
}

// Add a new review
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['review'])) {
    $content = trim($_POST['review']);
    $user_captcha = trim($_POST['captcha']);
    $actual_captcha = $_SESSION['captcha'];

    if ($user_captcha === $actual_captcha) {
        // CAPTCHA is valid, insert review into the database
        $sql = "INSERT INTO review (user_id, content) VALUES (?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("is", $user_id, $content);
        $stmt->execute();

        // Regenerate CAPTCHA after successful submission
        $_SESSION['captcha'] = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 6);
    } else {
        echo "<div class='alert alert-danger'>CAPTCHA verification failed. Please try again.</div>";
    }
}

// Fetch the latest 5 reviews
$sql_reviews = "SELECT r.content, u.username, r.created_at 
                FROM review r 
                JOIN admins u ON r.user_id = u.user_id 
                ORDER BY r.created_at DESC LIMIT 5";
$result_reviews = $conn->query($sql_reviews);

$reviews = $result_reviews->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Reviews</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container">
        <h1>Reviews</h1>
        <form method="POST" action="">
            <textarea name="review" class="form-control" rows="3" placeholder="Write your review here..." required></textarea>
            <div class="mt-2">
                <label for="captcha"><strong>Enter the text below:</strong></label><br>
                <span style="font-size: 20px; font-weight: bold; background-color: #f0f0f0; padding: 5px; display: inline-block;">
                    <?php echo $_SESSION['captcha']; ?>
                </span>
            </div>
            <input type="text" name="captcha" class="form-control mt-2" placeholder="Enter CAPTCHA here" required>
            <button type="submit" class="btn btn-primary mt-2">Submit Review</button>
        </form>
        <h2 class="mt-4">Latest Reviews</h2>
        <ul>
            <?php foreach ($reviews as $review): ?>
                <li><strong><?= htmlspecialchars($review['username']) ?></strong> (<?= htmlspecialchars($review['created_at']) ?>): <?= htmlspecialchars($review['content']) ?></li>
            <?php endforeach; ?>
        </ul>
    </div>
</body>
</html>
