<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xml>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:faq="urn:mkat:faq"
	exclude-result-prefixes="faq">

	<xsl:output method="html" encoding="UTF-8" indent="yes" version="5">
	</xsl:output>

	<xsl:template match="faq:category" mode="list">
		<li><xsl:value-of select="@label" />
		<ul>
			<xsl:apply-templates mode="list" />
		</ul>
		</li>
	</xsl:template>
	
	<xsl:template match="faq:entry" mode="list">
		<li><a href="#{generate-id()}"><xsl:value-of select="@question"/></a></li>
	</xsl:template>
	
	<xsl:template match="faq:entry" mode="detail">
		<div id="{generate-id()}" class="faq-entry">
		<h2><xsl:value-of select="@question"/></h2>
		
		<div class="faq-details">
		<xsl:copy-of select="*"></xsl:copy-of>
		</div>
		
		<a href="#top">Zurück</a>
		
		</div>
	</xsl:template>

	<xsl:template match="/">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
<html>

<head>
	<meta charset="UTF-8" />
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/custom.css" rel="stylesheet" />
	
	<title>MKAT</title>
	
	<script type="text/javascript">
	function selectMenuById ( id ) {
		$('.mkat-menu li').removeClass("active");
		var p = $('.mkat-menu a[href=#'+id+']').parents();
		if ( p.size () == 0 )
			$("#first").addClass("active");
		else
			p.addClass("active");	
	}
	function selectMenu ( ele ) {
		$('.mkat-menu li').removeClass("active");
		ele.parent().addClass("active");	
	}
	</script>
</head>

<body>
	
	<nav class="mkat-nav" role="navigation">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-0 col-md-1 col-lg-2"></div>
				<div class="col-xs-12 col-md-4 col-lg-3 mkat-brand">
				 <img src="images/logo.png" class="img-responsive" />
				</div>
				<div class="col-xs-12 col-md-7 col-lg-7 mkat-menu">
					<ul>
						<li id="faq"><a class="menu-entry" href="index.html">Wer sind wir?</a></li>
				        <li><a class="menu-entry" href="index.html#member">Mitglied werden</a></li>
				        <li><a target="_blank" href="https://buchung.elkato.de/mkat">Zur Buchung</a></li>
				        <li><a class="menu-entry" href="index.html#downloads">Downloads</a></li>
				        <li class="active"><a class="menu-entry" href="">FAQ</a></li>
				        <li><a class="menu-entry" href="index.html#impress">Impressum</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	
	<div id="main" class="container-fluid">
	
	<div class="row">
		<div class="col-xs-12 imagebox">
			 <img src="images/MKAT_web_head_street_1280x365_150101.jpg" class="img-responsive"/>
		</div>
	</div>
	
	<div class="row">
	
	<div class="col-xs-0 col-md-1 col-lg-2"></div>
	
	<div class="col-xs-12 col-md-10 col-lg-8">
	
	<span id="top"></span>

	<div id="faq" class="topic"></div>
		
	
	
		<h2>Übersicht</h2>
		<ul>
		<xsl:apply-templates mode="list"/>
		</ul>
		
		<xsl:apply-templates mode="detail"/>
		
		
	</div><!-- inner -->
	
	</div><!-- row -->
	
	</div><!-- global -->
	
	<script src="js/jquery-1.12.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/waypoints.js"></script>
	
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/jquery.localScroll.js"></script>
	
	<script>
	
	/*
	$( ".menu-entry" ).bind( "click", function() {
		  document.location=this.href;
		  selectMenu ( $(this) );
		  return false;
	});
	*/
	$(".mkat-menu").localScroll ({
		queue: true,
		hash: true,
		duration: 250,
		onAfter: function ( anchor, settings ) {
			console.log (  anchor);
			var id = anchor[0].id;
			console.log ( id );
			selectMenuById ( id );
		}
	});
	
	$('.topic').waypoint({
		handler: function() {
			selectMenuById ( this.id );
		},
		offset: "150px"
	});
	</script>
</body>

</html>
	</xsl:template>
	
	
</xsl:stylesheet>