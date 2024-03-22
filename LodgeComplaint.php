<?php require_once('config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
<?php require_once('inc/header.php') ?>
<body class="hold-transition login-page">
  <script>
    start_loader()
  </script>
  <style>
    body{
      background-image: url("<?php echo validate_image($_settings->info('cover')) ?>");
      background-size:cover;
      background-repeat:no-repeat;
    }
    .login-title{
      text-shadow: 1px 1px black
    }
  </style>
  <h1 class="text-center text-light py-5 login-title"><b><?php echo $_settings->info('name') ?></b></h1>
  <div class="container card card-outline">
    <div class="card-header text-center">
      <a href="./" class="h1"><b>Register Complaint Here</b></a>
      <label id="message"></label>
    </div>
    <form class=" row g-3" id="complaint-form">
      <div class="col-md-6">
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
      <div class="col-md-6">
        <label for="subject" class="control-label col-md-4">Subject</label>
        <input type="text" name="subject" id="subject" class="form-control rounded-0" value="<?php echo isset($subject) ? $subject :"" ?>" required>
      </div>
      <div class="col-12">
        <label for="Priority" class="control-label">Priority</label>
        <select name="Priority" id="Priority" class="form-control rounded-0" required>
          <option value="High" <?php echo isset($priority) && $priority =="" ? "selected": "High" ?> >High</option>
          <option value="Medium" <?php echo isset($priority) && $priority =="" ? "selected": "Medium" ?>>Medium</option>
          <option value="Low" <?php echo isset($priority) && $priority =="" ? "selected": "Low" ?>>Low</option>
        </select>
      </div>
      <div class="col-12">
        <label for="address" class="control-label">Details of the complaint</label>
        <textarea rows="3" name="compdet" id="compdet" class="form-control rounded-0" required><?php echo isset($compdet) ? $compdet :"" ?></textarea>
      </div>
      <div class="col-12">
        <hr/>
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary">Register Complaint</button><br>
      </div>

    </form>
  </div>

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>

    <script>
      $(document).ready(function(){
        end_loader();
      })
    </script>
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
                  //location.reload();
                  $('#message').addClass("badge-success").text="Complaint Submitted successfull. Please wait and you will be contacted soon.";
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
  </body>
  </html>