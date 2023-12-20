<?php

include "../../lib/koneksi.php";

$id_jurusan=$_GET['id_jurusan'];
// Fungsi header dengan mengirimkan raw data excel
header("Content-type: application/vnd-ms-excel");

// Mendefinisikan nama file ekspor "hasil-export.xls"
if ($id_jurusan==0) {
    header("Content-Disposition: attachment; filename=Laporan_Pendaftar_Semua_Jurusan.xls");
}
else{
    header("Content-Disposition: attachment; filename=Laporan_Pendaftar_Jurusan_$id_jurusan.xls");
}
// Tambahkan table

?>
<table border="1">
    <thead>
        <tr>
            <th>No Pendaftaran</th>
            <th>NISN</th>
            <th>Nama</th>
            <th>Email</th>
            <th>Asal Sekolah</th>
        </tr>
    </thead>
    <tbody>
        <?php 
            $rank = 0;
            if ($id_jurusan==0) {
                $tampilpeserta = mysqli_query($mysqli, "SELECT * FROM peserta p join jurusan j on p.Id_Jurusan=j.Id_Jurusan");
            }
            else{
                $tampilpeserta = mysqli_query($mysqli, "SELECT * FROM peserta p join jurusan j on p.Id_Jurusan=j.Id_Jurusan where p.Id_Jurusan = $id_jurusan");
            }
            while($peserta = mysqli_fetch_array($tampilpeserta))
            {
                $rank = $rank + 1;
        ?>
        <tr>
            <td><?php echo $peserta['No_Pendaftaran']; ?></td>
            <td><?php echo $peserta['NISN']; ?></td>
            <td><?php echo $peserta['Nama']; ?></td>
            <td><?php echo $peserta['Email']; ?></td>
            <td><?php echo $peserta['Asal_Sekolah']; ?></td>
        </tr>
            <?php 
                }
            ?>
    </tbody>
</table>