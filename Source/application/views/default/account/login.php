<div class="row">
    <div class="col-md-6">
        <form method="post" action="<?php echo base_url('account/login'); ?>">
            <h3>Log into your account</h3>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Email address" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Password" class="form-control" />
            </div>
            <button type="suubmit" class="btn btn-primary">Log in</button> <a href="<?php echo base_url('account/retrieve'); ?>">Forgot password?</a>
        </form>
    </div>
    <div class="col-md-6">
        <h3>Create an account</h3>
        <p class="alert bg-info">Don't have an account? Nothing to worry. Sign up below. It takes only few minutes.</p>
        <form method="post" action="<?php echo base_url('account/signup'); ?>" class="form-inline">
            <div class="form-group">
                <label for="signup_email">Email</label>
                <input type="email" name="email" id="signup_email" placeholder="Valid email address" class="form-control" />
            </div>
            <button type="submit" class="btn btn-success">Sign up</button>
        </form>
    </div>
</div>