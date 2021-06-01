---
title: Unlocking the amazing OpenTopo.nl Maps
author: Just van den Broecke
type: post
date: 2014-10-13T01:08:08+00:00
url: /unlocking-the-amazing-opentopo-nl-maps/
featured_image: uploads/2014/10/ot3-150x104.png
categories:
  - General
  - osgeo
  - Projects

---
The essence of this post is to illustrate via some web-apps the great topographic mapping done by <a href="http://www.imergis.nl/asp/44.asp" target="_blank">Jan-Willem van Aalst</a> using Dutch free geo-data. The summary/TL;DR is:

  * [great maps produced from Dutch Open Data][1] by Jan-Willem van Aalst
  * unlocked by me via web tiling services and [simple web apps][2] like [this one][3].

The longer post here below&#8230;

[<img loading="lazy" class="alignleft wp-image-377 size-full" src="uploads/2014/10/04461.jpg" alt="04461" width="160" height="171" srcset="https://justobjects.nl/wp-content/uploads/2014/10/04461.jpg 160w, https://justobjects.nl/wp-content/uploads/2014/10/04461-140x150.jpg 140w" sizes="(max-width: 160px) 100vw, 160px" />][4]The Netherlands and Belgium have produced some influential mapmakers throughout history. Up to the 20th century the &#8220;Low Countries&#8221; were part of empires that ruled at the time. Mapmakers could be found in cities like Antwerp, Ghent and Amsterdam. I found <a href="http://www.swaen.com/mapmaker.php" target="_blank">an overview here</a>, but there may be more <span style="color: #222222;">authoritative</span> sources. <a href="Gerardus_Mercator" target="_blank">Mercator</a>, was one of them, unaware  probably of the later <a href="http://spatialreference.org/ref/sr-org/6627/" target="_blank">Google Mercator</a> ;-).

Map-making has moved into the digital era. Anyone can render maps from source data, using attributed polygons, lines and points with some styling. Hmm, but there is more to the picture than meets the eye: maps have and always will be a combination of art, science and technology.

[<img loading="lazy" class="alignright wp-image-378 size-medium" src="uploads/2014/10/ot1-300x215.png" alt="ot1" width="300" height="215" srcset="https://justobjects.nl/wp-content/uploads/2014/10/ot1-300x215.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/ot1-208x150.png 208w, https://justobjects.nl/wp-content/uploads/2014/10/ot1-150x107.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/ot1.png 636w" sizes="(max-width: 300px) 100vw, 300px" />][5]Every mapmaker, now and back then, is dependent on (accurate) map-data. Within the Netherlands we have been fortunate by having multiple free geo-data sources: [OpenStreetMap][6] (with several imports) and since 2012 Dutch topographic and cadastral geospatial <a href="https://www.pdok.nl/nl/producten/downloaden-van-data-pdok" target="_blank">data sources via PDOK</a>, plus many others.  These data-sources can all be combined, but this <span style="color: #222222;">endeavour</span> still requires a true mapmaker&#8230;

&nbsp;

&nbsp;

<div id="attachment_397" style="width: 310px" class="wp-caption alignleft">
  <a href="http://opentopo.nl/"><img aria-describedby="caption-attachment-397" loading="lazy" class="wp-image-397 size-medium" src="uploads/2014/10/combi8-300x245.png" alt="Combining data source in OpenTopo (img by JW van Aalst)" width="300" height="245" srcset="https://justobjects.nl/wp-content/uploads/2014/10/combi8-300x245.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/combi8-183x150.png 183w, https://justobjects.nl/wp-content/uploads/2014/10/combi8-150x122.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/combi8.png 600w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p id="caption-attachment-397" class="wp-caption-text">
    Combining data source in OpenTopo (img by JW van Aalst)
  </p>
</div>

