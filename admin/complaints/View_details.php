<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from complaints t  inner join unit_list  ut on t.Unit_id=ut.id where t.Complaintid='{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=stripslashes($v);
        }
    }
}
?>
<style>
    #uni_modal .modal-footer{
        display:none
    }
</style>
<div class="container fluid">
    <callout class="callout-primary">
        <dl class="row">
            <dt class="col-md-4">Subject</dt>
            <dd class="col-md-8">: <?php echo $Subject ?></dd>
            <dt class="col-md-4">Status</dt>
            <dd class="col-md-8">: <?php echo $Status ?></dd>
            <dt class="col-md-4">Storage Unit</dt>
            <dd class="col-md-8">: <?php echo $unit_number ?></dd>
            <dt class="col-md-4">Details of the complaint</dt>
            <dd class="col-md-8">: <?php echo $compdet ?></dd>
            <dt class="col-md-4">Date Created</dt>
            <dd class="col-md-8">: <?php echo $ComplaintDate ?></dd>
            <dt class="col-md-4">Date Resolved</dt>
            <dd class="col-md-8">: <?php echo $ResolutionTime ?></dd>
            <dt class="col-md-4">Resolution</dt>
            <dd class="col-md-8">: <?php echo $Resolution ?></dd>
        </dl>
    </callout>
    <div class="row px-2 justify-content-end">
        <div class="col-1">
            <button class="btn btn-dark btn-flat btn-sm" type="button" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>