<?php echo '<?xml version="1.0"?>'; ?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<channel>
<title><?php echo $this->config->get('config_name');?></title>
<link><?php echo $url_self; ?></link>
<description><?php if (htmlspecialchars($description)=='') echo $this->config->get('config_meta_description'); else echo htmlspecialchars($description);?></description>
<language><?php echo $lang; ?></language>
<atom:link href="<?php echo $url_rss; ?>" rel="self" type="application/rss+xml" />
<?php
if (isset($records) && $records):
foreach ($records as $record):
?>
<item>
<title><?php echo $record['name']; ?></title>
<link><?php echo $record['href']; ?></link>
<description><?php echo htmlspecialchars(strip_tags(html_entity_decode($record['description'], ENT_QUOTES, 'UTF-8'))) ; ?></description>
<guid isPermaLink="false"><?php echo $record['record_id']; ?> at <?php echo $url_self; ?></guid>
<category><?php echo $record['blog_name']; ?></category>

<image><?php echo $record['thumb']; ?></image>

<pubDate><?php echo date('D, j M Y H:i:s', strtotime($record['datetime_available']))." GMT"; ?></pubDate>
</item>
<?php
endforeach;
endif;
?>
</channel>
</rss>