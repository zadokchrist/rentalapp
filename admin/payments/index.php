<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Payments</h3>
		<!-- <div class="card-tools">
			<a href="javascript:void(0)" id="create_new" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Register New</a>
		</div> -->
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-hover table-striped">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="25%">
					<col width="15%">
					<!-- <col width="20%"> -->
					<!-- <col width="15%"> -->
				</colgroup>
				<thead>
					<tr class="bg-navy disabled">
						<th>Transaction Id</th>
						<th>Transaction Date</th>
						<th>Channel of Payment</th>
						<th>Tenant Name</th>
						<th>Amount #</th>
						<!-- <th>Balance</th> -->
						<!-- <th>Action</th> -->
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
					$qry = $conn->query("SELECT `TransactionId`, `TransactionDate`, `PaymentChannel`, t.fullname as TenantName, `Amount` FROM `customerpayments` cp inner join tenants t on cp.Tenant_Id=t.id  ");
					while($row = $qry->fetch_assoc()):
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo date("Y-m-d",strtotime($row['TransactionDate'])) ?></td>
							<td><?php echo $row['PaymentChannel'] ?></td>
							<td><?php echo $row['TenantName'] ?></td>
							<td class='truncate-3'><?php echo $row['Amount'] ?></td>
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
			_conf("Are you sure to delete this Transaction permanently?","delete_product",[$(this).attr('data-id')])
		})
		$('#create_new').click(function(){
			uni_modal("<i class='fa fa-plus'></i> Register New Transaction","pettycash/manage_pettycash.php","mid-large")
		})
		$('.view_data').click(function(){
			uni_modal("<i class='fa fa-info-circle'></i> Transaction's Details","pettycash/view_details.php?id="+$(this).attr('data-id'),"")
		})
		$('.edit_data').click(function(){
			uni_modal("<i class='fa fa-edit'></i> Edit Transaction's Details","pettycash/manage_pettycash.php?id="+$(this).attr('data-id'),"mid-large")
		})
		$('.table th,.table td').addClass('px-1 py-0 align-middle')
		$('.table').dataTable();
	})
	function delete_product($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_pettycash",
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