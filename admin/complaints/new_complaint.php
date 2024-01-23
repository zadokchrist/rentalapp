<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `tenants` where id = '{$_GET['id']}' ");
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
<form action="" id="complaint-form">
   <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
   <div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="unit_id" class="control-label">Storage Unit</label>
                <select name="unit_id" id="unit_id" class="form-control form-control-sm rounded-0 select2" required <?php echo isset($unit_id) ? "readonly" : ""  ?>>
                    <option value="" disabled <?php echo !isset($unit_id) ? "selected" : '' ?>></option>
                    <?php 
                    $unit = $conn->query("SELECT * FROM unit_list order by unit_number asc");
                    while($row = $unit->fetch_assoc()):
                        ?>
                        <option value="<?php echo $row['id'] ?>" <?php echo isset($unit_id) && $unit_id == $row['id'] ? "selected" : ""  ?>><?php echo $row['unit_number'] ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="Priority" class="control-label">Priority</label>
                <select name="Priority" id="Priority" class="form-control rounded-0" required>
                    <option value="High" <?php echo isset($priority) && $priority =="" ? "selected": "High" ?> >High</option>
                    <option value="Medium" <?php echo isset($priority) && $priority =="" ? "selected": "Medium" ?>>Medium</option>
                    <option value="Low" <?php echo isset($priority) && $priority =="" ? "selected": "Low" ?>>Low</option>
                </select>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group row px-2">
            <label for="subject" class="control-label col-md-4">Subject</label>
            <input type="text" name="subject" id="subject" class="form-control rounded-0" value="<?php echo isset($subject) ? $subject :"" ?>" required>
        </div>
            <div class="form-group">
                <label for="address" class="control-label">Details of the complaint</label>
                <textarea rows="3" name="compdet" id="compdet" class="form-control rounded-0" required><?php echo isset($compdet) ? $compdet :"" ?></textarea>
            </div>
        </div>
    </div>
</div>
</form>
<script>
    $(function(){
        $('#complaint-form').submit(function(e){
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
                alert('error');
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