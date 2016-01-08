<div class="row">
	<div class="col-md-12">
		<h3>Confirm post delete</h3>
		<form method="post" action="<?php echo base_url('post/delete/' . $data['post']->idpost); ?>">
			<p class="alert alert-danger">
				Are you sure you want to delete the post <strong>"<?php echo $data['post']->title; ?>"</strong> permanently? This action cannot be undone.
			</p>
			<input type="hidden" name="do_delete" id="do_delete" value="1" />
			<input type="hidden" name="idpost" id="idpost" value="<?php echo $data['post']->idpost; ?>" />
			<button type="submit" class="btn btn-danger">Delete</button>
		</form>
	</div>
</div>