<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `agencies` where id = '{$_GET['id']}' ");
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
     <input type="hidden" name="id" value="<?php echo isset($Id) ? $Id : '' ?>">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="AgencyName" class="control-label">AgencyName</label>
                    <input type="text" name="AgencyName" id="AgencyName" class="form-control rounded-0" value="<?php echo isset($AgencyName) ? $AgencyName :"" ?>" required>
                </div>
                <div class="form-group">
                    <label for="contact" class="control-label">Contact</label>
                    <input type="text" name="Contact" id="Contact" class="form-control rounded-0" value="<?php echo isset($Contact) ? $Contact :"" ?>" required>
                </div>
                <div class="form-group">
                    <label for="status" class="control-label"> Status</label>
                    <select name="status" id="status" class="form-control rounded-0" required>
                        <option value="" selected>Please Status</option>
                        <option value="Active" <?php echo isset($Status) && $Status =="" ? "selected": "Active" ?> >Active</option>
                        <option value="Terminated" <?php echo isset($Status) && $Status =="" ? "selected": "Passport" ?>>Terminated</option>
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="address" class="control-label">Address</label>
                    <textarea rows="3" name="address" id="address" class="form-control rounded-0" required><?php echo isset($Address) ? $Address :"" ?></textarea>
                </div>
                <div class="form-group">
                    <label for="Location" class="control-label">Locality</label>
                    <input type="text" name="Location" id="Location" class="form-control rounded-0" value="<?php echo isset($Location) ? $Location :"" ?>" required>
                </div>
                <div class="form-group">
                    <label for="id_no" class="control-label"> Agreement</label>
                    <input type="file" class="form-control rounded-0" name="Agreement" />
                </div>
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
				url:_base_url_+"classes/Master.php?f=save_agency",
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