<?php
require 'db_connect.php';
require 'authenticate.php';

// Fetch houses
$sql_houses = "SELECT * FROM houses";
$result_houses = $conn->query($sql_houses);

// Fetch reviews
$sql_reviews = "SELECT * FROM review";
$result_reviews = $conn->query($sql_reviews);

// Handle delete house
if (isset($_GET['delete_house'])) {
    $id = $_GET['delete_house'];
    $conn->query("DELETE FROM houses WHERE id = $id");
    header('Location: admin_panel.php');
    exit();
}

// Handle delete review
if (isset($_GET['delete_review'])) {
    $id = $_GET['delete_review'];
    $conn->query("DELETE FROM review WHERE id = $id");
    header('Location: admin_panel.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container my-4">
        <h1>Admin Panel</h1>

        <!-- Houses Table -->
        <h2>Manage Houses</h2>
        <a href="add_house.php" class="btn btn-success mb-3">Add New House</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Location</th>
                    <th>Available</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($house = $result_houses->fetch_assoc()): ?>
                    <tr>
                        <td><?= $house['id'] ?></td>
                        <td><?= htmlspecialchars($house['name']) ?></td>
                        <td><?= htmlspecialchars($house['description']) ?></td>
                        <td>$<?= htmlspecialchars($house['price_per_month']) ?></td>
                        <td><?= htmlspecialchars($house['location']) ?></td>
                        <td><?= $house['available'] ? 'Yes' : 'No' ?></td>
                        <td>
                            <?php if ($house['image_path']): ?>
                                <img src="<?= $house['image_path'] ?>" alt="<?= htmlspecialchars($house['name']) ?>" width="100">
                            <?php endif; ?>
                        </td>
                        <td>
                            <a href="edit_house.php?id=<?= $house['id'] ?>" class="btn btn-primary btn-sm">Edit</a>
                            <a href="?delete_house=<?= $house['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this house?');">Delete</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <!-- Reviews Table -->
        <h2>Manage Reviews</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Review</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($review = $result_reviews->fetch_assoc()): ?>
                    <tr>
                        <td><?= $review['id'] ?></td>
                        <td><?= htmlspecialchars($review['content']) ?></td>
                        <td><?= $review['created_at'] ?></td>
                        <td>
                            <a href="?delete_review=<?= $review['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this review?');">Delete</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
