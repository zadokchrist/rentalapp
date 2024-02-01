<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `unit_list` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<div class="container-fluid">
	<form action="" id="unit-form">
		<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="unit_number" class="control-label">Unit Number</label>
			<input type="text" id="unit_number" name="unit_number" class="form-control rounded-0"  value="<?php echo isset($unit_number) ? $unit_number : ''; ?>" disabled required>
		</div>
		<div class="form-group">
			<label for="description" class="control-label">Description</label>
			<textarea name="description" id="" cols="30" rows="3" class="form-control form no-resize summernote" disabled><?php echo isset($description) ? $description : ''; ?></textarea>
		</div>
		<div class="form-group">
			<label for="status" class="control-label">Status</label>
			<select name="status" id="status" class="custom-select selevt" disabled>
			<option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Available</option>
			<option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Unavailable</option>
			<option value="2" <?php echo isset($status) && $status == 2 ? 'selected' : '' ?>>Under Maintenance</option>
			</select>
		</div>
		
	</form>
</div>