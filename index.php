<?php
require_once 'db_connect.php';
session_start();

// Fetch unique locations from the database
$sql_locations = "SELECT DISTINCT location FROM houses WHERE location IS NOT NULL";
$stmt_locations = $conn->prepare($sql_locations);
$stmt_locations->execute();
$locations = $stmt_locations->get_result()->fetch_all(MYSQLI_ASSOC);

// Fetch houses based on the selected location or search term
$selected_location = isset($_GET['location']) ? $_GET['location'] : '';
$search_term = isset($_GET['search']) ? $_GET['search'] : '';

$sql_houses = "SELECT * FROM houses WHERE available = TRUE";
$params = [];

if (!empty($selected_location)) {
    $sql_houses .= " AND location = ?";
    $params[] = $selected_location;
}

if (!empty($search_term)) {
    $sql_houses .= " AND name LIKE ?";
    $params[] = '%' . $search_term . '%';
}

$stmt_houses = $conn->prepare($sql_houses);
if (!empty($params)) {
    $stmt_houses->bind_param(str_repeat('s', count($params)), ...$params);
}
$stmt_houses->execute();
$houses = $stmt_houses->get_result()->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Rent Me</title>
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container">
        <h1 class="my-4 text-center">Available Houses</h1>

        <!-- Sort and Search Form -->
        <form method="GET" action="" class="row g-3 mb-4">
            <div class="col-md-5">
                <label for="location" class="form-label">Filter by Location:</label>
                <select id="location" name="location" class="form-select">
                    <option value="">All Locations</option>
                    <?php foreach ($locations as $location): ?>
                        <option value="<?= htmlspecialchars($location['location']) ?>" <?= $selected_location === $location['location'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($location['location']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-5">
                <label for="search" class="form-label">Search by Name:</label>
                <input type="text" id="search" name="search" class="form-control" placeholder="Search..." value="<?= htmlspecialchars($search_term) ?>">
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">Search</button>
            </div>
        </form>

        <!-- Houses List -->
        <div class="row">
            <?php if ($houses): ?>
                <?php foreach ($houses as $house): ?>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <img src="<?= htmlspecialchars($house['image_path']) ?>" class="card-img-top" alt="<?= htmlspecialchars($house['name']) ?>">
                            <div class="card-body">
                                <h5 class="card-title"><?= htmlspecialchars($house['name']) ?></h5>
                                <p class="card-text"><?= htmlspecialchars($house['description']) ?></p>
                                <p><strong>Price:</strong> $<?= htmlspecialchars($house['price_per_month']) ?>/month</p>
                                <p><strong>Location:</strong> <?= htmlspecialchars($house['location']) ?></p>
                                <?php if (isset($_SESSION['user_logged_in'])): ?>
                                    <a href="book.php?house_id=<?= $house['id'] ?>" class="btn btn-primary">Book</a>
                                <?php else: ?>
                                    <a href="login.php" class="btn btn-warning">Login to Book</a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="col-12">
                    <p class="alert alert-warning text-center">No houses available matching your criteria.</p>
                </div>
            <?php endif; ?>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
