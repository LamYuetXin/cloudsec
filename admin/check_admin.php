<?php
session_start();
require 'config.php'; // optional, for database login check

$adminId = $_POST['admin_id'] ?? '';
$passcode = $_POST['passcode'] ?? '';

// Replace with real DB logic if needed
$validAdminId = "admin123";
$validPasscode = "securepass";

// Initialize login attempts if not set
if (!isset($_SESSION['login_attempts'])) {
    $_SESSION['login_attempts'] = 0;
}

// Check if credentials are correct
if ($adminId === $validAdminId && $passcode === $validPasscode) {
    $_SESSION['is_admin'] = true;
    $_SESSION['login_attempts'] = 0; // Reset attempts on success
    header('Location: adminstaffpage.php');
    exit();
} else {
    $_SESSION['login_attempts']++;

    // If 3 or more failed attempts, redirect to staff dashboard
    if ($_SESSION['login_attempts'] >= 3) {
        $_SESSION['login_attempts'] = 0; // Reset after redirect
        header("Location: admindashboard.php");
        exit();
    }

    // Otherwise, redirect back to login with error
    $error = urlencode("Invalid credentials");
    header("Location: adminauthorize.php?error=$error");
    exit();
}
