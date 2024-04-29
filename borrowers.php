<?php include 'db_connect.php' ?>

<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<large class="card-title">
					<b>Borrower List</b>
				</large>
				<button class="btn btn-primary col-md-3 float-right" type="button" id="new_borrower"><i class="fa fa-plus"></i> New Borrower</button>
			</div>
			<div class="card-body">
				<table class="table table-bordered" id="borrower-list">
					<colgroup>
						<col width="5%">
						<col width="40%">
						<col width="30%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">Borrower</th>
							<th class="text-center">Current Loan</th>
							<th class="text-center">Next Payment Schedule</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$i = 1;
							$qry = $conn->query("SELECT * FROM borrowers order by id desc");
							while($row = $qry->fetch_assoc()):

						 ?>
						 <tr>
						 	
						 	<td class="text-center"><?php echo $i++ ?></td>
						 	<td>
						 		<p>Name :<b><?php echo ucwords($row['lastname'].", ".$row['firstname'].' '.$row['middlename']
								) ?></b></p>

						 		<p>Address :<b><?php echo $row['address']." ".$row['province'].""
								.$row['distict']."".$row['commune']
								.$row['village']."".$row['occu']."".$row['revenue']
								?></b></p>
						 		<p>information # :<b><?php echo $row['phone'].", ".$row['photo'].' '.$row['map']  ?></b></p>
						 		<p>Contact # :<b><?php echo $row['contact_no'] ?></b></p>

								 <p>Gender # :<b><?php echo $row['gender'] ?></b></p>
								 <p>Date of Brirth # :<b><?php echo $row['date_of_birth'] ?></b></p>
								 <p>marital_status # :<b><?php echo $row['marital_status'] ?></b></p>
								 <p>id_type # :<b><?php echo $row['id_type'] ?></b></p>
								 <p>id_number # :<b><?php echo $row['id_number'] ?></b></p>
						 		<p>Email :<b><?php echo $row['email'] ?></b></p>
						 		<p>Tax ID :<b><?php echo $row['tax_id'] ?></b></p>
						 		
						 	</td>
						 	<td class="text-center">None</td>
						 	<td class="text-center">N/A</td>
						 	<td class="text-center">
						 			<button class="btn btn-primary edit_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
						 			<button class="btn btn-danger delete_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash"></i></button>
						 	</td>

						 </tr>

						<?php endwhile; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<style>
	td p {
		margin:unset;
	}
	td img {
	    width: 8vw;
	    height: 12vh;
	}
	td{
		vertical-align: middle !important;
	}
</style>	
<script>
	$('#borrower-list').dataTable()
	$('#new_borrower').click(function(){
		uni_modal("New borrower","manage_borrower.php",'mid-large')
	})
	$('.edit_borrower').click(function(){
		uni_modal("Edit borrower","manage_borrower.php?id="+$(this).attr('data-id'),'mid-large')
	})
	$('.delete_borrower').click(function(){
		_conf("Are you sure to delete this borrower?","delete_borrower",[$(this).attr('data-id')])
	})
function delete_borrower($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_borrower',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("borrower successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>