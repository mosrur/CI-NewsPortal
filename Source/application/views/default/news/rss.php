<?php  echo '<?xml version="1.0" encoding="' . $data['encoding'] . '"?>' . "\n"; ?>
<rss version="2.0"
     xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
     xmlns:admin="http://webns.net/mvcb/"
     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:content="http://purl.org/rss/1.0/modules/content/">

	<channel>

		<title>News Portal RSS Feed</title>

		<link><?php echo $data['feed_url']; ?></link>
		<description>A community news portal</description>
		<dc:language>en</dc:language>
		<dc:creator>info@newsporta.com</dc:creator>

		<dc:rights>Copyright <?php echo gmdate("Y", time()); ?></dc:rights>
		<admin:generatorAgent rdf:resource="http://www.newsportal.com/" />

		<?php foreach($data['news'] as $news): ?>

			<item>

				<title><?php echo xml_convert($news->title); ?></title>
				<link><?php echo base_url('news/detail/' . $news->idpost) ?></link>
				<guid><?php echo base_url('news/detail/' . $news->idpost) ?></guid>

				<description><![CDATA[ <?php echo character_limiter($news->body, 200); ?> ]]></description>
				<pubDate><?php echo date('r', strtotime($news->add_date)); ?></pubDate>
			</item>


		<?php endforeach; ?>

	</channel>
</rss>