Jan-Willem van Aalst, via his website <a href="http://opentopo.nl/" target="_blank">OpenTopo,</a> tastefully combines Dutch open geo-data sources like <a href="http://www.openstreetmap.org/" target="_blank">OpenStreetMap</a>, Dutch public data sources like: <a href="http://nl.wikipedia.org/wiki/Basisregistratie_Topografie" target="_blank">BRT</a> (topography), <a href="http://www.kadaster.nl/bag" target="_blank">Buildings (BAG)</a> and <a href="http://www.ahn.nl/" target="_blank">&#8220;AHN&#8221;, Dutch height data</a> (yes, we are not that flat!) into detailed and attractive topographic maps. His main editing tool is <a href="http://www.qgis.org/" target="_blank">QGIS</a>. Producing several resolutions up to 800 pixels/kilometer, the output is rendered as a series of straight <a href="http://en.wikipedia.org/wiki/Tagged_Image_File_Format" target="_blank">TIFF</a> files in various resolutions (up to 800px/km).

[<img loading="lazy" class="alignright wp-image-380 " src="uploads/2014/10/ot3-300x209.png" alt="ot3" width="336" height="234" srcset="https://justobjects.nl/wp-content/uploads/2014/10/ot3-300x209.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/ot3-214x150.png 214w, https://justobjects.nl/wp-content/uploads/2014/10/ot3-150x104.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/ot3.png 600w" sizes="(max-width: 336px) 100vw, 336px" />][3]

&nbsp;

But how to make Jan-Willem&#8217;s results (TIFFs) available online? [The NLExtract project][7] aims to convert Dutch Open Geo-Data to manageable formats by providing tools and other services. For example the raw downloaded GML data for Dutch Address and Building Data (BAG) and the  BRT Top10NL Topography data were first converted to PostGIS tables using the <a href="http://docs.nlextract.nl/en/latest/" target="_blank">NLExtract ETL tools</a> for use by Jan-Willem in QGIS.

In addition NLExtract provides [downloads of converted and TIFF data][8] and <a href="http://data.nlextract.nl/" target="_blank">some apps</a> to demonstrate transformation results.

In order to make the OpenTopo maps of Jan-Willem more widely available, I have provided both a tiling (TMS/WMTS) service for the maps plus some simple apps for browsers and mobile devices (tables/smartphones/phablets). These can be found at:  <a href="http://app.nlextract.nl/ot/" target="_blank">app.nlextract.nl/ot</a>, in particular the <a href="http://app.nlextract.nl/ot/opentopord.html" target="_blank">OpenTopoMap tiled in Dutch Projection</a>. Thanks to Bart van den Eijnden for the <a href="https://github.com/bartvde/PDOK-Leaflet" target="_blank">Leaflet-Proj4s integration</a>.

The following steps and technologies have been used within NLExtract to unlock JW&#8217;s raw TIFFs into tiled web services and [demo-apps][2]:

  * Generate Worldfiles from a spreadsheet (by Frank Steggink) with a [small Python program][9].
  * from TIFF+Worldfiles to GeoTIFF: the <a href="https://github.com/opengeogroep/NLExtract/blob/master/opentopo/bin/topotrans.sh" target="_blank">NLExtract Topotrans script</a> (using GDAL commands)
  * GeoTIFFs directory to WMS via <a href="http://docs.geoserver.org/stable/en/user/data/raster/imagemosaic.html" target="_blank">GeoServer ImageMosaic</a>
  * WMS to tiles in EPSG:900913 and EPSG:28992 via <a href="http://geowebcache.org/" target="_blank">GeoWebCache</a> or <a href="http://mapproxy.org/" target="_blank">MapProxy</a>
  * <a href="http://app.nlextract.nl/ot/" target="_blank">map viewing apps</a> built with <a href="http://leafletjs.com/" target="_blank">Leaflet</a> + <a href="https://github.com/bartvde/PDOK-Leaflet" target="_blank">Bart vd E proj4js</a>

The source code for the above is <a href="https://github.com/opengeogroep/NLExtract/tree/master/opentopo" target="_blank">mostly on GitHub</a>. In a next blog I will dive deeper into the ETL/transformation processes, <a href="http://www.stetl.org" target="_blank">introducing Stetl, a generic ETL framework in Python</a>.

 [1]: http://opentopo.nl/
 [2]: http://app.nlextract.nl/ot/
 [3]: http://app.nlextract.nl/ot/opentopord.html
 [4]: http://www.swaen.com/mapmaker.php
 [5]: uploads/2014/10/ot1.png
 [6]: http://www.openstreetmap.nl/
 [7]: http://www.nlextract.nl/
 [8]: http://data.nlextract.nl/
 [9]: https://github.com/opengeogroep/NLExtract/tree/master/opentopo/src