<?php
require 'db_connect.php';
require 'authenticate.php';

// Fetch the house data
if (!isset($_GET['id'])) {
    header('Location: admin_panel.php');
    exit();
}
$id = $_GET['id'];
$query = "SELECT * FROM houses WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$house = $result->fetch_assoc();

if (!$house) {
    header('Location: admin_panel.php');
    exit();
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $location = $_POST['location'];
    $available = isset($_POST['available']) ? 1 : 0;

    // Handle image upload
    $image_path = $house['image_path'];
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = 'images/';
        $image_name = basename($_FILES['image']['name']);
        $image_path = $upload_dir . $image_name;
        move_uploaded_file($_FILES['image']['tmp_name'], $image_path);
    }

    // Update the house in the database
    $query = "UPDATE houses SET name = ?, description = ?, price_per_month = ?, location = ?, available = ?, image_path = ? WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssdsisi", $name, $description, $price, $location, $available, $image_path, $id);
    $stmt->execute();
    header('Location: admin_panel.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit House</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container my-4">
        <h1>Edit House</h1>
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<?= htmlspecialchars($house['name']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" required><?= htmlspecialchars($house['description']) ?></textarea>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price per Month</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" value="<?= $house['price_per_month'] ?>" required>
            </div>
            <div class="mb-3">
                <label for="location" class="form-label">Location</label>
                <input type="text" id="location" name="location" class="form-control" value="<?= htmlspecialchars($house['location']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <input type="file" id="image" name="image" class="form-control">
                <small>Current Image: <?= $house['image_path'] ?></small>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" id="available" name="available" class="form-check-input" <?= $house['available'] ? 'checked' : '' ?>>
                <label for="available" class="form-check-label">Available</label>
            </div>
            <button type="submit" class="btn btn-primary">Update House</button>
        </form>
    </div>
</body>
</html>
