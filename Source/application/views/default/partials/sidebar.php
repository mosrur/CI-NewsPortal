<h3>Recent News</h3>
<?php
$posts = get_posts(5);
if($posts):
    foreach($posts as $post):
?>
<ul class="recent">
    <li>
        <i class="fa fa-fw fa-newspaper-o"></i>
        <a href="<?php echo base_url('news/detail/' . $post->idpost); ?>">
            <?php echo $post->title; ?>
        </a>
    </li>
</ul>
<?php
    endforeach;
endif;
?>