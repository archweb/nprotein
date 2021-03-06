<?php echo $header; ?>
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
</div>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="blog-heading_title">
	  <h1><?php echo $heading_title; ?></h1>
  </div>

    <?php if (isset ($settings_blog['view_rss']) && $settings_blog['view_rss'] ) { ?>
    <a href="<?php echo $url_rss; ?>" class="floatright"><img style="border: 0px;"  title="RSS" alt="RSS" src="/catalog/view/theme/<?php
			$template = '/image/rss24.png';
			if (file_exists(DIR_TEMPLATE . $theme . $template)) {
				$rsspath = $theme . $template;
			} else {
				$rsspath = 'default' . $template;
			}
			echo $rsspath;
?>"></a>
    <?php } ?>

  <?php if ($description) {
  ?>
  <div class="blog-info">
    <?php if ($thumb && $description) { ?>
    <div class="image blog-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <div class="blog-description">
    <?php echo $description; ?>
    </div>
    <?php } ?>
  </div>
  <?php } ?>

 <div class="blog-divider"></div>

  <?php if ($categories) { ?>
  <div class="blog-child_divider">&nbsp;</div>
  <h2 class="blog-refine_title"><?php echo $text_refine; ?>:</h2>
  <div class="blog-list" >
    <?php if (count($categories) <= 2) { ?>
    <ul>
      <?php foreach ($categories as $blog) { ?>
      <li>
      <?php if (isset($blog['thumb']) && $blog['thumb']!='') { ?>
      <img src="<?php echo $blog['thumb']; ?>">
	  <?php  } ?>
      <a href="<?php echo $blog['href']; ?>"><?php echo $blog['name']; ?></a>
      </li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 3); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li>

      <?php if (isset($categories[$i]['thumb']) && $categories[$i]['thumb']!='') { ?>
      <img src="<?php echo $categories[$i]['thumb']; ?>">
	  <?php  } ?>

      <a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?>&nbsp;(<?php echo $categories[$i]['total']; ?>)</a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>



	<div class="blog-child_divider">&nbsp;</div>
  <?php } ?>





  <?php if ($records) { ?>
  <div class="blog-record-list">
    <?php foreach ($records as $record) { ?>
    <div>
     

      
<div class="name marginbottom5">
    <?php if (isset ($record['settings']['category_status']) && $record['settings']['category_status'] ) { ?>
    <?php if (isset ($record['settings_blog']['category_status']) && $record['settings_blog']['category_status'] ) { ?>
    <a href="<?php echo $record['blog_href']; ?>" class="blog-title"><?php echo $record['blog_name']; ?></a><ins class="blog-arrow">&nbsp;&rarr;&nbsp;</ins>
    <?php } ?>
    <?php } ?>
	

    <a href="<?php echo $record['href']; ?>" class="blog-title"><?php echo $record['name']; ?></a>
     </div>
	 
	 
          	<div class="description record_description"><?php echo $record['description']; ?>
			<?php if ($record['thumb']) { ?>
      <div class="image blog-image"><a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a></div>
      <?php } ?>
			
          	</div>

     <div class="overflowhidden width100 lineheight1 bordernone">&nbsp;</div>
       <div class="blog-child_divider width100 bordernone">&nbsp;</div>
      <div class="blog-date_container">

    <?php if (isset ($record['settings_blog']['view_date']) && $record['settings_blog']['view_date'] ) { ?>
      <?php if ($record['date_available']) { ?>
        <div class="blog-date"><?php echo $record['date_available']; ?></div>
      <?php } ?>
    <?php } ?>

    <?php if (isset ($record['settings_blog']['view_rating']) && $record['settings_blog']['view_rating'] ) { ?>
      <?php if ($record['rating']) { ?>
      <div class="rating blog-rate_container">
      <img style="border: 0px;"  title="<?php echo $record['rating']; ?>" alt="<?php echo $record['rating']; ?>" src="/catalog/view/theme/<?php


			$template = '/image/blogstars-'.$record['rating'].'.png';
			if (file_exists(DIR_TEMPLATE . $theme . $template)) {
				$starpath = $theme . $template;
			} else {
				$starpath = 'default' . $template;
			}

			echo $starpath;

?>">

      </div>
      <?php } ?>
    <?php } ?>

    <?php if (isset ($record['settings_blog']['view_share']) && $record['settings_blog']['view_share'] ) { ?>
	  <div class="share blog-share_container"><!-- AddThis Button BEGIN -->

	  <div class="addthis_toolbox addthis_default_style "
        addthis:url="<?php echo $record['href']; ?>"
        addthis:title="<?php echo $record['name']; ?>"
        addthis:description="<?php echo strip_tags($record['description']); ?>">
          <a class="addthis_button_facebook"></a>
          <a class="addthis_button_vk"></a>
          <a class="addthis_button_odnoklassniki_ru"></a>
          <a class="addthis_button_twitter"></a>
          <a class="addthis_button_email"></a>
          <a class="addthis_button_compact"></a>
          </div>

          <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
          <!-- AddThis Button END -->
        </div>
    <?php } ?>

      <div class="blog-comment_container">
       <?php if (isset ($record['settings_blog']['view_comments']) && $record['settings_blog']['view_comments'] ) { ?>
	      <?php if ($record['settings_comment']['status']) { ?>
	      <div class="blog-comments"><?php echo $text_comments; ?> <?php echo $record['comments']; ?></div>
	      <?php } ?>
       <?php } ?>


    	<?php if (isset ($record['settings_blog']['view_viewed']) && $record['settings_blog']['view_viewed'] ) { ?>
	      <div class="blog-viewed"><?php echo $text_viewed; ?> <?php echo $record['viewed']; ?></div>
        <?php } ?>

      </div>
      <div class="lineheight1 overflowhidden">&nbsp;</div>
      </div>
 	<?php
	 if ($userLogged)  {
	?>
	<div class="blog-edit_container">
	   <a class="zametki" target="_blank" href="<?php echo $admin_path; ?>index.php?route=catalog/record/update&token=<?php echo $this->session->data['token']; ?>&record_id=<?php echo $record['record_id']; ?>"><?php echo $this->language->get('text_edit');?></a>
	 </div>
	<?php
	 }
	?>

  <div class="blog-child_divider">&nbsp;</div>
    </div>
    <?php } ?>
  </div>

    

  <div class="paginationblog margintop5"><?php echo $pagination; ?></div>
    <?php } ?>
  <?php if (!$categories && !$records) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?>

  </div>
<?php echo $footer; ?>