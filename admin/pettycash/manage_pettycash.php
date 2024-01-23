<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `pettycash` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=stripslashes($v);
        }
    }
}
?>
<style>
    span.select2-selection.select2-selection--single {
        border-radius: 0;
        padding: 0.25rem 0.5rem;
        padding-top: 0.25rem;
        padding-right: 0.5rem;
        padding-bottom: 0.25rem;
        padding-left: 0.5rem;
        height: auto;
    }
</style>
<form action="" id="tenant-form">
     <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="DateOfExpenditure" class="control-label">Date Of Expenditure</label>
                    <input type="date" name="DateOfExpenditure" id="DateOfExpenditure" class="form-control rounded-0" value="<?php echo isset($DateOfExpenditure) ? $DateOfExpenditure :"" ?>" required>
                </div>
                <div class="form-group">
                    <label for="gender" class="control-label">Details Of Expenditure  </label>
                    <textarea rows="3" name="DetailsOfExpenditure" id="DetailsOfExpenditure" class="form-control rounded-0" required><?php echo isset($DetailsOfExpenditure) ? $DetailsOfExpenditure :"" ?></textarea>
                </div>
                <div class="form-group">
                    <label for="dob" class="control-label">Amount</label>
                    <input type="number" name="Amount" id="Amount" class="form-control rounded-0" value="<?php echo isset($Amount) ? $Amount :"" ?>" required>
                </div>
                <div class="form-group">
                    <label for="contact" class="control-label">Balance</label>
                    <input type="text" name="Balance" id="Balance" class="form-control rounded-0" value="<?php echo isset($Balance) ? $Balance :"" ?>" required>
                </div>
            </div>
            <div class="col-md-6">
            </div>
        </div>
    </div>
</form>
<script>
    $(function(){
        $('#tenant-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_pettycash",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.reload();
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            $("html, body").animate({ scrollTop: 0 }, "fast");
                    }else{
						alert_toast("An error occured",'error');
                        console.log(resp)
					}
                    end_loader()
				}
			})
		})
	})
</script>