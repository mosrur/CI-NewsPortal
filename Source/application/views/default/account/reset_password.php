<div class="row">
    <div class="col-md-12">
        <h3>Set account password</h3>
        <form method="post" action="<?php echo base_url('account/reset/' . $data['key']); ?>">
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Password (min 6 characters)" class="form-control" />
            </div>
            <div class="form-group">
                <label for="conf_password">Confirm password</label>
                <input type="password" name="conf_password" id="conf_password" placeholder="Same as above" class="form-control" />
            </div>
            <input type="hidden" name="iduser" id="iduser" value="<?php echo $data['user']->iduser; ?>" />
            <input type="hidden" name="key" id="key" value="<?php echo $data['user']->code; ?>" />
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>