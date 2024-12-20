<?php
require('../../app.php');
session_start();

if (!isset($_SESSION["user"])) {
    header("Location: ../login.php");
}

$penjual = $_SESSION["role"];

if ($penjual !== "seller") {
    header("Location: ../index.php");
}
?>

<?php require("../../partials/header.php"); ?>
<?php require("nav.php"); ?>

<div class="container">
    <div class="row">
        <div class="col">
            <table class="table table-responsive mt-4">
                <thead>
                    <tr>
                        <th scope="col" style="text-align: center;">No</th>
                        <th scope="col" style="text-align: center;">Pembeli</th>
                        <th scope="col" style="text-align: center;">Buku</th>
                        <th scope="col" style="text-align: center;">Email</th>
                        <th scope="col" style="text-align: center;">Telphone</th>
                        <th scope="col" style="text-align: center;">Harga Per Buku</th>
                        <th scope="col" style="text-align: center;">Harga Total</th>
                        <th scope="col" style="text-align: center;">Pembayaran</th>
                        <th scope="col" style="text-align: center;">Alamat</th>
                        <th scope="col" style="text-align: center;">Status</th>
                        <th scope="col" style="text-align: center;">Tanggal Checkout</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $nomor = 1;
                    $totalPendapatan = 0; // Initialize total revenue variable
                    $dataCheckout = querySql("
                        SELECT 
                            c.id_checkout, 
                            c.nama, 
                            c.nama_buku, 
                            c.email, 
                            c.no_telp, 
                            c.alamat, 
                            c.harga_buku, 
                            c.tipe_pembayaran, 
                            c.status_buku, 
                            c.tanggal_checkout,
                            p.harga_buku AS harga_per_buku
                        FROM checkout c
                        JOIN products p ON c.id_product = p.id_product
                    ");
                    ?>
                    <?php foreach ($dataCheckout as $orderan) : ?>
                        <tr>
                            <td scope="row" style="text-align: center;"><?= $nomor++; ?></td>
                            <td style="text-align: center;"><?= $orderan["nama"]; ?></td>
                            <td style="text-align: center;"><?= $orderan["nama_buku"]; ?></td>
                            <td style="text-align: center;"><?= $orderan["email"]; ?></td>
                            <td style="text-align: center;"><?= $orderan["no_telp"]; ?></td>
                            <td style="text-align: center;"><?= number_format($orderan["harga_per_buku"]); ?></td>
                            <td style="text-align: center;"><?= number_format($orderan["harga_buku"]); ?></td>
                            <td style="text-align: center;"><?= $orderan["tipe_pembayaran"]; ?></td>
                            <td style="text-align: center;"><?= $orderan["alamat"]; ?></td>
                            <td>
                                <?php if ($orderan["status_buku"] === "accept") : ?>
                                    <span class="text-success fw-bold" style="text-align: center;"><?= $orderan["status_buku"]; ?></span>
                                    <?php $totalPendapatan += $orderan["harga_buku"]; // Add to total revenue ?>
                                <?php elseif ($orderan["status_buku"] === "reject") : ?>
                                    <span class="text-danger fw-bold" style="text-align: center;"> <?= $orderan["status_buku"]; ?></span>
                                <?php else : ?>
                                    <?= $orderan["status_buku"]; ?>
                                    <a href="accept.php?id=<?= $orderan["id_checkout"]; ?>" class="badge bg-success rounded-pill text-decoration-none">Terima</a>
                                    <a href="reject.php?id=<?= $orderan["id_checkout"]; ?>" class="badge bg-danger rounded-pill text-decoration-none">Tolak</a>
                                <?php endif; ?>
                            </td>
                            <td style="text-align: center;"><?= date("d-M-Y", strtotime($orderan["tanggal_checkout"])); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
                <!-- Tambahkan baris untuk total pendapatan -->
                <tfoot>
                    <tr>
                        <td colspan="10" style="text-align: right; font-weight: bold;">Total Pendapatan:</td>
                        <td style="text-align: center; font-weight: bold;"><?= number_format($totalPendapatan); ?></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
