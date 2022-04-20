<?php
include('dbconfig.php');
	if(isset($_POST['btn_login'])){

		$username=$_POST['username'];
		$password=$_POST['password'];
		// print($username);
		// print($password);
		$query_sid="select * from tbl_login where u_id ='$username'";
		$query_get_sid=mysqli_query($connection,$query_sid);
		$row=mysqli_fetch_array($query_get_sid);
		// if (!$query_get_sid) {
	 //    printf("Error: %s\n", mysqli_error($connection));
	 //    exit();
		// }
		$pass=$row['u_pwd'];
		$role=$row['role'];
		echo $pass;
		echo $role;
		if($password == $pass){
			if($role=="admin"){
				header('location:back.php');
			}
		}


		}

		if (isset($_POST['btn_addrel'])) {

			$email=$_POST['email'];
			$relation=$_POST['relation'];
			$contact=$_POST['contact'];

			$query1_data="insert into tbl_orginfo(o_id,o_email,contact,relation) values('2','$email','$contact','$relation')";
			$query1_ex=mysqli_query($connection,$query1_data);

			header('location:table-basic.php');


			}


?>
<?php

if (isset($_POST['btn_test'])) {
	$command=escapeshellcmd('tt.py');
	shell_exec($command);
	header('location:test.php');
}
?>