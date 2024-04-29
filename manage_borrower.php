<?php include 'db_connect.php' ?>
<?php 

if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM borrowers where id=".$_GET['id']);
	foreach($qry->fetch_array() as $k => $val){
		$$k = $val;
	}
}

?>
<div class="container-fluid">
	<div class="col-lg-12">
		<form id="manage-borrower">
			<input type="hidden" name="id" value="<?php echo isset($_GET['id']) ? $_GET['id'] : '' ?>">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="" class="control-label">Name Khmer</label>
						<input name="lastname" class="form-control" required="" value="<?php echo isset($lastname) ? $lastname : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Name English</label>
						<input name="firstname" class="form-control" required="" value="<?php echo isset($firstname) ? $firstname : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">nickName</label>
						<input name="middlename" class="form-control" value="<?php echo isset($middlename) ? $middlename : '' ?>">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="" class="control-label">Gender</label>
						<select class="col-12 p-2" name="gender" id="gender" class="form-control" required="" value="<?php echo isset($gender) ? $gender : '' ?>">
                           <option value="Other">Other</option>
                           <option value="Male">Male</option>
                           <option value="Famale">Famale</option>
                       </select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Date of Brirth</label>
						<input type="date" name="date_of_birth" class="form-control" required="" value="<?php echo isset($date_of_birth) ? $date_of_birth : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Marital Status</label>	
						<select class="col-12 p-2" name="marital_status" id="marital_status" class="form-control" value="<?php echo isset($marital_status) ? $marital_status : '' ?>">
                            <option value="Other">Other</option>
                            <option value="signle">signle</option>
                            <option value="Married">Married</option>
                            <option value="Divorced">Divorced</option>
                            <option value="Cahabiting">Cahabiting</option>
                        </select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="" class="control-label">ID Type</label>
						<select class="col-12 p-2 " name="id_type" id="id_type" class="form-control" required="" value="<?php echo isset($id_type) ? $id_type : '' ?>">
                          <option value="NationalID">National ID</option>
                          <option value="Driver">Driver</option>
                          <option value="Passpor">Passpor</option>
                       </select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">ID Number</label>
						<input name="id_number" class="form-control" required="" value="<?php echo isset($id_number) ? $id_number : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Address</label>
						<input name="address" class="form-control" value="<?php echo isset($address) ? $address : '' ?>">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="" class="control-label">Province</label>
						<input name="province" class="form-control" required="" value="<?php echo isset($province) ? $province : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Distict</label>
						<input name="distict" class="form-control" required="" value="<?php echo isset($distict) ? $distict : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Commune</label>
						<input name="commune" class="form-control" value="<?php echo isset($commune) ? $commune : '' ?>">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="" class="control-label">Village</label>
						<input name="village" class="form-control" required="" value="<?php echo isset($village) ? $village : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Phone</label>
						<input name="phone" class="form-control" required="" value="<?php echo isset($phone) ? $phone : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Occupation</label>
						<input name="occu" class="form-control" value="<?php echo isset($occu) ? $occu : '' ?>">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="" class="control-label">Revenue</label>
						<input name="revenue" class="form-control" required="" value="<?php echo isset($phone) ? $phone : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Photo</label>	
						<input type="file" name="photo" class="form-control" required="" value="<?php echo isset($photo) ? $photo : '' ?>">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="">Map</label>
						<input type="file" name="map" class="form-control" value="<?php echo isset($map) ? $map : '' ?>">
					</div>
				</div>
			</div>

			<div class="row form-group">
				
				<div class="col-md-4">
					<div class="">
						<label for="">Contact #</label>
						<input type="text" class="form-control" name="contact_no" value="<?php echo isset($contact_no) ? $contact_no : '' ?>">
					</div>
				</div>
			
				<div class="col-md-4">
							<label for="">Email</label>
							<input type="email" class="form-control" name="email" value="<?php echo isset($email) ? $email : '' ?>">
				</div>
				<div class="col-md-4">
					<div class="">
						<label for="">Tax ID</label>
						<input type="text" class="form-control" name="tax_id" value="<?php echo isset($tax_id) ? $tax_id : '' ?>">
					</div>
				</div>
				
			</div>
		</form>
	</div>
</div>

<script>
	 $('#manage-borrower').submit(function(e){
	 	e.preventDefault()
	 	start_load()
	 	$.ajax({
	 		url:'ajax.php?action=save_borrower',
	 		method:'POST',
	 		data:$(this).serialize(),
	 		success:function(resp){
	 			if(resp == 1){
	 				alert_toast("Borrower data successfully saved.","success");
	 				setTimeout(function(e){
	 					location.reload()
	 				},1500)
	 			}
	 		}
	 	})
	 })
</script>