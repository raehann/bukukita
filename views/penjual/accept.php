<?php
require('../../app.php');
session_start();

$bookId = $_GET["id"];

if (acceptBook($bookId) > 0) {
    echo "
        <script>
            alert('Pembelian Berhasil diterima!');
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
