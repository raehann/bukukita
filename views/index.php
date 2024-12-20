<?php
session_start();
require('../app.php');
$productBook = querySql("SELECT * FROM products ORDER BY id_product ASC");


?>
<?php require('../partials/header.php'); ?>

<section style="background: #fff7ed; height: 100vh; color: #000;">
    <?php require('../partials/navigation.php'); ?>
    <?php require('../partials/hero.php'); ?>
</section>
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-3">
                <h3 class="fw-bold">Fakta Artikel Tentang Buku</h3>
                <div class="mt-4">
                    <h5>(+) Ada sekitar 129 juta buku tercetak di dunia</h5>
                    <p>Mengacu pada data algoritma Google yang dikutip dari Mashable, buku yang telah dicetak di semua era modern ini adalah 129 juta buku, dengan jumlah terhitung persisnya 129.864.880 buah buku. Walau bagaimana pun, Google mengakui perhitungannya belum sempurna, tetapi mereka dapat memastikan bahwa buku-buku yang terhitung tersebut adalah yang tercantum dalam ISBN (International Standard Book Number).</p>
                    <p>Sumber: <a href="https://literasinusantara.com/fakta-unik-tentang-buku/" class="text-decoration-none text-dark fw-bold">Literasi Nusantara</a></p>
                </div>
            </div>
            <div class="col-md-6 mt-3">
                <img src="../assets/images/reading-book-content.png" width="90%" class="img-fluid" alt="">
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-3">
                <h3 class="fw-bold">Tentang BukuKita</h3>
                <div class="mt-4">
                    <img src="../assets/images/feature-app.png" alt="">
                </div>
            </div>
            <div class="col-md-6">
                <div style="margin-top: 70px;">
                    <h5><br></br></h5>
                    <h5><br></br></h5>
                    <h5>BukuKita adalah platform pembelian buku fisik secara online yang bekerja sama
                        langsung kepada penerbit dan penulis. BukuKita menjamin buku yang dijual adalah resmi dan tidak bajakan.
                        Dengan membeli buku yang resmi kita membantu banyak penulis loh. Stop beli bajakan beralih yang resmi.
                    </h5>
                </div>
            </div>
        </div>
    </div>
</section>

<?php require('../partials/footer.php'); ?>