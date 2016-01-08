<?php
if(isset($data['alerts']) && is_array($data['alerts'])) {
    foreach($data['alerts'] as $type => $alerts) {
?>
        <div class="alert alert-<?php echo $type; ?>">
            <?php if(is_array($alerts)) { ?>
                <?php echo '<p>' . implode('</p><p>', $alerts) . '</p>'; ?>
            <?php } else { ?>
                <?php echo '<p>' . $alerts . '</p>'; ?>
            <?php } ?>
        </div>
<?php
    }
}
if(validation_errors()) {
?>
    <div class="alert alert-danger">
        <?php echo validation_errors('<p>', '</p>'); ?>
    </div>
<?php
}