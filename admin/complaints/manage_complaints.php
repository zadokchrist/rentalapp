<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `complaints` where Complaintid = '{$_GET['id']}' ");
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
     <input type="hidden" name="id" value="<?php echo isset($ComplaintId) ? $ComplaintId : '' ?>">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="subject" class="control-label">Subject</label>
                    <input type="text" name="subject" id="subject" class="form-control rounded-0" value="<?php echo isset($Subject) ? $Subject :"" ?>" required>
                </div>
                <div class="form-group">
                    <label for="Status" class="control-label">Status</label>
                    <select name="Status" id="Status" class="form-control rounded-0" required>
                        <option value="" >Please Select Status</option>
                        <option value="Unresolved" <?php echo isset($Status) && $Status =="" ? "selected": "Unresolved" ?>>Unresolved</option>
                        <option value="Resolved" <?php echo isset($Status) && $Status =="" ? "selected": "Resolved" ?> >Resolved</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="compdet" class="control-label">Details of Complaint</label>
                    <textarea rows="3" name="compdet" id="compdet" class="form-control rounded-0" required><?php echo isset($compdet) ? $compdet :"" ?></textarea>
                </div>
            </div>
            <div class="col-md-6">
                
                <div class="form-group">
                    <label for="id_type" class="control-label">Resolution</label>
                    <textarea rows="3" name="Resolution" id="Resolution" class="form-control rounded-0" required><?php echo isset($Resolution) ? $Resolution :"" ?></textarea>
                </div>
                <div class="form-group">
                    <label for="ResolutionTime" class="control-label">Date Resolved</label>
                    <input type="date" name="ResolutionTime" id="ResolutionTime" class="form-control rounded-0" value="<?php echo isset($ResolutionTime) ? $ResolutionTime :"" ?>" required>
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
				url:_base_url_+"classes/Master.php?f=save_complaint",
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