<div class="featured">
  <div class="featured-heading"><?php echo $heading_title; ?></div>
  <div class="featured-content">
    <div class="featured-box">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
  </div>
  <script type="text/javascript" src="//vk.com/js/api/openapi.js?101"></script>

<!-- VK Widget -->
<div id="vk_groups"></div>
<script type="text/javascript">
VK.Widgets.Group("vk_groups", {mode: 0, width: "220", height: "100", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 59753560);
</script>

</div>