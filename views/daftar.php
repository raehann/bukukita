<?php
require('../app.php');
if (isset($_POST["daftar"])) {
    // ini ketika tombol diklik
    if (createUser($_POST) > 0) {
        // ketika function usernya ini mengembalikan true, atau mysqli_num_rows nya lebih dari 0
        echo "<script> 
            alert('Berhasil membuat akun!'); 
            location='login.php';
        </script>";
    } else {
        echo "<script> 
            alert('Gagal membuat akun!'); 
            location='daftar.php';
        </script>";
    }
}


require('../partials/header.php');

?>
<?php require('../partials/navigation.php'); ?>

<div class="container">
    <div class="mt-5">
        <div class="card" style="width: 80%; margin: auto;">
            <div class="card-header d-flex">
                <h5 class="mr-auto">Daftar<span onclick="btnAdmin()"></span></h5>

                <span class="mx-auto"></span>
                <p>Udah Punya Akun?&nbsp;</p>
                <a href="login.php" class="text-decoration-none float-end">
                    <p> Login disini!</p>
                </a>
            </div>
            <div class="card-body">
                <?php isset($_COOKIE["error_auth"]) ? $error_auth = $_COOKIE["error_auth"] : $error_auth = null ?>
                <?php if ($error_auth) : ?>
                    <div class="alert alert-danger" role="alert">
                        <span><?= $error_auth; ?></span>
                    </div>
                <?php endif; ?>
                <form method="post">
                    <div class="form-group">
                        <label for="nama">Nama</label>
                        <input type="text" class="form-control mt-2" name="nama" id="nama" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-2">
                        <label for="email">Email</label>
                        <input type="email" class="form-control mt-2" name="email" id="email" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-2">
                        <label for="password">Password</label>
                        <input type="password" class="form-control mt-2" name="password" id="password" placeholder="**********">
                    </div>
                    <div class="form-group mt-2">
                        <label for="book_favorite">Buku Favorite Kamu apa?</label>
                        <input type="text" class="form-control mt-2" name="book_favorite" id="book_favorite" autocomplete="off" required>
                    </div>
                    <div class="form-group mt-2">
                        <label for="jenis_kelamin">Jenis Kelamin</label>
                        <select name="jenis_kelamin" class="form-select mt-2" id="jenis_kelamin" autocomplete="off" required>
                            <option hidden></option>
                            <option value="Lelaki">Lelaki</option>
                            <option value="Perempuan">Perempuan</option>
                        </select>
                    </div>
                    <div class="form-group mt-2 ">
                        <button type="submit" class="btn btn-outline-dark mt-2 w-100" name="daftar">Daftar</button>
                        <button type="submit" class="btn btn-outline-dark mt-2 w-100" style="display: none;" id="btn-seller">Daftar Admin wkwk</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function btnAdmin() {
        const btnSeller = document.getElementById("btn-seller");
        if (btnSeller.style.display === "block") {
            btnSeller.style.display = "none";
        } else {
            btnSeller.style.display = "block";
        }
    }
</script>

<?php require('../partials/footer.php'); ?>