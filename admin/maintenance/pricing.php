<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Price List</h3>
		<div class="card-tools">
			<a href="javascript:void(0)" id="create_new" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Add New</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-hover table-striped">
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="bg-navy disabled">
						<th>#</th>
						<th>Date Updated</th>
						<th>Unit #</th>
						<th>Monthly</th>
						<th>Quarterly</th>
						<th>Annually</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
						$qry = $conn->query("SELECT p.*,u.unit_number from `price_list` p inner join `unit_list` u on p.unit_id = u.id  order by u.`unit_number` asc ");
						if(isset($conn->error) && !empty($conn->error))
						echo $conn->error;
						while($row = $qry->fetch_assoc()):
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo date("Y-m-d H:i",strtotime($row['date_updated'])) ?></td>
							<td><?php echo $row['unit_number'] ?></td>
							<td class="text-center"><?php echo number_format($row['monthly']) ?></td>
							<td class="text-center"><?php echo number_format($row['quarterly']) ?></td>
							<td class="text-center"><?php echo number_format($row['annually']) ?></td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon py-0" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item edit_data" href="javascript:void(0)" data-id="<?php echo $row['unit_id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['unit_id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                  </div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this Unit Pricing permanently?","delete_category",[$(this).attr('data-id')])
		})
		$('#create_new').click(function(){
			uni_modal("<i class='fa fa-plus'></i> Add Unit Pricing","maintenance/manage_pricing.php")
		})
		$('.edit_data').click(function(){
			uni_modal("<i class='fa fa-edit'></i> Edit Unit Pricing","maintenance/manage_pricing.php?id="+$(this).attr('data-id'))
		})
		$('.table th,.table td').addClass('px-1 py-0 align-middle')
		$('.table').dataTable();
	})
	function delete_category($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_pricing",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>