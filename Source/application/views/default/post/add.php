<div class="row">
	<div class="col-md-12">
		<h3>Add new post</h3>
		<form method="post" action="<?php echo base_url('post/add'); ?>" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title</label>
				<input type="text" name="title" id="title" placeholder="News title" value="<?php echo set_value('title'); ?>" class="form-control" />
			</div>
			<div class="form-group">
				<label for="category">Category</label>
				<select name="category" id="category" class="form-control">
					<?php foreach($data['categories'] as $category): ?>
						<option value="<?php echo $category->idcategory; ?>" <?php echo set_select('category', $category->idcategory); ?>><?php echo $category->title; ?></option>
					<?php endforeach; ?>
				</select>
			</div>
			<div class="form-group">
				<label for="image">Image</label>
				<input type="file" name="image" id="image" class="form-control" placeholder="Upload an image" />
			</div>

			<div class="form-group">
				<label for="body">Post detail</label>
				<textarea name="body" id="body" class="form-control" placeholder="Provide news content. Basic HTML is allowed."><?php echo set_value('body'); ?></textarea>
			</div>

			<div class="form-group">
				<label for="tags">Tags</label>
				<input type="text" name="tags" id="tags" value="<?php echo set_value('tags'); ?>" class="form-control" placeholder="Comma separated tags" />
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>