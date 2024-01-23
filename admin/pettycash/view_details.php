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
    #uni_modal .modal-footer{
        display:none
    }
</style>
<div class="container fluid">
    <callout class="callout-primary">
        <dl class="row">
            <dt class="col-md-4">Transaction Date</dt>
            <dd class="col-md-8">: <?php echo $DateOfExpenditure ?></dd>
            <dt class="col-md-4">Transaction Details</dt>
            <dd class="col-md-8">: <?php echo $DetailsOfExpenditure ?></dd>
            <dt class="col-md-4">Amount</dt>
            <dd class="col-md-8">: <?php echo $Amount ?></dd>
            <dt class="col-md-4">Balance</dt>
            <dd class="col-md-8">: <?php echo $Balance ?></dd>
        </dl>
    </callout>
    <div class="row px-2 justify-content-end">
        <div class="col-1">
            <button class="btn btn-dark btn-flat btn-sm" type="button" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>