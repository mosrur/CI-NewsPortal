<div class="row">
	<div class="col-md-12">
		<h3>Manage account</h3>
		<form method="post" action="<?php echo base_url('account'); ?>">
			<div class="form-group">
				<label for="signup_email">Email</label>
				<input type="email" name="email" id="signup_email" value="<?php echo $data['user']->email; ?>" readonly aria-readonly="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" name="password" id="password" placeholder="Leave empty to keep unchanged" class="form-control" />
			</div>
			<div class="form-group">
				<label for="conf_password">Confirm password</label>
				<input type="password" name="conf_password" id="conf_password" placeholder="As above" class="form-control" />
			</div>
			<div class="form-group">
				<label for="first_name">First name</label>
				<input type="text" name="first_name" id="first_name" value="<?php echo (isset($data['profile']->first_name)?$data['profile']->first_name:''); ?>" placeholder="Your first name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="last_name">Last name</label>
				<input type="text" name="last_name" id="last_name" value="<?php echo (isset($data['profile']->last_name)?$data['profile']->last_name:''); ?>" placeholder="Your family name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="display_name">Display name</label>
				<input type="text" name="display_name" id="display_name" value="<?php echo (isset($data['profile']->display_name)?$data['profile']->display_name:''); ?>" placeholder="Name you want to show publicly" class="form-control" />
			</div>
			<div class="form-group">
				<label for="gravatar_email">Gravatar email</label>
				<input type="text" name="gravatar_email" id="gravatar_email" value="<?php echo (isset($data['profile']->gravatar_email)?$data['profile']->gravatar_email:$data['user']->email); ?>" placeholder="Gravatar account email address" class="form-control" /> <br />
				<img src="<?php echo get_gravatar(isset($data['profile']->gravatar_email)?$data['profile']->gravatar_email:$data['user']->email); ?>" class="img-responsive" />
			</div>

			<input type="hidden" name="iduser" id="iduser" value="<?php echo $data['user']->iduser; ?>" />
			<input type="hidden" name="idprofile" id="idprofile" value="<?php echo (isset($data['profile']->idprofile)?$data['profile']->idprofile:''); ?>" />

			<button type="submit" class="btn btn-primary">Update profile</button>
		</form>
	</div>
</div>