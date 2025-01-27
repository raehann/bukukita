<nav class="navbar navbar-expand-lg navbar-light bg-transparent">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.php">BukuKita</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav mx-auto">

            </div>
            <div class="navbar-nav mr-auto">
                <?php if (!isset($_SESSION["user"])) : ?>
                    <a class="nav-link fw-bold text-dark mx-2" href="../views/daftar.php">Daftar</a>
                    <a class="btn btn-outline-dark fw-bold" href="../views/login.php">Masuk</a>
                <?php elseif (isset($_SESSION["user"])) : ?>
                    <a class="nav-link fw-bold text-dark mx-2 " href="../views/history-order.php">Pembelian</a>
                    <a class="nav-link fw-bold text-dark mx-2" href="../views/cart.php">Keranjang</a>
                    <span class="nav-link fw-bold text-dark mx-2"><?= $_SESSION["nama"] ?></span>
                    <a href="../auth/logout.php" class="btn btn-dark text-white fw-bold text-dark mx-2">Keluar</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</nav>