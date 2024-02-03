<?php
// Database configuration
$servername = "localhost";
$username = "khan";
$password = "6666";
$dbname = "pictures";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch pictures from database
$sql = "SELECT * FROM pictures";
$result = $conn->query($sql);

$pictures = array();

if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        $pictures[] = array(
            'path' => $row["path"],
            'latitude' => $row["latitude"],
            'longitude' => $row["longitude"]
        );
    }
    echo json_encode($pictures);
} else {
    echo "0 results";
}

$conn->close();
?>
