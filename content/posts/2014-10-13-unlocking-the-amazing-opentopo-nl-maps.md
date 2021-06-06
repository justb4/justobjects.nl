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
The essence of this post is to illustrate via some web-apps the great topographic mapping done by [Jan-Willem van Aalst][10] using Dutch free geo-data. The summary/TL;DR is:

  * [great maps produced from Dutch Open Data][1] by Jan-Willem van Aalst
  * unlocked by me via web tiling services and [simple web apps][2] like [this one][3].

The longer post here below&#8230;

{{< a-img data-href="http://www.swaen.com/mapmaker.php" data-src="/uploads/2014/10/04461.jpg" data-class="float_left" >}}

The Netherlands and Belgium have produced some influential mapmakers throughout history. Up to the 20th century the &#8220;Low Countries&#8221; were part of empires that ruled at the time. Mapmakers could be found in cities like Antwerp, Ghent and Amsterdam. I found [an overview here][4], but there may be more authoritative sources. [Mercator][11], was one of them, unaware  probably of the later [Google Mercator][12] ;-)

Map-making has moved into the digital era. Anyone can render maps from source data, using attributed polygons, lines and points with some styling. Hmm, but there is more to the picture than meets the eye: maps have and always will be a combination of art, science and technology.

&nbsp;

{{< a-img data-href="javascript:return false;" data-src="/uploads/2014/10/ot1-300x215.png" data-class="float_right" >}}

Every mapmaker, now and back then, is dependent on (accurate) map-data. Within the Netherlands we have been fortunate by having multiple free geo-data sources: [OpenStreetMap][6] (with several imports) and since 2012 Dutch topographic and cadastral geospatial [data sources via PDOK][13], plus many others. These data-sources can all be combined, but this endeavour still requires a true mapmaker&#8230;

&nbsp;

&nbsp;

{{< a-img data-href="http://opentopo.nl/" data-src="/uploads/2014/10/combi8-300x245.png" data-caption="Combining data source in OpenTopo (img by JW van Aalst)" data-class="float_left">}}
<!--
<div id="attachment_397" style="width: 310px" class="wp-caption alignleft">
  <a href="http://opentopo.nl/"><img aria-describedby="caption-attachment-397" loading="lazy" class="wp-image-397 size-medium" src="uploads/2014/10/combi8-300x245.png" alt="Combining data source in OpenTopo (img by JW van Aalst)" width="300" height="245" srcset="https://justobjects.nl/wp-content/uploads/2014/10/combi8-300x245.png 300w, https://justobjects.nl/wp-content/uploads/2014/10/combi8-183x150.png 183w, https://justobjects.nl/wp-content/uploads/2014/10/combi8-150x122.png 150w, https://justobjects.nl/wp-content/uploads/2014/10/combi8.png 600w" sizes="(max-width: 300px) 100vw, 300px" /></a>

  <p id="caption-attachment-397" class="wp-caption-text">
    Combining data source in OpenTopo (img by JW van Aalst)
  </p>
</div>
-->

Jan-Willem van Aalst, via his website [OpenTopo][1], tastefully combines Dutch open geo-data sources like [OpenStreetMap][14], Dutch public data sources like: [BRT][15] (topography), [Buildings (BAG)][16] and [&#8220;AHN&#8221;, Dutch height data][17] (yes, we are not that flat!) into detailed and attractive topographic maps. His main editing tool is [QGIS][18]. Producing several resolutions up to 800 pixels/kilometer, the output is rendered as a series of straight [TIFF][19] files in various resolutions (up to 800px/km).

&nbsp;

&nbsp;

{{< a-img data-href="http://app.nlextract.nl/ot/opentopord.html" data-src="/uploads/2014/10/ot3-300x209.png" data-class="float_right">}}

But how to make Jan-Willem&#8217;s results (TIFFs) available online? [The NLExtract project][7] aims to convert Dutch Open Geo-Data to manageable formats by providing tools and other services. For example the raw downloaded GML data for Dutch Address and Building Data (BAG) and the  BRT Top10NL Topography data were first converted to PostGIS tables using the [NLExtract ETL tools][20] for use by Jan-Willem in QGIS.

&nbsp;

&nbsp;

In addition NLExtract provides [downloads of converted and TIFF data and some apps][8] to demonstrate transformation results.

In order to make the OpenTopo maps of Jan-Willem more widely available, I have provided both a tiling (TMS/WMTS) service for the maps plus some simple apps for browsers and mobile devices (tables/smartphones/phablets). These can be found at: [app.nlextract.nl/ot][2], in particular the [OpenTopoMap tiled in Dutch Projection][3]. Thanks to Bart van den Eijnden for the [Leaflet-Proj4s integration][21].

The following steps and technologies have been used within NLExtract to unlock JW&#8217;s raw TIFFs into tiled web services and [demo-apps][2]:

  * Generate Worldfiles from a spreadsheet (by Frank Steggink) with a [small Python program][9].
  * from TIFF+Worldfiles to GeoTIFF: the [NLExtract Topotrans script][22] (using GDAL commands)
  * GeoTIFFs directory to WMS via [GeoServer ImageMosaic][23]
  * WMS to tiles in EPSG:900913 and EPSG:28992 via [GeoWebCache][24] or [MapProxy][25]
  * [map viewing apps][2] built with [Leaflet][26] + [Bart vd E proj4js][21]

The source code for the above is [mostly on GitHub][9]. In a next blog I will dive deeper into the ETL/transformation processes, [introducing Stetl, a generic ETL framework in Python][27].

 [1]: http://opentopo.nl/
 [2]: http://app.nlextract.nl/ot/
 [3]: http://app.nlextract.nl/ot/opentopord.html
 [4]: http://www.swaen.com/mapmaker.php
 [5]: uploads/2014/10/ot1.png
 [6]: http://www.openstreetmap.nl/
 [7]: http://www.nlextract.nl/
 [8]: http://data.nlextract.nl/
 [9]: https://github.com/opengeogroep/NLExtract/tree/master/opentopo/src
 [10]: http://www.imergis.nl/asp/44.asp
 [11]: https://en.wikipedia.org/wiki/Gerardus_Mercator
 [12]: http://spatialreference.org/ref/sr-org/6627/
 [13]: https://www.pdok.nl/nl/producten/downloaden-van-data-pdok
 [14]: http://www.openstreetmap.org/
 [15]: http://nl.wikipedia.org/wiki/Basisregistratie_Topografie
 [16]: http://www.kadaster.nl/bag
 [17]: http://www.ahn.nl/
 [18]: http://www.qgis.org/
 [19]: http://en.wikipedia.org/wiki/Tagged_Image_File_Format
 [20]: http://docs.nlextract.nl/en/latest/
 [21]: https://github.com/bartvde/PDOK-Leaflet

 [22]: https://github.com/opengeogroep/NLExtract/blob/master/opentopo/bin/topotrans.sh
 [23]: http://docs.geoserver.org/stable/en/user/data/raster/imagemosaic.html
 [24]: http://geowebcache.org/
 [25]: http://mapproxy.org/
 [26]: http://leafletjs.com/
 [27]: http://www.stetl.org
