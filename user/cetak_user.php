<?php 
session_start();
  include "../lib/koneksi.php";
  $session_user = $_SESSION['user']; 
  $tampilpeserta = mysqli_query($mysqli, "SELECT Email, NISN, Nama, Nama_Jurusan, Jenis_Kelamin, Tanggal_Lahir, Alamat, Asal_Sekolah, Nilai_UN, Nilai_Akhir FROM peserta p join jurusan j on p.Id_Jurusan = j.Id_Jurusan where No_Pendaftaran = '$session_user'");
  $peserta = mysqli_fetch_assoc($tampilpeserta);
  if(isset($_SESSION['user']))
  {
    
?>

<!DOCTYPE html>
<html>
<head>
	<title>Bukti Pendaftaran <?php echo $session_user; echo $peserta['Nama']; ?></title>
</head>
<body>

	<center>
		<h2>Sekolah Menengah Kejuruan Negeri 2 Adiwerna</h2>
		<h6>Jl. Anggrek Ujungusi RT. 30/RW. 03, Ujungrusi, Adiwerna, Kwaden, Ujungrusi, Tegal, Jawa Tengah 52415</h6>
	</center>
	<hr>
	<br/>

	<center>
		<h3>Bukti Pendaftaran Calon Peserta Didik</h3>

		<table border="0">
			<tr>
				<td>No Pendaftaran</td>
				<td>:</td>
				<td><?php echo $session_user; ?></td>
			</tr>
			<tr>
				<td>Email</td>
				<td>:</td>
				<td><?php echo $peserta['Email']; ?></td>
			</tr>
			<tr>
				<td>NISN</td>
				<td>:</td>
				<td><?php echo $peserta['NISN']; ?></td>
			</tr>
			<tr>
				<td>Jurusan</td>
				<td>:</td>
				<td><?php echo $peserta['Nama_Jurusan']; ?></td>
			</tr>
			<tr>
				<td>Nama</td>
				<td>:</td>
				<td><?php echo $peserta['Nama']; ?></td>
			</tr>
			<tr>
				<td>Jenis Kelamin</td>
				<td>:</td>
				<td>
					<?php
                        if ($peserta['Jenis_Kelamin'] == 'L') {
                            echo "Laki-Laki";
                        }
                        else{
                            echo "Perempuan";
                        }
                    ?>
				</td>
			</tr>
			<tr>
				<td>Tanggal Lahir</td>
				<td>:</td>
				<td>
					<?php 
                        $originalDate = $peserta['Tanggal_Lahir'];
                        $newDate = date("d-m-Y", strtotime($originalDate));
                        echo $newDate;
                    ?>
				</td>
			</tr>
			<tr>
				<td>Alamat</td>
				<td>:</td>
				<td><?php echo $peserta['Alamat']; ?></td>
			</tr>
			<tr>
				<td>Asal Sekolah</td>
				<td>:</td>
				<td><?php echo $peserta['Asal_Sekolah']; ?></td>
			</tr>
			<tr>
				<td>Nilai Ujian Nasional</td>
				<td>:</td>
				<td><?php echo $peserta['Nilai_UN']; ?></td>
			</tr>
		</table>

	</center>
	

	<script>
		window.print();
		window.location='../user';
	</script>
	
</body>
</html>

<?php 
	}
	else{
		header("location: ../login/");
	}
 ?>