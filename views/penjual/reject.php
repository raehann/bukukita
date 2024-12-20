<?php
require('../../app.php');
session_start();

if (!isset($_SESSION["user"])) {
    header("Location: ../login.php");
}

$bookId = $_GET["id"];

if (rejectBook($bookId) > 0) {
    echo "
        <script>
            alert('Pembelian Berhasil Di Tolak!');
            location='history-order.php';
        </script>
    ";
} else {
    echo "
        <script>
            alert('Kesalahan Jaringan');
            location='history-order.php';
        </script>
    ";
}
