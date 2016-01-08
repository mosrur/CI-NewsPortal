<div class="row">
    <div class="col-md-12">
        <h3>Retrieve password</h3>
        <form method="post" action="<?php echo base_url('account/retrieve'); ?>">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Account email address" class="form-control" />
            </div>
            <button type="submit" class="btn btn-primary">Retrieve</button>
        </form>
    </div>
</div>