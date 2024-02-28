<?php if($_settings->chk_flashdata('success')): ?>
	<script>
		alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
	</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">Collections Per Month</h3>
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
							<th>#</th>
							<th>Month</th>
							<th>Number of Payments</th>
							<th>Total Transaction Value</th>
							<th>Total Outstanding</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$i = 1;
						$qry = $conn->query("SELECT 
							DATE_FORMAT(cp.RecordDate, '%M') AS MonthName,
							COUNT(cp.TransactionId) AS NumberOfPayments,
							SUM(cp.Amount) AS TotalTransactionValue,
							(SUM(rl.billing_amount) - SUM(cp.Amount)) AS OutstandingBalance
							FROM 
							customerpayments cp
							INNER JOIN 
							rent_list rl ON cp.Tenant_Id = rl.tenant_id
							WHERE 
							MONTH(cp.RecordDate) = MONTH(rl.date_end)
							GROUP BY 
							MONTH(cp.RecordDate); ");
						while($row = $qry->fetch_assoc()):
							?>
							<tr>
								<td class="text-center"><?php echo $i++; ?></td>
								<td><?php echo $row['MonthName'] ?></td>
								<td><?php echo $row['NumberOfPayments'] ?></td>
								<td><?php echo $row['TotalTransactionValue'] ?></td>
								<td><?php echo $row['OutstandingBalance'] ?></td>
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