<?php include 'db_connect.php' ?>

<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<large class="card-title">
					<b>Co-Borrower List</b>
				</large>
				<button class="btn btn-primary col-md-3 float-right" type="button" id="new_co_borrower"><i class="fa fa-plus"></i> New Co-Borrower</button>
			</div>
			<div class="card-body">
				<table class="table table-bordered" id="co_borrower-list">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="30%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">Co-Borrower</th>
							<th class="text-center">Current Loan</th>
							<th class="text-center">Next Payment Schedule</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$i = 1;
							$qry = $conn->query("SELECT * FROM co_borrowers order by id desc");
							while($row = $qry->fetch_assoc()):

						 ?>
						 <tr>
						 	
						 	<td class="text-center"><?php echo $i++ ?></td>
						 	<td>
						 		<p>Name :<b><?php echo ucwords($row['name_khmer'].", ".$row['name_english'].','.$row['nickname']
								) ?></b></p>
                                <p>Gender # :<b><?php echo $row['gender'] ?></b></p>
								 <p>Date of Brirth # :<b><?php echo $row['date_of_birth'] ?></b></p>
								 <p>marital_status # :<b><?php echo $row['marital_status'] ?></b></p>
						 		<p>information # :<b><?php echo $row['phone'].", ".$row['photo'].' '.$row['map']  ?></b></p>
						 		 <p>Contact # :<b><?php echo $row['contact_no'] ?></b></p>
								 <p>id_type # :<b><?php echo $row['id_type'] ?></b></p>
								 <p>id_number # :<b><?php echo $row['id_number'] ?></b></p>
						 		<p>Email :<b><?php echo $row['email'] ?></b></p>
						 		<p>Tax ID :<b><?php echo $row['tax_id'] ?></b></p>
						 		
						 	</td>
						 	<td class="">None</td>
						 	<td class="">N/A</td>
						 	<td class="text-center">
						 			<button class="btn btn-primary edit_co_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
						 			<button class="btn btn-danger delete_co_borrower" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash"></i></button>
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
	$('#co_borrower-list').dataTable()
	$('#new_co_borrowers').click(function(){
		uni_modal("New_co_borrowers","co_manage_borrowers.php",'mid-large')
	})
	$('.edit_co_borrower').click(function(){
		uni_modal("Edit co_borrowers","co_manage_borrowers.php?id="+$(this).attr('data-id'),'mid-large')
	})
	$('.delete_co_borrowers').click(function(){
		_conf("Are you sure to delete this borrowers?","delete_co_borrowers",[$(this).attr('data-id')])
	})
function delete_co_borrower($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_co_borrowers',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("co_borrowers successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>