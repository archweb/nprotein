</div>
<div id="footer">
<div id="info">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
      <li><a href="./news">Новости</a></li>
    </ul>
  </div>  
  <div class="column">
    <h3>Подписываемся</h3>
    <ul>
      <li><a href="http://vk.com/nprotein">Вконтакте</a></li>
      <li><a href="http://facebook.com/nprotein">Facebook</a></li>
      <li><a href="http://youtube.com/nprotein">YouTube</a></li>
    </ul>
  </div>
  <div class="column">
    <h3>Пишем</h3>
    <ul class="nbul">
      <li>Skype: nprotein</li>
      <li>E-mail: info@nprotein.com</li>
      <li><a href="./contact">Через форму на сайте</a></li>
    </ul>
  </div>
  <div class="column">
    <h3>Звоним</h3>
    <ul class="nbul">
      <li>(093)617-23-55</li>
      <li>(067)847-03-63</li>
      <li>(095)595-67-83</li>
    </ul>
  </div>
<div id="powered"><a href="http://nprotein.com">Наш протеин</a> &copy; <?php echo date( 'Y' ); ?></div>

</div>
</div>
<div class="counter"><script async="async" src="https://w.uptolike.com/widgets/v1/zp.js?pid=1264860" type="text/javascript"></script>
  <!--LiveInternet counter--><script type="text/javascript"><!--
    document.write("<a href='//www.liveinternet.ru/click' "+
            "target=_blank><img src='//counter.yadro.ru/hit?t38.6;r"+
            escape(document.referrer)+((typeof(screen)=="undefined")?"":
            ";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
                    screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
            ";"+Math.random()+
            "' alt='' title='LiveInternet' "+
            "border='0' width='31' height='31'><\/a>")
    //--></script><!--/LiveInternet-->
</div>
</body></html>