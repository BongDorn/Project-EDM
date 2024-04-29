<?php include 'db_connect.php' ?>
<?php 

if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM co_borrowers where id=".$_GET['id']);
	foreach($qry->fetch_array() as $k => $val){
		$$k = $val;
	}
}

?>
<div class="container-fluid">
	<div class="col-lg-12">
		<form id="co_manage-borrower">
			<input type="hidden" name="id" value="<?php echo isset($_GET['id']) ? $_GET['id'] : '' ?>">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="" class="control-label">name_khmer</label>
						<input name="name_khmer" class="form-control" required="" value="<?php echo isset($name_khmer) ? $name_khmer : '' ?>">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="">Name English</label>
						<input name="name_english" class="form-control" required="" value="<?php echo isset($name_english) ? $name_english : '' ?>">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="">nick Name</label>
						<input name="nickname" class="form-control" value="<?php echo isset($nickname) ? $nickname : '' ?>">
					</div>
				</div>
                <div class="col-md-3">
					<div class="form-group">
						<label for="" class="control-label">Gender</label>
                        <select name="gender" class="form-control" required="" value="<?php echo isset($gender) ? $gender : '' ?>">
                            <option value="other">Other</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
					</div>
				</div>
			</div>

			<div class="row">
				
				<div class="col-md-3">
					<div class="form-group">
						<label for="" class="control-label">Date of Brirth</label>
                        <input type="date" name="date_of_birth" class="form-control" required="" value="<?php echo isset($date_of_birth) ? $date_of_birth : '' ?>">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="">Marital Status</label>
                        <select name="marital_status" class="form-control"  value="<?php echo isset($marital_status) ? $marital_status : '' ?>">
                            <option value="other">Other</option>
                            <option value="signle">signle</option>
                            <option value="window">window</option>
                        </select>					
					</div>
				</div>
                <div class="col-md-3">
					<div class="form-group">
						<label for="" class="control-label">ID Type</label>
                        <select name="id_type" class="form-control"  required="" value="<?php echo isset($id_type) ? $id_type : '' ?>">
                            <option value="other">Other</option>
                            <option value="passpor">Passpor</option>
                            <option value="nationalid">NationalID</option>
                        </select>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="">ID Number</label>
						<input name="id_number" class="form-control" required="" value="<?php echo isset($id_number) ? $id_number : '' ?>">
					</div>
				</div>
			</div>

			<div class="row">
                <div class="col-md-3">
					<div class="form-group">
						<label for="">Photo</label>
						<input name="photo" class="form-control" required="" value="<?php echo isset($photo) ? $photo : '' ?>">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="">Map</label>
						<input name="map" class="form-control" value="<?php echo isset($map) ? $map : '' ?>">
					</div>
				</div>
			   
                <div class="col-md-3">
                <div class="row form-group">	
                     <label for="">Email</label>
			         <input type="email" class="form-control" name="email" value="<?php echo isset($email) ? $email : '' ?>">
			   </div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="">Tax ID</label>
						<input type="text" class="form-control" name="tax_id" value="<?php echo isset($tax_id) ? $tax_id : '' ?>">
					</div>
				</div>
				
			</div>

			


			<div class="row">
            <div class="col-md-3">
					<div class="">
						<label for="">Contact #</label>
						<input type="text" class="form-control" name="contact_no" value="<?php echo isset($contact_no) ? $contact_no : '' ?>">
					</div>
				</div>
				
			</div>

			
		</form>
	</div>
</div>

<script>
	 $('#co_manage-borrower').submit(function(e){
	 	e.preventDefault()
	 	start_load()
	 	$.ajax({
	 		url:'ajax.php?action=save_co_borrower',
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